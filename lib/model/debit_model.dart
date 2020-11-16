import 'package:MinhaGaragem/model/car_model.dart';
import 'package:MinhaGaragem/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class DebitModel extends Model {
  UserModel user;

  CarModel car;

  Map<String, dynamic> debitData = Map();

  static DebitModel of(BuildContext context) => ScopedModel.of<DebitModel>(context);

  DebitModel(this.user) {
    if(user.isLoggedIn()) _loadUser();
  }

  void _loadUser() async {
    await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('car')
        .document(car.getId())
        .collection('debit').getDocuments();
  }


}