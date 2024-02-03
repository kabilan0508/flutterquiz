import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changescreen, {super.key});

  final void Function() changescreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the Fun Way",
            style: GoogleFonts.lato(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: changescreen,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'SIGN IN',
              // style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
