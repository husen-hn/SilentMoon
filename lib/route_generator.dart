import 'package:feedTest/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguament = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
