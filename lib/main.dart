import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global_counter/global_state.dart';
import 'advanced_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalState()), // Provider untuk status global
      ],
      child: MaterialApp(
        title: 'Penghitung Aplikasi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blueAccent,
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
          ),
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.countertops_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Aplikasi Penghitung',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        elevation: 6,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian 1: Manajemen Status Global & UI Tingkat Lanjut
            Text(
              'Penghitung Global',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8.0),
                child: AdvancedCounter(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Menambahkan penghitung baru ke daftar penghitung global
          Provider.of<GlobalState>(context, listen: false).addCounter();
        },
        tooltip: 'Tambah Penghitung',
        label: Text('Tambah'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
