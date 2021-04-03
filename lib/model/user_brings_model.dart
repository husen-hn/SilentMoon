import 'package:flutter/cupertino.dart';

class UserBringsModel {
  final String title;
  final Color titleColor;
  final AssetImage imgAsset;
  final Color bgColor;

  UserBringsModel(
      {@required this.title,
      @required this.titleColor,
      @required this.imgAsset,
      @required this.bgColor});
}
