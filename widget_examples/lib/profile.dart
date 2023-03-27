import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

  const List<String> colors = <String>[
    "green","blue","red",
  ];
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Color backgroundColor = Colors.amber;
  String dropdownValue =colors.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Center(
        child: DropdownButton(

           elevation: 10,
           style: TextStyle(color: Colors.black),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
            if(dropdownValue == "green"){
              backgroundColor = Colors.green;
            }else if(dropdownValue == "blue"){
              backgroundColor = Colors.blue;
            }else if(dropdownValue == "red"){
              backgroundColor = Colors.red;
            }else {
              backgroundColor = Colors.amber;
            }

          });
        },
        iconSize: 24,
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
                  items: colors.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );}).toList(), 
        ),
      ),
    );
  }
}