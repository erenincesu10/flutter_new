

import 'package:flutter/material.dart';


class MyStepperApp extends StatefulWidget {
  const MyStepperApp({super.key});

  @override
  State<MyStepperApp> createState() => _MyStepperAppState();
}

class _MyStepperAppState extends State<MyStepperApp> {

  int _currentValue = 0;
  int _step = 5;
  int _minValue = 0;
  int _maxValue = 50;

  void _increment() {
    setState(() {
      _currentValue = (_currentValue + _step).clamp(_minValue, _maxValue);
    });
  }

  void _decrement() {
    setState(() {
      _currentValue = (_currentValue - _step).clamp(_minValue, _maxValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("Stepper App"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: Colors.pink,
          child: 
          Stepper(
            currentStep: (_currentValue ~/ _step).clamp(0, _maxValue ~/ _step),
            onStepTapped: (step) {},
            onStepCancel: _decrement,
            onStepContinue: _increment,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                      ElevatedButton(
                        onPressed: _currentValue < _maxValue ? details.onStepContinue : null,
                        child: Row(
                          children: [
                            Icon(Icons.favorite,color: Colors.red,),
                            SizedBox(width: 1,),
                            Text('Increment'),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(_currentValue.toString()),
                      SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: _currentValue > _minValue ? details.onStepCancel : null,
                        child: Row(
                          children: [
                            Text('Decrement'),
                            SizedBox(width: 1,),
                            Icon(Icons.favorite,color: Colors.red,),
                          ],
                        ),
                        
                      ),
                ],
              );
            },
            steps: [
              Step(title: Text("Step 0"), content: Image.asset("assets/pokemons/poke0.png")),
              Step(title: Text("Step 5"), content: Image.asset("assets/pokemons/poke1.png")),
              Step(title: Text("Step 10"), content: Image.asset("assets/pokemons/poke2.png")),
              Step(title: Text("Step 15"), content: Image.asset("assets/pokemons/poke3.png")),
              Step(title: Text("Step 20"), content: Image.asset("assets/pokemons/poke4.png")),
              Step(title: Text("Step 25"), content: Image.asset("assets/pokemons/poke5.png")),
              Step(title: Text("Step 30"), content: Image.asset("assets/pokemons/poke6.png")),
              Step(title: Text("Step 35"), content: Image.asset("assets/pokemons/poke7.png")),
              Step(title: Text("Step 40"), content: Image.asset("assets/pokemons/poke8.png")),
              Step(title: Text("Step 45"), content: Image.asset("assets/pokemons/poke9.png")),
              Step(title: Text("Step 50"), content: Image.asset("assets/pokemons/poke10.png")),
            ]
          ),
        ),
      ),
    );
  }
}