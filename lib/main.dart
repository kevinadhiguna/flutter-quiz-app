import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main(){
  runApp(MyApp());
}

// Shorthand : 
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyAppState();
  }
}

/// NOTES :
/// 1. If you transform a Stateless widget to a Stateful widget, 
///     reload won't work. So, restart the app instead.
/// 2. Any classname or variable which start with '_' (underscore) 
///     are private.

class _MyAppState extends State<MyApp> {
  final _questions = const [
    { 
      'questionText': 'What\'s your favourite color?', 
      'answers': [
        {'text': 'Black', 'score': 10}, 
        {'text': 'Red', 'score': 5}, 
        {'text': 'Green', 'score': 6}, 
        {'text': 'White', 'score': 8}
      ],
    },
    { 
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Bird', 'score': 4}, 
        {'text': 'Cheetah', 'score': 8}, 
        {'text': 'Whale', 'score': 9}, 
        {'text': 'Shark', 'score': 3}
      ],
    },
    { 
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Brad', 'score': 7}, 
        {'text': 'Ed', 'score': 6}, 
        {'text': 'Max', 'score': 5}, 
        {'text': 'Shaun', 'score': 3}
      ],
    },
  ];
  
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  
  void _answerQuestion(int score) {
    _totalScore += score; // <- equals to '_totalScore = _totalScore + score;'.

    /// Similar shorthands :
    /// 1) Substraction   ->  _totalScore -= score;
    /// 2) Multilpication ->  _totalScore *= score;
    /// 3) Division       ->  _totalScore /= score;
    
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }
  
  @override // <- Code will work without this. However this makes code clearer and cleaner.
  Widget build(BuildContext context) {
    
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // <- does not work if 'questions' is a const.


    /// This works with var questions = [] as well. 
    ///  However 'final' or 'const' is better as this is constant and never change.
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length 
        ? Quiz(
            answerQuestion: _answerQuestion, 
            questionIndex: _questionIndex, 
            questions: _questions,
          )
        : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
