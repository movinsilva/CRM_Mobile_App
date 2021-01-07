import 'package:crm/screens/home.dart';
import 'package:crm/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login" : (context) => Login(),
        "/home" : (context) => Home(),
      },
      home: Login(),
    );
  }
}


