import 'package:flutter/material.dart';
import 'ui/letter_list.dart';
import 'ui/elements_list.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Генератор текстов"),
        ),
        body: Letter(),
      )
    );
  }
}
