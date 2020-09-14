import 'package:MinhaGaragem/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Color.fromARGB(255, 70, 70, 200)
    ),
  ));
}


