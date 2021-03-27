import 'package:SilentMoon/screen/nav_bar_screens/home.dart';
import 'package:SilentMoon/screen/nav_bar_screens/meditate.dart';
import 'package:SilentMoon/screen/nav_bar_screens/music.dart';
import 'package:SilentMoon/screen/nav_bar_screens/profile/profile.dart';
import 'package:SilentMoon/screen/nav_bar_screens/sleep.dart';
import 'package:SilentMoon/widget/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen == false) {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushNamed('/profile_introduction');
    }
  }

  int _selectedIndex = 0;
  void _onTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    checkFirstSeen();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   checkFirstSeen();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // prevent device orientation changes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: _selectedIndex == 0
          ? Home()
          : _selectedIndex == 1
              ? Sleep()
              : _selectedIndex == 2
                  ? Meditate()
                  : _selectedIndex == 3
                      ? Music()
                      : _selectedIndex == 4
                          ? Profile()
                          : Container(),
      bottomNavigationBar: NavigationBar(
        onTap: this._onTap,
      ),
    );
  }
}
