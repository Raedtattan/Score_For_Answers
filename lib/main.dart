import 'dart:collection';

import 'package:app01/answer.dart';
import 'package:app01/quiz.dart';
import 'package:app01/result.dart';
import 'package:flutter/material.dart';
import 'question.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;

  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2) num2 = score;

    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print("_questionIdex = $_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("_totalScores=$_totalScore");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s Your Favorite Colors?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s Your Favorite animals?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s Your Favorite instructor?',
      'answers': [
        {'text': 'hassan1', 'score': 10},
        {'text': 'hassan2', 'score': 20},
        {'text': 'hassan3', 'score': 30},
        {'text': 'hassan4', 'score': 40},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(color: w),
          ),
          actions: <Widget>[
            Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                  print(isSwitch);
                  if (isSwitch == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (isSwitch == false) {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black26,
            ),
          ],
        ),
        body: Container(
          color: w,
          child: _questionIndex < _question.length
              ? Quiz(_question, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: w,
            size: 40,
          ),
          onPressed: () {
            if (_questionIndex == 1) _totalScore -= num0;
            if (_questionIndex == 2) _totalScore -= num1;
            if (_questionIndex == 3) _totalScore -= num2;
            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });
            print("_questionIdex = $_questionIndex");
            print("num0=$num0");
            print("num1=$num1");
            print("num2=$num2");
            print("_totalScores=$_totalScore");
          },
        ),
      ),
    );
  }
}
