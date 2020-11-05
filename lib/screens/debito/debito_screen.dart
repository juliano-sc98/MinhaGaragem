import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DebitoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Débitos'),
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(
                child: new MaterialButton(
                    child: new Column(
                      children: <Widget>[
                        new Expanded(
                          flex: 4,
                          child:
                              new LayoutBuilder(builder: (context, constraint) {
                            return new Icon(
                              CommunityMaterialIcons.check_circle_outline,
                              size: constraint.biggest.height,
                              color: Colors.green,
                            );
                          }),
                        ),
                        new Expanded(child:
                            new LayoutBuilder(builder: (context, constraint) {
                          return new Text('Débitos em dia!',
                              style: DefaultTextStyle.of(context).style.apply(
                                  fontSizeFactor:
                                      constraint.biggest.height / 30.0));
                        })),
                      ],
                    ),
                    onPressed: () {})),
            new Expanded(
              child: new Column(
                children: <Widget>[
                  ExpansionTile(
                    title: Text(
                      'Próximos vencimentos',
                    ),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(CommunityMaterialIcons.file_document),
                        title: Text('IPVA'),
                        subtitle: Text('10/05/2021'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
