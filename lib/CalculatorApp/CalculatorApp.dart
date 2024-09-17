
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          leading: const Icon(Icons.settings, color: Colors.indigo),
          title: const Text ('Calculator'),
        centerTitle: true,
      ));
  }
}