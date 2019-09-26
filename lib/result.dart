import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String resultPhrase {
    var resultText = 'You did it!'
    if(resultScore <= 8) {
      resultText = 'You are awesome and innocent!'
    }
    return ;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Text(resultPhrase, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
         );
  }
}