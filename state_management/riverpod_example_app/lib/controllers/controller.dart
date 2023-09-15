
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  int counter = 0;

  void incrementCounter(){
    counter++;
    notifyListeners();
  }
}