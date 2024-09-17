
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}
String equation = "0";
  String result = "0";
  String expression = "0";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){

  }

class _CalculatorViewState extends State<CalculatorView> {
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
    body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('result',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 80))),

                          ) ,
                      ),
                    )
                  ],
                ),

              ),
            )
          ],
        ),
    ),);
  }
}