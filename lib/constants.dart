import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 23, 134, 236);
const kPrimaryLightColor = Color.fromARGB(255, 120, 187, 255);
const kSecondaryLightColor = Color.fromARGB(130, 120, 187, 255);
const kBackColor = Color.fromARGB(150, 191, 191, 191);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Insira seu E-mail";
const String kInvalidEmailError = "Insira um E-mail válido";
const String kPassNullError = "Insira sua senha";
const String kShortPassError = "Senha muito curta";
const String kMatchPassError = "Senhas diferentes";
const String kNamelNullError = "Insira seu nome";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

final kDefualtShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: Color(0xFFE9E9E9).withOpacity(0.56),
);
