import 'package:flutter/material.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizAppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: QuizAppColors.darkColor,
        centerTitle: true,
        title: const QuizText(
          text: "Trivia Results",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Card(
              color: QuizAppColors.buttonColor,
              child: ListTile(
                title: QuizText(
                  text: "Score",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                trailing: QuizText(
                  text: "55%",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Card(
              color: QuizAppColors.buttonColor,
              child: ListTile(
                title: QuizText(
                  text: "Score",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                trailing: QuizText(
                  text: "55%",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Card(
              color: QuizAppColors.buttonColor,
              child: ListTile(
                title: QuizText(
                  text: "Score",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                trailing: QuizText(
                  text: "55%",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Card(
              color: QuizAppColors.buttonColor,
              child: ListTile(
                title: QuizText(
                  text: "Score",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                trailing: QuizText(
                  text: "55%",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MadeByLovish(),
    );
  }
}
