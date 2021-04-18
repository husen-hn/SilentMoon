import 'dart:async';

import 'package:SilentMoon/model/audio.dart';
import 'package:SilentMoon/model/player_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  AudioPlayer _audioplayer = AudioPlayer();

  bool _isPlaying = false;
  bool _played = false;
  bool _isComplete = false;
  String _currenttime = "0:00:00";
  String _beforeCurrentTime = "0:00:00";
  String _completetime = "0:00:00";
  int _currentSecond = 0;
  int _completeSecond = 120;

  PlayerBloc() : super(PlayerInitial());
  @override
  Stream<PlayerState> mapEventToState(
    PlayerEvent event,
  ) async* {
    // get current audio seconds
    _audioplayer.onAudioPositionChanged.listen((Duration duration) {
      _currenttime = duration.toString().split(".")[0];
      _currentSecond =
          _timeToSecondFormatter(duration.toString().split(".")[0]);

      // just check it for yielding per seconds not miliseconds.
      if (duration.toString().split(".")[0] != _beforeCurrentTime) {
        add(Times(
            completeTime: _completetime,
            currentTime: _currenttime,
            completeSecond: _completeSecond,
            currentSecond: _currentSecond));
      }

      _beforeCurrentTime = _currenttime;
    });

    // get complete audio seconds
    _audioplayer.onDurationChanged.listen((Duration duration) {
      _completetime = duration.toString().split(".")[0];
      _completeSecond =
          _timeToSecondFormatter(duration.toString().split(".")[0]);
    });

    _audioplayer.onPlayerCompletion.listen((event) {
      _isPlaying = false;
      add(Completion(
          currentTime: _currenttime,
          completeTime: _completetime,
          currentSecond: _currentSecond,
          completeSecond: _completeSecond,
          isComplete: true));
    });

    _audioplayer.onPlayerError.listen((event) {
      Error(message: event);
    });

    if (event is Play) {
      /** 
     * in the first time if u press btn : start to load music (check with _isPlaying)
     * in the second time if again press btn : resume/pause music (check with _played)
    */
      if (_isPlaying) {
        // pause
        if (_played) {
          try {
            int status = await _audioplayer.pause();
            if (status == 1) {
              _played = false;
              yield PlayerPause(
                  completeTime: _completetime,
                  currentTime: _currenttime,
                  completeSecond: _completeSecond,
                  currentSecond: _currentSecond);
            }
          } catch (e) {
            PlayerError(message: e.toString());
          }
        }
        // resume
        else {
          try {
            int status = await _audioplayer.resume();
            if (status == 1) {
              _played = true;
              yield PlayerResume(
                  completeTime: _completetime,
                  currentTime: _currenttime,
                  completeSecond: _completeSecond,
                  currentSecond: _currentSecond);
            }
          } catch (e) {
            PlayerError(message: e.toString());
          }
        }
      }
      // start audio from 0
      else {
        try {
          yield (PlayerLoading(
              currentTime: _currenttime,
              completeTime: _completetime,
              currentSecond: _currentSecond,
              completeSecond: _completeSecond));

          int status = await _audioplayer.play(event.url, stayAwake: true);

          if (status == 1) {
            _isPlaying = true;
            _played = true;

            yield (PlayerRunning(
                currentTime: _currenttime,
                completeTime: _completetime,
                currentSecond: _currentSecond,
                completeSecond: _completeSecond,
                isComplete: false,
                isPlaying: true));
          }
        } catch (e) {
          PlayerError(message: e.toString());
        }
      }
    }
    // for yield times of audio
    else if (event is Times) {
      try {
        yield (PlayerRunning(
            currentTime: event.currentTime,
            completeTime: event.completeTime,
            currentSecond: event.currentSecond,
            completeSecond: event.completeSecond,
            isComplete: false,
            isPlaying: true));
      } catch (e) {
        PlayerError(message: e.toString());
      }
    } else if (event is Completion) {
      yield PlayerRunning(
          currentTime: event.currentTime,
          completeTime: event.completeTime,
          currentSecond: event.currentSecond,
          completeSecond: event.completeSecond,
          isComplete: event.isComplete);
    } else if (event is Stop) {
      try {
        int status = await _audioplayer.stop();
        if (status == 1) {
          yield PlayerStop();
        }
      } catch (e) {
        PlayerError(message: e.toString());
      }
    } else if (event is Error) {
      yield PlayerError(message: event.message);
    }
    // check the audio is favorite or not
    else if (event is CheckFavorite) {
      var box = await Hive.openBox<Audio>('${event.audioInfo.boxTitle}Fav');

      List _audio = box.values
          .where((item) => item.audioName == event.audioInfo.title)
          .toList();

      yield _audio.isEmpty ? FavoriteChecking(false) : FavoriteChecking(true);
    }
    // set audio to favorite list and if right now exist on this list so delete it from list.
    else if (event is SetFavorite) {
      var box = await Hive.openBox<Audio>('${event.audioInfo.boxTitle}Fav');

      if (event.isFav) {
        List _audio = box.values
            .where((item) => item.audioName == event.audioInfo.title)
            .toList();
        _audio[0].delete();
      } else {
        Audio _audio = Audio(
            audioName: event.audioInfo.title, audioUrl: event.audioInfo.url);
        box.add(_audio);
      }
      yield FavoriteChecking(!event.isFav);
    }
  }

  int _timeToSecondFormatter(String duration) {
    List<String> times = duration.split(":");

    final int seconds = Duration(
            hours: int.parse(times[0]),
            minutes: int.parse(times[1]),
            seconds: int.parse(times[2]))
        .inSeconds;

    return seconds;
  }
}
