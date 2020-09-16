import 'package:MinhaGaragem/components/custom_nav_bar.dart';
import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/screens/manutencao/maint_screen.dart';
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
      body: Container(
        color: kPrimaryLightColor,
        child: Center(
          child: Container(
            color: kPrimaryLightColor,
            width: MediaQuery.of(context).size.width,
            height: getProportionateScreenHeight(280),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: getProportionateScreenWidth(110),
                    height: getProportionateScreenHeight(110),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/suv.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(
                  "Carro",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
                Text(
                  "Seu carro está em dia com as contas",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomNavBar(
                icon: "assets/icons/manutencao.svg",
                text: "Manutenção",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CarDetails()));
                },
              ),
              CustomNavBar(
                icon: "assets/icons/carro.svg",
                text: "+ Veículo",
                press: () {},
              ),
              CustomNavBar(
                icon: "assets/icons/dolar.svg",
                text: "Taxas",
                press: () {},
              ),
              CustomNavBar(
                icon: "assets/icons/aviso.svg",
                text: "Multas",
                press: () {},
              ),
            ],
          ),
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
              });
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => UserScreen()));
            }),
      ],
    );
  }

}
