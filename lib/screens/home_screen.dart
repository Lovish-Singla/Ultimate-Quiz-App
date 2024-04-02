import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/quiz_button.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B32), // Muted background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A23),
        centerTitle: true,
        title: const QuizText(
          text: "Trivia App",
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const QuizText(
                text: "Welcome to the Trivia App!",
                fontSize: 25,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const QuizText(
                text: "Test your knowledge with our fun trivia questions.",
                fontSize: 25,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              QuizButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.topLeft,
                  child: const QuizText(
                    text: "Start Game",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // QuizButton(
              //   onPressed: () {},
              //   child: const QuizText(
              //     text: "High Scores",
              //     fontSize: 25,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // QuizButton(
              //   onPressed: () {},
              //   child: const QuizText(
              //     text: "Settings",
              //     fontSize: 25,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF0A0A23),
        height: 40,
        child: Container(
          alignment: Alignment.center,
          child: const QuizText(
            text: "M A D E   B Y   L O V I S H   S I N G L A",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
