import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemdata});

  final Map<String, Object> itemdata;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('1', style: GoogleFonts.lato(color: Colors.white)),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (itemdata['question']) as String,
                  style: GoogleFonts.lato(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                Text(
                  (itemdata['user_answer']) as String,
                  style: GoogleFonts.lato(color: Colors.green[400]),
                ),
                Text(
                  (itemdata['correct_answer']) as String,
                  style: GoogleFonts.lato(color: Colors.orange[300]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
