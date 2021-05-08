import 'dart:ui';

import 'package:flutter/material.dart';

class World extends StatelessWidget {
  final Map worlddata;

  const World({Key key, this.worlddata}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panel: Colors.red[100],
            text: Colors.red,
            count: worlddata['cases'].toString(),
          ),
          StatusPanel(
            title: 'DEATH',
            panel: Colors.grey[500],
            text: Colors.grey[800],
            count: worlddata['deaths'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panel: Colors.blue[200],
            text: Colors.blue,
            count: worlddata['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panel: Colors.green[100],
            text: Colors.green,
            count: worlddata['recovered'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panel;
  final Color text;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panel, this.text, this.title, this.count})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(15),
      height: 100,
      width: width / 2,
      color: panel,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: text,
              ),
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: text,
            ),
          )
        ],
      ),
    );
  }
}
