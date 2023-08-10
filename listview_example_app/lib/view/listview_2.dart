

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListView2 extends StatefulWidget {
  const ListView2({super.key});

  @override
  State<ListView2> createState() => _ListView2State();
}

class _ListView2State extends State<ListView2> {

  List _widgets = [
    Container(
              height: 100,
              color: Colors.red,
            ),
            Container(
              height: 100,

              color: Colors.yellow,
            ),
            Container(
              height: 100,

              color: Colors.black,
            ),
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Container(
              height: 100,

              color: Colors.green,
            ),
            Container(
              height: 100,

              color: Colors.pink,
            ),
            Container(
              height: 100,

              color: Colors.purple,
            ),
            Container(
              height: 100,

              color: Colors.indigo,
            ),
            Container(
              height: 100,
              color: Colors.deepOrange,
            ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder App"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: _widgets.length,
          itemBuilder: (context, index){
            return _widgets[index];
          }),
      ),
    );
  }
}