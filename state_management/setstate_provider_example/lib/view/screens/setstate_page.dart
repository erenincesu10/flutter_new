import 'package:flutter/material.dart';

class MySetStatePage extends StatefulWidget {
  const MySetStatePage({super.key});

  @override
  State<MySetStatePage> createState() => _MySetStatePageState();
}

class _MySetStatePageState extends State<MySetStatePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber
          ),onPressed: _incrementCounter, child: Text("+"))
        ],
      ),
    );
  }
}
