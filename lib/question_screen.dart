import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onChooseAnswer});

  final Function(String) onChooseAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onChooseAnswer(answer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getSuffeledanswers().map((ans) {
              return AnswerButton(
                answerText: ans,
                onTap: () {
                  answerQuestion(ans);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
