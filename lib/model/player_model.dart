import 'package:SilentMoon/model/audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class PlayerModel {
  final String title;
  final String boxTitle;
  final String url;

  PlayerModel({this.title, this.boxTitle, this.url});
}
