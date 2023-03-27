import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [ Column(
          children: [//SizedBox(height: 50,),
          Row(
            children: _row(),
          ),
          Column(
            children: _row(),
          ),
      
          SizedBox(
            height:50,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [..._row(),..._row(),],)),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: [..._row(),..._row(),])),
          Divider(thickness: 5,color: Colors.black,),
          Wrap(
            //alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.start,
            //runAlignment: WrapAlignment.end,
            spacing: 2,//elemanlar arasında boşluk
            runSpacing: 5,//elemanlar arasında boşluk yukarıdan aşağıya doğru
            direction: Axis.vertical,
            children: [
            ..._row(),
            ..._row(),
            // ..._row(),
            // ..._row(),
            // ..._row(),
            // ..._row(),
            // ..._row(),
            // ..._row(),
            
            
            
            
            
            
            
            
            
            
            ],
          ),
          
          ]
          ),
        ]
      ),
    );
  }
  List<Widget> _row(){
    return[
      _container(30, 30, Colors.red),
      _container(40, 30, Colors.blue),
      _container(50, 30, Color.fromARGB(255, 3, 243, 11)),
      _container(40, 30, Colors.yellow),
      _container(70, 30, Colors.brown),
      _container(40, 30, Colors.purple),
      _container(50, 30, Colors.grey),
      _container(40, 30, Colors.black),
      _container(20, 30, Colors.pink),
    ];
  }

  _container(double width,double height, Color color) => Container(
    width: width,
    height: height,
    color: color,
  );
}