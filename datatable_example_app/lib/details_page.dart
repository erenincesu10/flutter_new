// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:datatable_example_app/datatable_page.dart';

class DetailsPage extends StatefulWidget {
  String name = "";
  String surname = "";
  int age = 0;
  Team team;
  String hometown;
  String mail;
  DetailsPage({
    Key? key,
    required this.name,
    required this.surname,
    required this.age,
    required this.team,
    required this.hometown,
    required this.mail,
  }) : super(
            key: key,
          );

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name : ${widget.name}"),
          Text("Surname : ${widget.surname}"),
          Text("Age : ${widget.age}"),
          Text("Team : ${widget.team}"),
          Text("Hometown : ${widget.hometown}"),
          Text("Mail : ${widget.mail}"),
        ],
      )),
    );
  }
}
