import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: 
        [
          GestureDetector(
            onTap: (){print("Hello World");},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/image.png",
              height: 250,
              width: 250,
              fit: BoxFit.cover,),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text("Hello World")),
          TextButton(onPressed: (){}, child: Text("Hello World")),


          InkWell(
            onTap: () => print("Hello World"),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text("Hello World"),
            ),
          )
          ]
          ),
      ),
    );
  }
}