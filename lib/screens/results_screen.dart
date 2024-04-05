import 'package:flutter/material.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/models/trivia_question.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class ResultsPage extends StatefulWidget {
  final Category category;
  final String difficulty;
  final List<TriviaQuestion> questions;
  final List<bool?> userAnswers;

  const ResultsPage({
    required this.category,
    required this.difficulty,
    required this.questions,
    required this.userAnswers,
    super.key,
  });

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    int totalQuestions = widget.questions.length;
    int correctAnswers =
        widget.userAnswers.where((answer) => answer == true).length;
    int incorrectAnswers = totalQuestions - correctAnswers;
    double score = (correctAnswers / totalQuestions) * 100;
    Category category = widget.category;
    String dificulty = widget.difficulty;

    return Scaffold(
      backgroundColor: QuizAppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: QuizAppColors.darkColor,
        iconTheme: const IconThemeData(color: QuizAppColors.textColor),
        centerTitle: true,
        title: const QuizText(
          text: "Trivia Results",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: const QuizText(
                    text: "Category",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "$category",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: const QuizText(
                    text: "Difficulty Level",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: dificulty,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: const QuizText(
                    text: "Total Questions",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "$totalQuestions",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: const QuizText(
                    text: "Score",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "$score%",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: const QuizText(
                    text: "Correct Answers",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "$correctAnswers/$totalQuestions",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: const QuizText(
                    text: "Incorrect Answers",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "$incorrectAnswers/$totalQuestions",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MadeByLovish(),
    );
  }
}
