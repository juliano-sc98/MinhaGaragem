import 'package:MinhaGaragem/components/default_button.dart';
import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/screens/home/home_screen.dart';
import 'package:MinhaGaragem/screens/logIn/signUp/signup_screen.dart';
import 'package:MinhaGaragem/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static String routeName = "/log_in";

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: kPrimaryColor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              // ignore: missing_return
              validator: (text) {
                if (text.isEmpty || !text.contains('@'))
                  return "E-mail inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
              // ignore: missing_return
              validator: (text) {
                if (text.isEmpty || text.length < 6) return "Senha inválida!";
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Insira seu e-mail para recuperação!"),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 4),
                    ));
                  } else {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Confira seu e-mail para recuperação!"),
                      backgroundColor: Theme.of(context).primaryColor,
                      duration: Duration(seconds: 4),
                    ));
                  }
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: DefaultButton(
                  text: "Entrar",
                  press: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
