part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isFavorite;

  PlayerInitial(
      {this.currentTime = "0:00:00",
      this.completeTime = "0:00:00",
      this.currentSecond = 0,
      this.completeSecond = 120,
      this.isFavorite = false});
}

class PlayerLoading extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isFavorite;

  PlayerLoading(
      {@required this.currentTime,
      @required this.completeTime,
      @required this.currentSecond,
      @required this.completeSecond,
      this.isFavorite = false});
}

class PlayerRunning extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isComplete;
  final bool isPlaying;
  final bool isFavorite;

  PlayerRunning(
      {@required this.currentTime,
      @required this.completeTime,
      @required this.currentSecond,
      @required this.completeSecond,
      @required this.isComplete,
      this.isPlaying = false,
      this.isFavorite = false});
}

class PlayerPause extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isFavorite;

  PlayerPause(
      {@required this.currentTime,
      @required this.completeTime,
      @required this.currentSecond,
      @required this.completeSecond,
      this.isFavorite = false});
}

class PlayerResume extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isFavorite;

  PlayerResume(
      {@required this.currentTime,
      @required this.completeTime,
      @required this.currentSecond,
      @required this.completeSecond,
      this.isFavorite = false});
}

class PlayerStop extends PlayerState {}

class PlayerError extends PlayerState {
  final String message;

  PlayerError({
    @required this.message,
  });
}

class FavoriteChecking extends PlayerState {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isComplete;
  final bool isPlaying;
  final bool isFavorite;
  FavoriteChecking(
      {@required this.currentTime,
      @required this.completeTime,
      @required this.currentSecond,
      @required this.completeSecond,
      @required this.isComplete,
      this.isPlaying = false,
      this.isFavorite = false});
}
