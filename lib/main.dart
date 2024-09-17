import 'package:calculator/CalculatorApp/CalculatorApp.dart';
import 'package:flutter/material.dart';

import 'calculator/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const CalculatorView(),
    );
  }
}
