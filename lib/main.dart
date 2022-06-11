import 'package:flutter/material.dart';
import 'package:onlinetest/screens/login_page.dart';
import 'package:onlinetest/screens/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}



