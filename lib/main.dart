import 'package:MinhaGaragem/screens/introduction/introduction_screen.dart';
import 'package:MinhaGaragem/screens/manutencao/maint_screen.dart';
import 'package:MinhaGaragem/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Minha Garagem",
        home: MyApp(),
        theme: theme()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen();
  }
}
