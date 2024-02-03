import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start_screen';
  List<String> submitedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswers(String answer) {
    submitedAnswers.add(answer);

    if (submitedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(onChooseAnswer: chooseAnswers);
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        choosenAnswers: submitedAnswers,
      );
    }

    return MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: Colors.blue.shade400),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 45, 15, 168),
              Color.fromARGB(255, 121, 102, 200)
            ]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
