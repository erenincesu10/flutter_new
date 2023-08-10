import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NeonSegmentedController(),
    );
  }
}

class NeonSegmentedController extends StatefulWidget {
  @override
  _NeonSegmentedControllerState createState() => _NeonSegmentedControllerState();
}

class _NeonSegmentedControllerState extends State<NeonSegmentedController> {
  int _selectedIndex = 0;

  List<String> _segmentTitles = ['Neon Academy 2023', 'Neon', 'Apps'];

  List<Color> _segmentColors = [
    Color.fromARGB(255, 240, 255, 66),
    Color.fromARGB(255,44, 211, 225),
    Color.fromARGB(255, 22, 255, 0),
  ];

  List<double> _segmentSizes = [100, 30, 20];

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
      print(_segmentSizes[_selectedIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neon Segmented Controller Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoSegmentedControl(
              children: {
                for (var i = 0; i < _segmentTitles.length; i++)
                  i: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: _segmentSizes[_selectedIndex],
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        _segmentTitles[i],
                        style: TextStyle(
                          color: i == _selectedIndex ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ),
              },
              onValueChanged: _onIndexChanged,
              groupValue: _selectedIndex,
              unselectedColor: Colors.red,
              selectedColor: _segmentColors[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}