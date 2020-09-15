import 'package:MinhaGaragem/screens/introduction/body.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  static String routeName = "/introduction";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
