import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySliderPage extends StatefulWidget {
  const MySliderPage({super.key});

  @override
  State<MySliderPage> createState() => _MySliderPageState();
}

class _MySliderPageState extends State<MySliderPage> {
  double sliderValue = 0.0;
  double magicalSliderValue = 0.0;
  int _redColor = 0;
  int _greenColor = 0;
  double onceki = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider App"),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Slider(
              max: 100,
              min: 0,
              value: sliderValue, 
              thumbColor: Colors.blue,
              divisions: 100,
              activeColor: Color.fromARGB(255, _redColor, _greenColor, 0),
              inactiveColor: Colors.grey,
              onChanged: (value){
              setState(() {
                sliderValue = value;
                if(sliderValue > 0 && sliderValue <= 20){
                  _redColor = 0;
                  _greenColor = 255;
                }else if(sliderValue > 20 && sliderValue <= 40){
                  _greenColor = 205;
                  _redColor = 55;
                }else if(sliderValue > 40 && sliderValue <= 60){
                  _greenColor = 105;
                  _redColor = 105;
                }
                else if(sliderValue > 60 && sliderValue < 80){
                  _greenColor = 55;
                  _redColor = 205;
                }
                else if(sliderValue > 80){
                  _greenColor = 0;
                  _redColor = 255;
                }
              });
            }),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(sliderValue != 100 ? "assets/images/greenDragon.png" : "assets/images/redDragon.png"))
              ),
            ),
            Text("Magical Stick"),
            Slider(
              max: 50,
              min: 0,
              value: magicalSliderValue, 
              thumbColor: Colors.purple,
              divisions: 1,
              label: magicalSliderValue.round().toString(),
              activeColor: Colors.purple,
              inactiveColor: Colors.grey,
              onChanged: (value){
              setState(() {
                magicalSliderValue = value;
                if(magicalSliderValue == 50 && sliderValue == 100){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text("You defeated the Dragon"),));
                }
              });
            }),
          ],
        ),
      ),
    );
  }
}