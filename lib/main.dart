import 'package:MinhaGaragem/screens/introduction/introduction_screen.dart';
import 'file:///C:/Users/Juliano/Desktop/Unisul/MinhaGaragem/lib/screens/logIn/login_screen.dart';
import 'package:MinhaGaragem/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Minha Garagem",
    home: IntroductionScreen(),
    theme: theme()
    //initialRoute: Introduction.routeName,
    //routes: routes,
    ),
  );
}