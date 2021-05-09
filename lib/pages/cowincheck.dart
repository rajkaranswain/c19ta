import 'package:co19count/pages/cout.dart';
import 'package:flutter/material.dart';

class cowinlog extends StatefulWidget {
  @override
  cowinlogState createState() => cowinlogState();
}

class cowinlogState extends State<cowinlog> {
  final pincode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Slot Check"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: pincode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'pincode'),
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (cout(value: pincode.text))));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    'submit',
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
      ),
    );
  }
}
