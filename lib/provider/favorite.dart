// import 'package:SilentMoon/model/audio.dart';
// import 'package:SilentMoon/model/player_model.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class Favorite extends ChangeNotifier {
//   PlayerModel args;
//   Favorite(this.args);

//   List checkFavorite(String title) {
//     Box<Audio> _box = args.hiveBox;
//     return _box.values.where((item) => item.audioName == title).toList();
//   }

//   deleteFavorite(String title) {
//     Box<Audio> _box = args.hiveBox;
//     List _audio = _box.values.where((item) => item.audioName == title).toList();
//     _audio[0].delete();
//     notifyListeners();
//   }

//   addFavorite(String title, String url) {
//     Box<Audio> _box = args.hiveBox;
//     Audio _audio = Audio(audioName: title, audioUrl: url);
//     _box.add(_audio);
//     notifyListeners();
//   }
// }
