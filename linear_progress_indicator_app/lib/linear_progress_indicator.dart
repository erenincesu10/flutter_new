

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyLinearProgressPage extends StatefulWidget {
  const MyLinearProgressPage({super.key});

  @override
  State<MyLinearProgressPage> createState() => _MyLinearProgressPageState();
}

class _MyLinearProgressPageState extends State<MyLinearProgressPage> {

  List _tasks = <String>[
    "Creating App",
    "Learning Scaffold",
    "Learning App Bar",
    "Learning Container",
    "Learning Alignment",
    "Learning Column",
    "Learning ListView",
    "Learning ListTile",
    "Learning Animations",
    "Learning Firebase"
    ];

    int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linear Progress App"),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              LinearProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.black,
                value: _index.toDouble() * 0.1,
        
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Task : ${_tasks[_index]}"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(_index <= 8){
                        _index++;
                      }else{
                        _index = 0;
                      }
                    });
                  }, child: Text("Complete"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

