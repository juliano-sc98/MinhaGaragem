import 'package:flutter/material.dart';

class MultaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Multas'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Vencidas (1)",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[200]),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'ESTACIONAR EM LOCAL PROIBIDO (02/10/20)',
                  ),
                  children: <Widget>[
                    ListTile(
                      tileColor: Colors.red[200],
                      leading: Icon(Icons.warning),
                      title: Text('Status'),
                      subtitle: Text('VENCIDA'),
                    ),
                    ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text('Valor'),
                      subtitle: Text('104,13'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('5550'),
                      title: Text('Código da Infração'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('281050 - Pref. de SC Florianópolis'),
                      title: Text('Órgão Atuador'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('Rua Esteves Júnior'),
                      title: Text('Local'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('02/10/2020 as 09:26'),
                      title: Text('Data/Hora do Cometimento'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('04/10/2020'),
                      title: Text('Data da Notificação da Autuação'),
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Pagas (2)",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'ESTACIONAR EM LOCAL PROIBIDO (02/10/20)',
                  ),
                  children: <Widget>[
                    ListTile(
                      tileColor: Colors.red[200],
                      leading: Icon(Icons.warning),
                      title: Text('Status'),
                      subtitle: Text('VENCIDA'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
