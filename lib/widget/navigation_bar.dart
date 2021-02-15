import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  Color unselectedLabelColor;
  bool showUnselectedLabels;
  Color bgColor;
  NavigationBar(
      {this.unselectedLabelColor = const Color(0xffA0A3B1),
      this.showUnselectedLabels = true,
      this.bgColor = Colors.white});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: widget.showUnselectedLabels,
      unselectedItemColor: widget.unselectedLabelColor,
      items: <BottomNavigationBarItem>[
        btmNvBarItem(icon: "images/home.png", title: 'Home'),
        btmNvBarItem(icon: "images/sleep.png", title: 'Sleep'),
        btmNvBarItem(icon: "images/meditate.png", title: 'Meditate'),
        btmNvBarItem(icon: "images/music.png", title: 'Music'),
        btmNvBarItem(icon: "images/profile.png", title: 'Profile'),
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
      activeIcon: Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
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
      ),
      backgroundColor: widget.bgColor,
    );
  }
}
