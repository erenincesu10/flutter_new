// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:datatable_example_app/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyDataTablePage extends StatefulWidget {
  const MyDataTablePage({super.key});

  @override
  State<MyDataTablePage> createState() => _MyDataTablePageState();
}

class _MyDataTablePageState extends State<MyDataTablePage> {
  List _users = [
    User(
        name: "Eren",
        surname: "İncesu",
        age: 22,
        team: Team.Flutter,
        hometown: "İstanbul",
        mail: "test"),
    User(
        name: "Gordon",
        surname: "Detrick",
        age: 27,
        team: Team.Ios,
        hometown: "Germany",
        mail: "gordon@gmail.com"),
    User(
        name: "Michael",
        surname: "Ricks",
        age: 30,
        team: Team.Android,
        hometown: "Trabzon",
        mail: "michael@gmail.com"),
    User(
        name: "Shelia",
        surname: "Morgan",
        age: 24,
        team: Team.Design,
        hometown: "Ankara",
        mail: "shelia@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table App"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: [
            DataColumn(label: Text("Flutter")),
            DataColumn(label: Text("Ios")),
            DataColumn(label: Text("Android")),
            DataColumn(label: Text("Design"))
          ],
          rows: [
            DataRow(
                cells: List<DataCell>.generate(_users.length,
                    (index) => DataCell(Text(_users[index].name),
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailsPage(name: _users[index].name,surname: _users[index].surname,age: _users[index].age,team: _users[index].team,hometown: _users[index].hometown,mail: _users[index].mail,))))))
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  String surname;
  int age;
  Team team;
  String hometown;
  String mail;
  User({
    required this.name,
    required this.surname,
    required this.age,
    required this.team,
    required this.hometown,
    required this.mail,
  });
}

enum Team {
  Flutter,
  Ios,
  Android,
  Design,
}

