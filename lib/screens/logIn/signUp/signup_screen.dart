import 'package:MinhaGaragem/components/default_button.dart';
import 'package:MinhaGaragem/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

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
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );

        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "Nome"),
                validator: (text) {
                  if (text.isEmpty)
                    return "Nome inválido!";
                  else if (text.length > 25)
                    return "Coloque seu sobrenome na linha a baixo";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(hintText: "Sobrenome"),
                validator: (text) {
                  if (text.isEmpty)
                    return "Sobrenome inválido!";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                inputFormatters: [maskFormatter],
                controller: _cpfController,
                decoration:
                InputDecoration(hintText: "CPF - somente os números"),
                keyboardType: TextInputType.number,
                validator: (text) {
                  if (text.isEmpty)
                    return "CPF inválido!";
                  else if (text.length > 14)
                    return "Digite somente os 11 caracteres";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || !text.contains('@'))
                    return "E-mail inválido!";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty)
                      return "Senha inválido!";
                    else if (text.length < 6)
                      return "Crie uma senha com 6 ou mais caracteres";
                    else
                      return null;
                  }),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 44.0,
                child: DefaultButton(
                    text: "Criar Conta",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          'name': _nameController.text,
                          'lastName': _lastNameController.text,
                          'cpf': _cpfController.text,
                          'email': _emailController.text
                        };

                        model.signUp(
                            userData: userData,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      }
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });

    _resetFields();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao criar usuário!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _resetFields() {
    _nameController.text = "";
    _lastNameController.text = "";
    _cpfController.text = "";
    _emailController.text = "";
    _passController.text = "";
  }
}
