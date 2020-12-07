import 'package:MinhaGaragem/components/default_button.dart';
import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/screens/introduction/intro_content.dart';
import 'package:MinhaGaragem/screens/logIn/login_screen.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;

  List<Map<String, String>> data = [
    {
      "text": "Bem vindo ao Minha Garagem! Seu carro ficará seguro conosco.",
      "image": "assets/images/logo.png"
    },
    {
      "text": "Acompanhe a manutenção do seu carro",
      "image": "assets/images/manut.png"
    },
    {
      "text": "Fique em dia com seus débitos",
      "image": "assets/images/boleto.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => IntroContent(
                  image: data[index]['image'],
                  text: data[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          data.length, (index) => buildDot(index: index)),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continuar",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5.0),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
