
import 'package:flutter/material.dart';
import 'package:flutter_app/values/app_theme.dart';
import 'package:flutter_app/values/strings.dart';


class ErrorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: primaryColorWhite,
      body: new Center (

        child: new Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container (
              child: new Image.asset(
                'assets/wwcode-launcher-icon.png',
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),

            Text(
              Strings.error,
              style: TextStyle(
              fontSize: 20.0, color: primaryTextColor),
            ),

          ]

        ),

      ),

    );
  }
}

