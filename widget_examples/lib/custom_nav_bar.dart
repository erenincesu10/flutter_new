import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomNavBar extends StatelessWidget {
  final int pageNumber;
  final Function(int value) onTap;

  const CustomNavBar({super.key, required this.pageNumber, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        selectedItemColor: Colors.amber[900],
        onTap: (value){
          onTap(value);//
        },
        currentIndex: pageNumber,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.line_horizontal_3_decrease_circle),label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: "")
        ]);
  }
}