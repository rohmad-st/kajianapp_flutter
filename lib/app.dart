import 'package:flutter/material.dart';
import 'screens/home.dart';

class ChapterListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Series Kajian',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.blue, accentColor: Colors.blueAccent),
      home: Home(),
    );
  }
}
