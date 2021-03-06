import 'package:SilentMoon/screen/main_screen.dart';
import 'package:SilentMoon/screen/play_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map arguament = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/play_list':
        return MaterialPageRoute(
            builder: (_) => PlayList(
                  title: arguament["title"],
                  type: arguament["type"],
                ));

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
