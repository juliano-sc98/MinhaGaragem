import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),

      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Nome Completo"
              ),
              // ignore: missing_return
              validator: (text) {
                if(text.isEmpty) return "Nome inválido!";
              },
            ),

            SizedBox(height: 16.0,),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
              // ignore: missing_return
              validator: (text) {
                if(text.isEmpty || !text.contains('@')) return "E-mail inválido!";
              },
            ),

            SizedBox(height: 16.0,),
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true,
              // ignore: missing_return
              validator: (text) {
                if (text.isEmpty) {
                  return "Senha inválido!";
                } else if (text.length < 6) {
                  return "Crie uma senha com 6 ou mais caracteres";
                }
              }
            ),

            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text("Criar conta",
                style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  /*
                  * criar usuario no db
                  *
                  *
                  * */
                }),
            ),

          ],
        )),
    );
  }
}

