import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'cowincheck.dart';
import 'package:http/http.dart' as http;

String a;
DateTime now = DateTime.now();
String currentTime = new DateTime(now.day, now.month, now.year).toString();
String b = DateTime.now().toString();
String aurl =
    'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=' +
        a +
        '&date=' +
        b;

class cout extends StatefulWidget {
  @override
  final String value;

  cout({Key key, this.value}) : super(key: key);

  _cout createState() => _cout();
}

class _cout extends State<cout> {
  List cwdata;
  fetchcwdata() async {
    http.Response response = await http.get((Uri.parse(aurl)));
    setState(() {
      cwdata = json.decode(response.body);
    });

    @override
    void initState() {
      fetchcwdata();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    a = widget.value;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: new Text(cwdata[0]["name"].toString()),
    );
  }
}
