import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyCircularProgressIndicator extends StatefulWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  State<MyCircularProgressIndicator> createState() =>
      _MyCircularProgressIndicatorState();
}

class _MyCircularProgressIndicatorState
    extends State<MyCircularProgressIndicator> {
  int _counter = 0;
  int _maxCounter = 100;
  Timer? timer;
  Color _color = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(milliseconds: 200), (_) {
      if (_counter < _maxCounter) {
        setState(() {
          _counter++;
          if (_counter > 10 && _counter <= 20) {
            _color = Colors.red;
          } else if (_counter > 20 && _counter <= 30) {
            _color = Colors.yellow;
          } else if (_counter > 30 && _counter <= 40) {
            _color = Colors.orange;
          } else if (_counter > 40 && _counter <= 50) {
            _color = Colors.green;
          } else if (_counter > 50 && _counter < 60) {
            _color = Colors.green.shade900;
          } else if (_counter > 60 && _counter < 70) {
            _color = Colors.blue;
          } else if (_counter > 70 && _counter < 80) {
            _color = Colors.blueAccent;
          } else if (_counter > 80 && _counter < 90) {
            _color = Colors.indigo;
          } else if (_counter > 90 && _counter < 100) {
            _color = Colors.purple;
          }
        });
      } else {
        timer?.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Circular Progress App",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_counter.toString()),
              _counter != 100 ? CircularProgressIndicator(
                strokeWidth: _counter.toDouble()/ 10,
                color: _color,
                backgroundColor: Colors.grey,
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
