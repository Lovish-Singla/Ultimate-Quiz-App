import 'package:flutter/material.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/screens/categories.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_button.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizAppColors.backgroundColor, // Muted background color
      appBar: AppBar(
        backgroundColor: QuizAppColors.darkColor,
        centerTitle: true,
        title: const QuizText(
          text: "T R I V I A   A P P",
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
              const SizedBox(height: 30),
              const QuizText(
                text: "Test your knowledge with our fun trivia questions.",
                fontSize: 25,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              QuizButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuizText(
                      text: "Start Game",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      color: QuizAppColors.textColor,
                      size: 35,
                    ),
                  ],
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
      bottomNavigationBar: const MadeByLovish(),
    );
  }
}
