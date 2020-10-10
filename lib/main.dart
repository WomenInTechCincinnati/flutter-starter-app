import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home.dart';
import 'package:flutter_app/values/variants.dart';

import 'app/app_provider.dart';

void main() {
  runApp(AppProvider(
    variant: Variant.development(),
    child: MaterialApp(
      title: 'WWCode Cincinnati',
      home: Home(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WWCode Cincinnati',
      home: Home(),
    );
  }
}