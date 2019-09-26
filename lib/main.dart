import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 1}, 
          {'text': 'Gold', 'score': 1}, 
          {'text': 'Green', 'score': 5 }, 
          {'text': 'Pink', 'score': 10 }]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 9}, 
          {'text': 'Ape', 'score': 3}, 
          {'text': 'Lion', 'score': 7}, 
          {'text': 'Snake', 'score': 10}
          ]
      },
      {
        'questionText': 'Whose your favorite instructor?',
        'answers': [
          {'text':'Me','score': 1}, 
          {'text': 'You', 'score': 1}, 
          {'text': 'Youtube', 'score': 10}, 
          {'text': 'Google', 'score': 9}
          ]
      }
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });

    print(_questionIndex);
    
    if(_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Evaluation Questions'),
        ),
        body: _questionIndex < _questions.length 
        ? Quiz(
            answerQuestion: _answerQuestion, 
            questionIndex: _questionIndex,
            questions: _questions
          )
          : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
