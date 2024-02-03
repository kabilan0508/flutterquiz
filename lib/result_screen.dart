import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questionsummary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> get summarydata {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].question,
          "correct_answer": questions[i].answers[0],
          "user_answer": choosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summarydata
        .where(
          (data) => data['correct_answer'] == data['user_answer'],
        )
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions Questions",
              style: GoogleFonts.lato(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionSummary(summarydata: summarydata)
          ],
        ),
      ),
    );
  }
}
