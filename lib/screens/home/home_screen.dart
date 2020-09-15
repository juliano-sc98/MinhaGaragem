import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/screens/user/user_screen.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            NavItem(
              icon: "assets/icons/manutencao.svg",
              text: "Manutenção",
              press: () {

              },
            ),

            NavItem(
              icon: "assets/icons/carro.svg",
              text: "Cadatro veículo",
              press: () {

              },
            ),

            NavItem(
              icon: "assets/icons/dolar.svg",
              text: "Taxas",
              press: () {

              },
            ),

            NavItem(
              icon: "assets/icons/aviso.svg",
              text: "Multas",
              press: () {

              },
            ),

          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(

        icon: Icon(
          Icons.exit_to_app,
          color: Colors.black,
        ),

        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {

                return AlertDialog(
                  title: Text("Sair"),
                  content: Text("Deseja sair dessa página?"),
                  actions: <Widget>[

                    FlatButton(
                      child: Text("Cancelar"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    FlatButton(
                      child: Text("Sim"),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              }
              );
        },
      ),
      title: Text(
        "Olá Visitante",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[

        IconButton(
            icon: ClipOval(child: Image.asset("assets/images/person.png")),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute
                (builder: (context) => UserScreen()));
            }),

      ],
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
    return Container(
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

          Text(text,
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}