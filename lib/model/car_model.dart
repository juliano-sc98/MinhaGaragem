import 'package:MinhaGaragem/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';

class CarModel extends Model {
  UserModel user;

  Map<String, dynamic> carData = Map();

  var uid = Uuid();

  String id;

  static CarModel of(BuildContext context) => ScopedModel.of<CarModel>(context);

  CarModel(this.user) {
    if (user.isLoggedIn()) _loadUser();
  }

  void _loadUser() async {
    await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('car')
        .getDocuments();

    notifyListeners();
  }

  void addCar(Map<String, dynamic> carData) async {
    user.loadUser();
    createId();

    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('car')
        .document(id)
        .setData(carData);

    notifyListeners();
  }

  String createId() {
    id = uid.v1();
    return id;
  }

  String getId() {
    return id;
  }

  void loadCar() async {
    return _loadCurrentCar();
  }

  Future<Null> _loadCurrentCar() async {
    DocumentSnapshot docCar = await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('car')
        .document(id)
        .get();
    carData = docCar.data;
  }

}
