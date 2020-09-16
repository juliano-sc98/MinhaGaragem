import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatelessWidget {

  const CustomNavBar(
      {Key key, @required this.icon, @required this.text, @required this.press})
      : super(key: key);

  final String icon;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: getProportionateScreenHeight(75),
        width: getProportionateScreenWidth(93),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [kDefualtShadow],
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(icon, height: 28, color: kPrimaryColor),
            Spacer(),
            Text(
              text,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
