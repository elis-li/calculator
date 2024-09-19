
import 'package:flutter/material.dart';

import 'calcButton.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String equation = "0";
  String result = "0";
  String expression = "0";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

buttonPressed(String buttonText){
  setState((){
    if (buttonText == '⌫') {
      if (equation.isNotEmpty) {
        equation = equation.substring(0, equation.length - 1);
      }
    } else {
      equation += buttonText;
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          leading: const Icon(Icons.settings, color: Colors.black87),
          actions: const [
            Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text('DEG')),
            SizedBox(width: 22)
          ],
          title: const Text ('Calculator'),
        centerTitle: true,
      ),
    body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('result',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white, fontSize: 80))),
                    Icon(Icons.more_vert,
                        color: Colors.black87, size: 30),
                    SizedBox(width: 20),
                    ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('equation',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black87
                      )),
                  ),
                    IconButton(
                      icon: Icon(Icons.backspace_outlined,
                      color: Colors.black87, size: 30),
                      onPressed: () {
                       buttonPressed('⌫');
                      },
                    ),
                    SizedBox(width: 20),
                  ],
                )
              ],
            ),
          ),
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('AC', Colors.white10, () => buttonPressed ('AC')),
                calcButton('%', Colors.white10, () => buttonPressed ('%')),
                calcButton('÷', Colors.white10, () => buttonPressed ('÷')),
                calcButton('×', Colors.white10, () => buttonPressed ('×')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('7', Colors.white24, () => buttonPressed ('7')),
                calcButton('8', Colors.white24, () => buttonPressed ('8')),
                calcButton('9', Colors.white24, () => buttonPressed ('9')),
                calcButton('-', Colors.white10, () => buttonPressed ('-')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('4', Colors.white24, () => buttonPressed ('4')),
                calcButton('5', Colors.white24, () => buttonPressed ('5')),
                calcButton('6', Colors.white24, () => buttonPressed ('6')),
                calcButton('+', Colors.white10, () => buttonPressed ('+')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        calcButton(
                            '1', Colors.white24, () => buttonPressed('1')),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04),
                        calcButton(
                            '2', Colors.white24, () => buttonPressed('2')),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04),
                        calcButton(
                          '3', Colors.white24, () => buttonPressed('3')),
                      ],
                    );





