import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListView1 extends StatefulWidget {
  const ListView1({super.key});

  @override
  State<ListView1> createState() => _ListView1State();
}

class _ListView1State extends State<ListView1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Example"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: false,
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.yellow,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.black,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.pink,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.purple,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.indigo,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}
