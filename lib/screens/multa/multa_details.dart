import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MultaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Multas'),
      ),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    color: Colors.red),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'ESTACIONAR EM LOCAL PROIBIDO (02/10/20)',
                  ),
                  children: <Widget>[
                    ListTile(
                      hoverColor: Colors.red[200],
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
                      leading:
                          Icon(CommunityMaterialIcons.file_document_multiple),
                      subtitle: Text('5550'),
                      title: Text('Código da Infração'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('281050 - Pref. de SC Florianópolis'),
                      title: Text('Órgão Atuador'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.google_maps),
                      subtitle: Text('Rua Esteves Júnior'),
                      title: Text('Local'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.calendar_clock),
                      subtitle: Text('02/10/2020 as 09:26'),
                      title: Text('Data/Hora do Cometimento'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.calendar_edit),
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
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[300]),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'TRANSITAR EM VELOCIDADE SUPERIOR A MAXIMA PERMITIDA EM ATE 20% (14/04/20)',
                  ),
                  children: <Widget>[
                    ListTile(
                      hoverColor: Colors.green[200],
                      leading: Icon(CommunityMaterialIcons.check),
                      title: Text('Status'),
                      subtitle: Text('PAGA'),
                    ),
                    ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text('Valor'),
                      subtitle: Text('130,16'),
                    ),
                    ListTile(
                      leading:
                          Icon(CommunityMaterialIcons.file_document_multiple),
                      subtitle: Text('745-50'),
                      title: Text('Código da Infração'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('281050 - Pref. de SC Florianópolis'),
                      title: Text('Órgão Atuador'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.google_maps),
                      subtitle: Text('Rua Conselheiro Mafra'),
                      title: Text('Local'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.calendar_clock),
                      subtitle: Text('14/04/2020 as 13:42'),
                      title: Text('Data/Hora do Cometimento'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.calendar_edit),
                      subtitle: Text('18/04/2020'),
                      title: Text('Data da Notificação da Autuação'),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'DIRIGIR AMEAÇANDO OS PEDESTRES QUE ESTEJAM ATRAVESSANDO A VIA PÚBLICA (10/11/19)',
                  ),
                  children: <Widget>[
                    ListTile(
                      hoverColor: Colors.green[200],
                      leading: Icon(CommunityMaterialIcons.check),
                      title: Text('Status'),
                      subtitle: Text('PAGA'),
                    ),
                    ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text('Valor'),
                      subtitle: Text('293,47'),
                    ),
                    ListTile(
                      leading:
                          Icon(CommunityMaterialIcons.file_document_multiple),
                      subtitle: Text('521-51'),
                      title: Text('Código da Infração'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      subtitle: Text('281050 - Pref. de SC Florianópolis'),
                      title: Text('Órgão Atuador'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.google_maps),
                      subtitle: Text('Avenida Hercílio Luz'),
                      title: Text('Local'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.calendar_clock),
                      subtitle: Text('10/11/2019 as 20:30'),
                      title: Text('Data/Hora do Cometimento'),
                    ),
                    ListTile(
                      leading: Icon(CommunityMaterialIcons.calendar_edit),
                      subtitle: Text('13/11/2019'),
                      title: Text('Data da Notificação da Autuação'),
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
