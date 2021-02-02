import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function q;
  final int resultScore;

  Result(this.q, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = "You Are Awsome";
    } else if (resultScore >= 40) {
      resultText = "Pretty Likable";
    } else {
      resultText = "You are So Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score is $resultScore",
            style:
                TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: b),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: b),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              onPressed: q,
              child: Text(
                "Restart The App",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
