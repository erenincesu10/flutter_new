import 'package:flutter/material.dart';
import 'package:stepper_example_app/stepper_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          dividerTheme: DividerThemeData(
          color: Colors.blue,
          space: 10, 
          thickness: 5, 
          indent: 20, // Adjust the indent of the blue divider from the left
          endIndent: 20, // Adjust the end indent of the blue divider from the right
        ),

        primarySwatch: Colors.blue,
      ),
      home: const MyStepperApp(),
    );
  }
}

