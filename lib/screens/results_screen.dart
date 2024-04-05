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
        iconTheme: const IconThemeData(color: QuizAppColors.textColor),
        centerTitle: true,
        title: const QuizText(
          text: "Trivia Results",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: QuizText(
                    text: "Category",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "Any",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: QuizText(
                    text: "Difficulty Level",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "Easy",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: QuizText(
                    text: "Total Questions",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "10",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: QuizText(
                    text: "Score",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "80%",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: QuizText(
                    text: "Correct Answers",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "8/10",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: QuizAppColors.buttonColor,
                child: ListTile(
                  title: QuizText(
                    text: "Incorrect Answers",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  trailing: QuizText(
                    text: "2/10",
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
