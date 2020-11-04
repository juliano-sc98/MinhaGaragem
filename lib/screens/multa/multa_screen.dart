import 'package:MinhaGaragem/screens/multa/multa_details.dart';
import 'package:flutter/material.dart';

class MultaScreen extends StatelessWidget {
  const MultaScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Expansion View',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MultaDetails()));
                    },
                    child: Text('ExpansionTile'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
