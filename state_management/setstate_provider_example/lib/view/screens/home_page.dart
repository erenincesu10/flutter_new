import 'package:flutter/material.dart';
import 'package:setstate_provider_example/view/screens/provider_page.dart';
import 'package:setstate_provider_example/view/screens/setstate_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List pages = [MySetStatePage(), MyProviderPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management App"),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Text(""), label: "Set State"),
            BottomNavigationBarItem(icon: Text(""), label: "Provider"),
          ]),
    );
  }
}
