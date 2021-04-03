import 'package:SilentMoon/main.dart';
import 'package:SilentMoon/screen/main_screen.dart';
import 'package:SilentMoon/screen/nav_bar_screens/profile/about_us.dart';
import 'package:SilentMoon/screen/onBoarding/onboarding_page_view.dart';
import 'package:SilentMoon/screen/nav_bar_screens/profile/recent_changes.dart';
import 'package:SilentMoon/screen/play_list.dart';
import 'package:SilentMoon/screen/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguament = settings.arguments;

    switch (settings.name) {
      case '/restart':
        return MaterialPageRoute(builder: (_) => SilentMoonApp());
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/play_list':
        return MaterialPageRoute(
            builder: (_) => PlayList(
                  playListArgs: arguament,
                ));
      case '/profile_recent_changes':
        return MaterialPageRoute(builder: (_) => RecentChanges());
      case '/profile_about_us':
        return MaterialPageRoute(builder: (_) => AboutUs());
      case '/profile_introduction':
        return MaterialPageRoute(builder: (_) => OnBoardingPageView());
      case '/sound_player':
        return MaterialPageRoute(
            builder: (_) => Player(
                  soundPlayArgs: arguament,
                ));

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
