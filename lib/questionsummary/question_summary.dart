import 'package:flutter/material.dart';
import 'package:quiz/questionsummary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return SummaryItem(
              itemdata: data,
            );
          }).toList(),
        ),
      ),
    );
  }
}
