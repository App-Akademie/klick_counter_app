import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  var _count = 0;

  int get count => _count;

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }
}
