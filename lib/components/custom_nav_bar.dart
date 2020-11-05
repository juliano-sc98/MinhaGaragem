import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/screens/debito/debito_screen.dart';
import 'package:MinhaGaragem/screens/manutencao/maint_screen.dart';
import 'package:MinhaGaragem/screens/multa/multa_details.dart';
import 'package:MinhaGaragem/screens/veiculo/cadastro_v.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavItem(
              icon: "assets/icons/manutencao.svg",
              text: "Manutenção",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CarDetails()));
              },
            ),
            NavItem(
              icon: "assets/icons/carro.svg",
              text: "+ Veículo",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddVeiculoScreen()));
              },
            ),
            NavItem(
              icon: "assets/icons/dolar.svg",
              text: "Taxas",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DebitoScreen()));
              },
            ),
            NavItem(
              icon: "assets/icons/aviso.svg",
              text: "Multas",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MultaDetails()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem(
      {Key key, @required this.icon, @required this.text, @required this.press})
      : super(key: key);

  final String icon;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            ),
          ],
        ),
      ),
    );
  }
}
