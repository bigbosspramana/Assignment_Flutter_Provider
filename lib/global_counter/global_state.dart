import 'package:flutter/material.dart';

class CounterData {
  int value;
  String label;
  Color color;

  CounterData({this.value = 0, this.label = 'Penghitung', this.color = Colors.blue});
}

class GlobalState extends ChangeNotifier {
  final List<CounterData> _counters = [];

  List<CounterData> get counters => _counters;

  void addCounter() {
    _counters.add(CounterData());
    notifyListeners();
  }

  void removeCounter(int index) {
    if (index >= 0 && index < _counters.length) {
      _counters.removeAt(index);
      notifyListeners();
    }
  }

  void incrementCounter(int index) {
    if (index >= 0 && index < _counters.length) {
      _counters[index].value++;
      notifyListeners();
    }
  }

  void decrementCounter(int index) {
    if (index >= 0 && index < _counters.length && _counters[index].value > 0) {
      _counters[index].value--;
      notifyListeners();
    }
  }

  void updateLabel(int index, String label) {
    if (index >= 0 && index < _counters.length) {
      _counters[index].label = label;
      notifyListeners();
    }
  }

  void updateCardAndLabelColor(int index, Color color) {
    if (index >= 0 && index < _counters.length) {
      _counters[index].color = color;
      notifyListeners();
    }
  }
}
