import 'package:flutter/material.dart';
import 'package:learnUI/constants/colors.dart';

class ButtonNav extends StatefulWidget {
  @override
  _ButtonNav createState() => _ButtonNav();
}

class _ButtonNav extends State<ButtonNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BottomNavigationBar(
      selectedLabelStyle: TextStyle(fontSize: 0),
      unselectedIconTheme: IconThemeData(color: Color(light)),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(background),
      onTap: _onItemTapped,
    ));
  }
}
