import 'package:flutter/material.dart';

class StartButton extends StatelessWidget{
  final title;
  final Function() onTap;

  const StartButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 300),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50),
            backgroundColor: Colors.indigo[500],
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),)),
          child: Text(title,
      )),
    );
  }
}