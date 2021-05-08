import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class mostaffectedpanel extends StatelessWidget {
  final List cdata;

  const mostaffectedpanel({Key key, this.cdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: <Widget>[
                Image.network(
                  cdata[index]['countryInfo']['flag'],
                  height: 30,
                ),
                SizedBox(width: 15),
                Text(
                  cdata[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 15),
                Text(
                  'Deaths' + cdata[index]['deaths'].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 15),
                Text(
                  'Cases' + cdata[index]['cases'].toString(),
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
