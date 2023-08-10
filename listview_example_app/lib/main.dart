import 'package:flutter/material.dart';
import 'package:listview_examples_app/view/listView_article.dart';
import 'package:listview_examples_app/view/listview_1.dart';
import 'package:listview_examples_app/view/listview_2.dart';
import 'package:listview_examples_app/view/mySliverListview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ListView2(),

    );
  }
}

