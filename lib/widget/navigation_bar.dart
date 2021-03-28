import 'package:SilentMoon/generated/l10n.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  Color unselectedLabelColor;
  bool showUnselectedLabels;
  Color bgColor;
  Function onTap;
  NavigationBar(
      {this.unselectedLabelColor = const Color(0xffA0A3B1),
      this.showUnselectedLabels = true,
      this.bgColor = Colors.white,
      this.onTap});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      widget.onTap(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // S.of(context).login;
    return BottomNavigationBar(
      showUnselectedLabels: widget.showUnselectedLabels,
      unselectedItemColor: widget.unselectedLabelColor,
      items: <BottomNavigationBarItem>[
        btmNvBarItem(icon: "images/home.png", title: S.of(context).home),
        btmNvBarItem(icon: "images/sleep.png", title: S.of(context).sleep),
        btmNvBarItem(
            icon: "images/meditate.png", title: S.of(context).meditate),
        btmNvBarItem(icon: "images/music.png", title: S.of(context).music),
        btmNvBarItem(icon: "images/profile.png", title: S.of(context).profile),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff8E97FD),
      onTap: _onItemTapped,
    );
  }

  BottomNavigationBarItem btmNvBarItem(
      {icon = "images/home.png",
      Color iconColor = const Color(0xffA0A3B1),
      double iconPadding = 8.0,
      String title = 'title',
      Color selectedBoxbg = const Color(0xff8E97FD),
      Color selectedIconColor = Colors.white}) {
    return BottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.all(iconPadding),
          child: ImageIcon(
            AssetImage(icon),
            color: iconColor,
          )),
      label: title,
      activeIcon: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
          child: Container(
            color: selectedBoxbg,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                AssetImage(icon),
                color: selectedIconColor,
              ),
            ),
          )),
      backgroundColor: widget.bgColor,
    );
  }
}
