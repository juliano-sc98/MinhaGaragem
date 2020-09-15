import 'package:MinhaGaragem/screens/introduction/introduction_screen.dart';
import 'package:MinhaGaragem/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Minha Garagem",
    home: IntroductionScreen(),
    theme: theme()
    ),
  );
}