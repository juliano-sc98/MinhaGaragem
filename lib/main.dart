import 'package:MinhaGaragem/model/user_model.dart';
import 'package:MinhaGaragem/screens/introduction/introduction_screen.dart';
import 'package:MinhaGaragem/theme.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModel<UserModel>(

      model: UserModel(),
      child: MaterialApp(
        title: "Minha Garagem",
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: IntroductionScreen(),
      ),
    );
  }
}