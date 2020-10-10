import 'package:flutter/material.dart';
import 'package:flutter_app/ui/contact/contact_screen.dart';
import 'package:flutter_app/ui/members/members_screen.dart';
import 'package:flutter_app/ui/quotes/quotes_screen.dart';
import 'package:flutter_app/ui/resources/resource_screen.dart';
import 'package:flutter_app/values/app_theme.dart';
import 'package:flutter_app/values/strings.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    MembersScreen(),
    QuotesScreen(),
    ResourceScreen(),
    ContactScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        backgroundColor: primaryColorTeal,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColorTeal,
        unselectedItemColor: primaryColorLight,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.people_outline),
            label: Strings.members,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat_bubble_outline),
            label: Strings.quotes,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.laptop_chromebook),
              label: Strings.resources,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.alternate_email),
              label: Strings.contact
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}