import 'package:MinhaGaragem/components/custom_nav_bar.dart';
import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/model/user_model.dart';
import 'package:MinhaGaragem/screens/manutencao/maint_screen.dart';
import 'package:MinhaGaragem/screens/user/user_screen.dart';
import 'package:MinhaGaragem/screens/veiculo/cadastro_v.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoped_model/scoped_model.dart';

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
      backgroundColor: kPrimaryLightColor,
      body: ListWheelScrollView(
        itemExtent: 250,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: getProportionateScreenHeight(280),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CarDetails()));
                    },

                    child: Container(
                      width: getProportionateScreenWidth(140),
                      height: getProportionateScreenHeight(140),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/onix.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),

                  Text(
                    "Onix",
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

          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: getProportionateScreenHeight(280),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CarDetails()));
                    },

                    child: Container(
                      width: getProportionateScreenWidth(140),
                      height: getProportionateScreenHeight(140),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/renegade.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),

                  Text(
                    "Renegade",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text(
                    "Seu carro está com o IPVA atrasado",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.red,
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: getProportionateScreenHeight(280),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CarDetails()));
                    },

                    child: Container(
                      width: getProportionateScreenWidth(140),
                      height: getProportionateScreenHeight(140),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/biz125.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),

                  Text(
                    "Biz",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text(
                    "Sua moto está em dia com as contas",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomNavBar(),
    );
  }

  AppBar buildAppBar() {

    return AppBar(
      backgroundColor: kPrimaryColor,

      leading: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {

            return IconButton(
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
                              model.signOut();
                            },
                          )

                        ],
                      );
                    }
                );
              },
            );
          }
      ),

      title: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){

            return Text(
              "Olá, ${!model.isLoggedIn() ? "" : model.userData['name']}",
              style: TextStyle(color: Colors.black),
            );

          }
      ),

      centerTitle: true,
      elevation: 0,
      actions: <Widget>[

        ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return IconButton(
              icon: ClipOval(child: Image.asset("assets/images/person.png")),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => UserScreen()));
              }
            );
          }
        ),
      ],
    );
  }
}