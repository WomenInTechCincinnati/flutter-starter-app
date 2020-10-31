import 'package:flutter/material.dart';
import 'package:flutter_app/values/app_theme.dart';
import 'package:flutter_app/values/strings.dart';
import 'package:flutter_app/ui/home.dart';

class ErrorScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ErrorScreen();
  }

}
int _currentIndex = 0;
class _ErrorScreen extends State<ErrorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        backgroundColor: primaryColorTeal,
      ),
      body: Container (
      alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(20, 200, 20, 20),
        child: Column (
          children: [
            Text(
            Strings.error,
            style: TextStyle(
                fontSize: 20.0, color: primaryTextColor),
            ),
            FlatButton(
            child: Text(Strings.goback),
            color: primaryColorTeal,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            ),
          ]
        ),
      ),
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