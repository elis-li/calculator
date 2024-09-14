

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget{
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 0, right: 40, left: 40),
              child: TextField(
                decoration: const InputDecoration(
                hintText: 'Enter your value',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value){
    }),
            )
          ],
        ),
      );
  }
}