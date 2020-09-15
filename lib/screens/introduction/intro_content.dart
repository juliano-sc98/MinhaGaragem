import 'package:flutter/material.dart';

import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/size_config.dart';

class IntroContent extends StatelessWidget {

  const IntroContent({Key key, this.text, this.image}) : super(key : key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Spacer(),

        Text("Minha Garagem",
          style: TextStyle(
          fontSize: getProportionateScreenWidth(36),
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          ),
        ),

        Text(text, textAlign: TextAlign.center,),

        Spacer(flex: 2,),

        Image.asset(image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(265),
        ),
      ],
    );
  }
}
