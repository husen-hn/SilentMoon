import 'package:flutter/cupertino.dart';

class RecentChangesModel {
  final String version;
  final List<String> changes;
  RecentChangesModel({@required this.version, @required this.changes});
}
