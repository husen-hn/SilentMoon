part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;

  PlayerInitial({
    this.currentTime = "0:00:00",
    this.completeTime = "0:00:00",
    this.currentSecond = 0,
    this.completeSecond = 120,
  });
}

class PlayerLoading extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;

  PlayerLoading({
    @required this.currentTime,
    @required this.completeTime,
    @required this.currentSecond,
    @required this.completeSecond,
  });
}

class PlayerRunning extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isComplete;
  final bool isPlaying;

  PlayerRunning(
      {@required this.currentTime,
      @required this.completeTime,
      @required this.currentSecond,
      @required this.completeSecond,
      @required this.isComplete,
      this.isPlaying = false});
}

class PlayerPause extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;

  PlayerPause({
    @required this.currentTime,
    @required this.completeTime,
    @required this.currentSecond,
    @required this.completeSecond,
  });
}

class PlayerResume extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;

  PlayerResume({
    @required this.currentTime,
    @required this.completeTime,
    @required this.currentSecond,
    @required this.completeSecond,
  });
}

class PlayerStop extends PlayerState {}

class PlayerError extends PlayerState {
  final String message;

  PlayerError({
    @required this.message,
  });
}
