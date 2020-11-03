import 'package:MinhaGaragem/screens/introduction/body.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );

  }
}
