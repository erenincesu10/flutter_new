import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySliverListView extends StatefulWidget {
  const MySliverListView({super.key});

  @override
  State<MySliverListView> createState() => _MySliverListViewState();
}

class _MySliverListViewState extends State<MySliverListView> {
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
        title: Text("SliverListView"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: _widgets.length,
                  (BuildContext context, index) {
            return _widgets[index];
          })),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: _widgets.length,
              (context, index) => _widgets[index]),
          )
        ],
      ),
    );
  }
}
