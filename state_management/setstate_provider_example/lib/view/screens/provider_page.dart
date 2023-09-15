import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }
}



class MyProviderPage extends StatelessWidget {
  const MyProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Provider counter = ${context.watch<CounterViewModel>().getCounter}"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.red
              ),
              onPressed: () {
                context.read<CounterViewModel>()._incrementCounter();
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
