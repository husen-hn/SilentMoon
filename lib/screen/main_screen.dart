import 'package:SilentMoon/screen/nav_bar_screens/home.dart';
import 'package:SilentMoon/screen/nav_bar_screens/meditate.dart';
import 'package:SilentMoon/screen/nav_bar_screens/music.dart';
import 'package:SilentMoon/screen/nav_bar_screens/sleep.dart';
import 'package:SilentMoon/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0
            ? Home()
            : _selectedIndex == 1
                ? Sleep()
                : _selectedIndex == 2
                    ? Meditate()
                    : _selectedIndex == 3
                        ? Music()
                        : Container(),
      ),
      bottomNavigationBar: NavigationBar(
        onTap: this._onTap,
      ),
    );
  }
}
