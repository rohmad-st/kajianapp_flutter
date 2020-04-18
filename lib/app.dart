import 'package:flutter/material.dart';
import 'screens/home.dart';

class HomepageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kajian Series',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.blue, accentColor: Colors.blueAccent),
      home: Home(),
    );
  }
}
