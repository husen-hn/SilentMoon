import 'package:hive/hive.dart';
part 'audio.g.dart';

@HiveType(typeId: 0)
class Audio extends HiveObject {
  @HiveField(0)
  String audioName;

  @HiveField(1)
  String audioUrl;

  Audio({this.audioName, this.audioUrl});
}
