import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titulo = 'Calculadora IMC - EAI';

    return MaterialApp(
      title: titulo,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: titulo),
      debugShowCheckedModeBanner: false,
    );
  }
}
