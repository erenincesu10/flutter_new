

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySwitchExample extends StatefulWidget {
  const MySwitchExample({super.key});

  @override
  State<MySwitchExample> createState() => _MySwitchExampleState();
}

class _MySwitchExampleState extends State<MySwitchExample> {

  bool _isSwitched = false;
  Color _backGroundColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: _backGroundColor,
        child: Center(
          child: Switch(
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.red.shade500,
            thumbColor: MaterialStateColor.resolveWith((states) => Colors.black),
            value: _isSwitched, 
            onChanged: (value){
            setState(() {
              _isSwitched = value;
              print(_isSwitched);
              _isSwitched ? _backGroundColor = Colors.red.shade900 : _backGroundColor = Colors.green;
            });

          }),
        ),
      ),
    );
  }
}