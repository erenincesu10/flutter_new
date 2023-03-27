import 'package:counter_provider/data/repo/counter_repo.dart';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _counter = 0;
  
  int get getCounter => _counter;

  var counterRepo = CounterRepo();

  void incrementCounter() {
    _counter = counterRepo.incrementCounter(_counter);
    notifyListeners();
  }

  void descrementCounter() {
    _counter = counterRepo.descrementCounter(_counter);
    notifyListeners();
  }
}