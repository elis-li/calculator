import 'package:calculator/calculator/calculator.dart';
import 'package:flutter/material.dart';
import '../Widgets/start_button.dart';

class StartButtonList extends StatelessWidget{
  const StartButtonList({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(),
      Align(alignment: Alignment.bottomCenter, child: _startButton(context))
    ]);
  }
  Widget _startButton(BuildContext context){
    return SafeArea(
      child: StartButton(
        title: 'Start',
        onTap: (){
          _calculation(context);
        }
      )
    );
  }
  Future <void> _calculation(BuildContext context) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context){
      return CalculatorPage();
    }));
  }

}