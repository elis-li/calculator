
import 'package:calculator/calculator/start_button_list.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget{
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
        ),
        body: Container(color: Colors.indigo[300], child: const StartButtonList()),
      );
    }
  }
  //Widget _startButton(BuildContext context){
    //return SafeArea(
      //child: null,

    //)


