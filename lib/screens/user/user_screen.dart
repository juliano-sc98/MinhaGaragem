import 'package:MinhaGaragem/constants.dart';
import 'package:MinhaGaragem/model/user_model.dart';
import 'package:MinhaGaragem/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();

  final _nameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();

  bool _userEdited = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {

            _nameController.text = model.userData['name'];
            _lastNameController.text = model.userData['lastName'];
            _cpfController.text = model.userData['cpf'];
            _emailController.text = model.userData['email'];

            return Scaffold(

              appBar: AppBar(

                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left, color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute
                      (builder: (context) => HomeScreen()));
                  },
                ),

                backgroundColor: kPrimaryColor,
                title: Text(
                  "Olá, ${model.userData['name']}",
                  style: TextStyle(color: Colors.black),
                ),

                centerTitle: true,
              ),

              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (_nameController.text.isEmpty)
                    FocusScope.of(context).requestFocus(_nameFocus);
                  else if (_lastNameController.text.isEmpty)
                    FocusScope.of(context).requestFocus(_lastNameFocus);
                  else if (_emailController.text.isEmpty)
                    FocusScope.of(context).requestFocus(_emailFocus);
                  else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute
                      (builder: (context) => HomeScreen()));
                    model.updateUser();
                  }
                },
                child: Icon(Icons.save),
                backgroundColor: kPrimaryColor,

              ),

              body: SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[

                    GestureDetector(
                      child: Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/person.png"),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                      onTap: () {

                      },
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        controller: _nameController,
                        focusNode: _nameFocus,
                        decoration: InputDecoration(labelText: "Nome",),
                        onChanged: (text) {
                          _userEdited = true;
                          setState(() {
                            model.userData['name'] = text;
                          });
                        },
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        controller: _lastNameController,
                        focusNode: _lastNameFocus,
                        decoration: InputDecoration(labelText: "Sobrenome",),
                        onChanged: (text) {
                          _userEdited = true;
                          setState(() {
                            model.userData['lastName'] = text;
                          });
                        },
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        controller: _cpfController,
                        decoration: InputDecoration(labelText: "CPF"),
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          _userEdited = true;
                          setState(() {
                            model.userData['cpf'] = text;
                          });
                        },
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {
                          _userEdited = true;
                          setState(() {
                            model.userData['email'] = text;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }

  Future<bool> _requestPop() {
    if(_userEdited) {
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar alterações?"),
              content: Text("Se sair, as alterações serão perdidas"),
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
                ),
              ],
            );
          }
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

}


