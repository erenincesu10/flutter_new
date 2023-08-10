
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyStackApp extends StatefulWidget {
  const MyStackApp({super.key});

  @override
  State<MyStackApp> createState() => _MyStackAppState();
}

class _MyStackAppState extends State<MyStackApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spell Stack View'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildSpellLabel('Expelliarmus', 800,800,Colors.orange),
            _buildSpellLabel('Expecto Patronum', 400,400,Colors.red),
            _buildSpellLabel('Stupefy', 200,200,Colors.amber),
            _buildSpellLabel('Avada Kedavra', 100,100, Colors.yellow),
          ],
        ),
      ),
    );
  }

  Widget _buildSpellLabel(String spell, double height, double width, Color color) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      padding: EdgeInsets.all(8),
      child: Text(
        spell,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
