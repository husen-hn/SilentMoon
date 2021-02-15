import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  Color unselectedLabelColor;
  bool showUnselectedLabels;
  NavigationBar(
      {this.unselectedLabelColor = const Color(0xffA0A3B1),
      this.showUnselectedLabels = true});
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
      showUnselectedLabels: true,
      unselectedItemColor: widget.unselectedLabelColor,
      items: <BottomNavigationBarItem>[
        btmNvBarItem(icon: Icons.home_outlined, title: 'Home'),
        btmNvBarItem(icon: Icons.nights_stay_outlined, title: 'Sleep'),
        btmNvBarItem(icon: Icons.donut_small_outlined, title: 'Meditate'),
        btmNvBarItem(icon: Icons.music_note_outlined, title: 'Music'),
        btmNvBarItem(icon: Icons.person_outline, title: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff8E97FD),
      onTap: _onItemTapped,
    );
  }

  BottomNavigationBarItem btmNvBarItem({
    icon = Icons.rounded_corner,
    Color iconColor = const Color(0xffA0A3B1),
    double iconPadding = 8.0,
    String title = 'title',
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.all(iconPadding),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      label: title,
      activeIcon: Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            child: Icon(Icons.home)),
      ),
    );
  }
}
