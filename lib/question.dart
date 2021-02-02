import 'package:app01/main.dart';
import 'package:flutter/material.dart';

class Quastion extends StatelessWidget {
  final String questionText;

  Quastion(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 30 , color: b ,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
