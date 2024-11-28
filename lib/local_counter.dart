import 'package:flutter/material.dart';

class LocalCounter extends StatefulWidget {
  @override
  _LocalCounterState createState() => _LocalCounterState();
}

class _LocalCounterState extends State<LocalCounter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Penghitung: $_counter',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _increment,
              child: Text("Tambah"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: _decrement,
              child: Text("Kurangi"),
            ),
          ],
        ),
      ],
    );
  }
}
