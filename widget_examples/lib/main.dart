import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_denemeler/custom_nav_bar.dart';
import 'package:widget_denemeler/home.dart';
import 'package:widget_denemeler/list.dart';
import 'package:widget_denemeler/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  int pageNumber = 0;

  List<Widget> get pages => [
    HomePage(),
    ListPage(),
    ProfilePage()
  ];//doğrudan tanım olduğu için get kullandık



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text(widget.title),
        actions: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search))],
        elevation: 20,
        shadowColor: Colors.yellow,
        // ignore: prefer_const_constructors
        bottom: PreferredSize(child: Row(children: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],), preferredSize: Size.fromHeight(20)),
      ),
      body: pages[pageNumber],

      bottomNavigationBar: CustomNavBar(pageNumber: pageNumber, onTap: ((value) {
        setState(() {
          pageNumber = value;
        });
      }), 
    ),
    );
  }
}
