part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class Play extends PlayerEvent {
  final String url;
  Play(this.url);
}

class Times extends PlayerEvent {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;

  Times({
    @required this.currentTime,
    @required this.completeTime,
    @required this.currentSecond,
    @required this.completeSecond,
  });
}

class Completion extends PlayerEvent {
  final String currentTime;
  final String completeTime;
  final int currentSecond;
  final int completeSecond;
  final bool isComplete;

  Completion({
    @required this.currentTime,
    @required this.completeTime,
    @required this.currentSecond,
    @required this.completeSecond,
    @required this.isComplete,
  });
}

class Stop extends PlayerEvent {}

class Error extends PlayerEvent {
  final String message;
  Error({@required this.message});
}
