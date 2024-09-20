import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calcButton.dart';

class CalculatorView extends StatefulWidget {
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

  // Helper function to remove decimal if not needed
  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return splitDecimal[0];
      }
    }
    return result;
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        equation = '0';
        result = '0';
      } else if (buttonText == '⌫') {
        if (equation.isNotEmpty) {
          equation = equation.substring(0, equation.length - 1);
          if (equation == '') {
            equation = '0';
          }
        }
      } else if (buttonText == '+/-') {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          result = doesContainDecimal(result);
        } catch (e) {
          result = 'Error';
        }
      } else if (buttonText == '%') {
        // Handle percentage calculation
        expression = equation;
        try {
          double percentage = double.parse(expression) / 100;
          result = doesContainDecimal(percentage);
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation += buttonText;
        }
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
            Padding(padding: EdgeInsets.only(top: 0), child: Text('DEG')),
            SizedBox(width: 22)
          ],
          title: const Text('Calculator'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                          padding: const EdgeInsets.all(10.0),
                          child: Text(result,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 80))),
                      const Icon(Icons.more_vert,
                          color: Colors.black87, size: 30),
                      const SizedBox(width: 20),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(equation,
                            style: const TextStyle(
                                fontSize: 40, color: Colors.black87)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.backspace_outlined,
                            color: Colors.black87, size: 30),
                        onPressed: () {
                          buttonPressed('⌫');
                        },
                      ),
                      const SizedBox(width: 20),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton('AC', Colors.white10, () => buttonPressed('AC')),
              calcButton('%', Colors.white10, () => buttonPressed('%')),
              calcButton('÷', Colors.white10, () => buttonPressed('÷')),
              calcButton('×', Colors.white10, () => buttonPressed('×')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton('7', Colors.white24, () => buttonPressed('7')),
              calcButton('8', Colors.white24, () => buttonPressed('8')),
              calcButton('9', Colors.white24, () => buttonPressed('9')),
              calcButton('-', Colors.white10, () => buttonPressed('-')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton('4', Colors.white24, () => buttonPressed('4')),
              calcButton('5', Colors.white24, () => buttonPressed('5')),
              calcButton('6', Colors.white24, () => buttonPressed('6')),
              calcButton('+', Colors.white10, () => buttonPressed('+')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      calcButton('1', Colors.white24, () => buttonPressed('1')),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      calcButton('2', Colors.white24, () => buttonPressed('2')),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      calcButton('3', Colors.white24, () => buttonPressed('3')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton(
                          '+/-', Colors.white24, () => buttonPressed('+/-')),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      calcButton('0', Colors.white24, () => buttonPressed('0')),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      calcButton('.', Colors.white24, () => buttonPressed('.')),
                    ],
                  ),
                ],
              ),
              calcButton('=', Colors.indigo, () => buttonPressed('=')),
            ],
          )
        ])));
  }
}
