import 'file:///C:/Users/Juliano/Desktop/Unisul/MinhaGaragem/lib/screens/logIn/login_screen.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Olá"),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[

          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute
              (builder: (context) => LoginScreen()));
          }
          ),
        ],
      ),

    //body:
    );
  }
}
