import 'package:MinhaGaragem/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class CarModel extends Model {
  UserModel user;

  Map<String, dynamic> carData = Map();

  bool isLoading = false;

  FirebaseUser currentUser;

  static CarModel of(BuildContext context) => ScopedModel.of<CarModel>(context);

  CarModel(this.user) {
    if (user.isLoggedIn()) _loadUser2();
  }

  void _loadUser2() async {
    QuerySnapshot query = await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('car')
        .getDocuments();

    notifyListeners();
  }

  void addCar(Map<String, dynamic> carData) async {
    user.loadUser();

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('car')
        .add(carData);

    notifyListeners();
  }
}
