import 'package:MinhaGaragem/model/car_model.dart';
import 'package:MinhaGaragem/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';

class TicketModel extends Model {
  UserModel user;

  CarModel car;

  var uid = Uuid();

  String id;

  Map<String, dynamic> ticketData = Map();

  static TicketModel of(BuildContext context) => ScopedModel.of<TicketModel>(context);

  TicketModel(this.user) {
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

  void addTicket(Map<String, dynamic> debitData) {
    user.loadUser();
    car.loadCar();
    createId();

    Firestore.instance
      .collection('users')
      .document(user.firebaseUser.uid)
      .collection('car')
      .document(car.getId())
      .collection('ticket')
      .document(id)
      .setData(ticketData);

    notifyListeners();
  }

  String createId() {
    id = uid.v1();
    return id;
  }

  String getId() {
    return id;
  }


}