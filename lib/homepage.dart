import 'dart:convert';
import 'dart:math';
import 'package:co19count/pages/c.dart';
import 'package:co19count/panel/infopanel.dart';
import 'package:co19count/panel/mostaffectcountries.dart';
import 'package:http/http.dart' as http;
import 'package:co19count/panel/world.dart';
import 'package:co19count/source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> myColors = [
    Colors.yellow[200],
    Colors.red[200],
    Colors.green[200],
    Colors.purple[200],
    Colors.blue[200],
  ];
  List<Color> myColors1 = [
    Colors.yellow[1200],
    Colors.red[800],
    Colors.green[800],
    Colors.purple[800],
    Colors.blue[800],
  ];

  Random random = new Random();
  Map worlddata;
  fetchdata() async {
    http.Response response =
        await http.get((Uri.parse('https://corona.lmao.ninja/v2/all')));
    setState(() {
      worlddata = json.decode(response.body);
    });
  }

  List cdata;
  fetchcdata() async {
    http.Response response = await http
        .get((Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases')));
    setState(() {
      cdata = json.decode(response.body);
    });
  }

  void initState() {
    fetchdata();
    fetchcdata();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "COVID 19 TRACKER",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              "REAL TIME",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                color: myColors[random.nextInt(4)],
                child: Text(DataSource.quote[random.nextInt(4)],
                    style: TextStyle(
                      color: myColors1[random.nextInt(4)],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WORLDWIDE',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        'Regional',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worlddata == null
                ? CircularProgressIndicator()
                : World(
                    worlddata: worlddata,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'most affected countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            cdata == null
                ? CircularProgressIndicator()
                : mostaffectedpanel(
                    cdata: cdata,
                  ),
            SizedBox(
              height: 15,
            ),
            infopanel()
          ],
        ),
      ),
    );
  }
}
