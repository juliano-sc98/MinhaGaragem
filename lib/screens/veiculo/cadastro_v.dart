import 'package:MinhaGaragem/components/default_button.dart';
import 'package:MinhaGaragem/model/car_model.dart';
import 'package:MinhaGaragem/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AddVeiculoScreen extends StatefulWidget {
  @override
  _AddVeiculoScreenState createState() => _AddVeiculoScreenState();
}

enum TipoVeiculo { carro, moto }

class _AddVeiculoScreenState extends State<AddVeiculoScreen> {
  final _modeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _placaController = TextEditingController();
  final _renavamController = TextEditingController();
  TipoVeiculo _tipoVeiculo = TipoVeiculo.carro;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Cadastrar Veículo"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<CarModel>(builder: (context, child, model) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: _modeloController,
                  decoration: InputDecoration(hintText: "Modelo"),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return "Campo vazio.";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _marcaController,
                  decoration: InputDecoration(hintText: "Marca"),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return "Campo vazio.";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _placaController,
                  decoration: InputDecoration(hintText: "Placa"),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return "Campo vazio.";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _renavamController,
                  decoration: InputDecoration(hintText: "Código RENAVAM"),
                  keyboardType: TextInputType.number,
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return "Campo vazio.";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                new Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text('Selecione o tipo de veículo',
                            style: TextStyle(fontSize: 21))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Carro',
                          style: new TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: TipoVeiculo.carro,
                          groupValue: _tipoVeiculo,
                          onChanged: (TipoVeiculo value) {
                            setState(() {
                              _tipoVeiculo = value;
                            });
                          },
                        ),
                        Text(
                          'Moto',
                          style: new TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: TipoVeiculo.moto,
                          groupValue: _tipoVeiculo,
                          onChanged: (TipoVeiculo value) {
                            setState(() {
                              _tipoVeiculo = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: DefaultButton(
                      text: "Adicionar Veículo",
                      press: () {
                        if (_formKey.currentState.validate() &&
                            _tipoVeiculo == TipoVeiculo.carro) {
                          Map<String, dynamic> carData = {
                            'modelo': _modeloController.text,
                            'marca': _marcaController.text,
                            'placa': _placaController.text,
                            'renavam': _renavamController.text,
                            'km': null,
                            'consumo': null,
                            'manutencao': null,
                            'calibragem': null,
                            'revisaoKm': null,
                            'revisaoOl': null,
                            'revisaoBl': null,
                            'imagem': null,
                            'tipoVeiculo': 'Carro',
                          };
                          model.addCar(carData);
                        } else if (_formKey.currentState.validate() &&
                            _tipoVeiculo == TipoVeiculo.moto) {
                          Map<String, dynamic> carData = {
                            'modelo': _modeloController.text,
                            'marca': _marcaController.text,
                            'placa': _placaController.text,
                            'renavam': _renavamController.text,
                            'km': null,
                            'consumo': null,
                            'manutencao': null,
                            'calibragem': null,
                            'revisaoKm': null,
                            'revisaoOl': null,
                            'revisaoBl': null,
                            'imagem': null,
                            'tipoVeiculo': 'Moto',
                          };
                          model.addCar(carData);
                        }
                        Navigator.of(context).pop();
                      }),
                ),
              ],
            ),
          );
        }));
  }
}
