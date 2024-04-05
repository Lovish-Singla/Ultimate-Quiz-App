import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/screens/game_screen.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_button.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizAppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: QuizAppColors.darkColor,
        iconTheme: const IconThemeData(color: QuizAppColors.textColor),
        title: const QuizText(
          text: "Select a Category",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showDialogOptions(context, categories[index]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B3B4F),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                    side: const BorderSide(width: 2, color: Color(0xFFF5F6F7)),
                  ),
                  child: Row(
                    children: [
                      Icon(categories[index].icon),
                      const SizedBox(width: 20),
                      QuizText(
                        text: categories[index].name,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

void _showDialogOptions(BuildContext context, Category category) {
  showDialog(
      context: context,
      builder: (context) {
        int numberOfQuestions = 10;
        String difficulty = "easy";

        return AlertDialog(
          backgroundColor: QuizAppColors.backgroundColor,
          title: QuizText(
            text: category.name,
            fontWeight: FontWeight.bold,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                cursorColor: QuizAppColors.textColor,
                decoration: const InputDecoration(
                  label: QuizText(
                    text: "No. of Ques.",
                    fontWeight: FontWeight.bold,
                  ),
                  helperText: "(< 50)",
                  helperStyle: TextStyle(color: QuizAppColors.textColor),
                ),
                style: const TextStyle(color: QuizAppColors.textColor),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  numberOfQuestions = int.tryParse(value) ?? 10;
                },
              ),
              DropdownButtonFormField(
                value: difficulty,
                dropdownColor: QuizAppColors.backgroundColor,
                items: ['easy', 'medium', 'hard']
                    .map((difficulty) => DropdownMenuItem(
                        value: difficulty,
                        child: QuizText(
                          text: difficulty,
                          fontWeight: FontWeight.bold,
                        )))
                    .toList(),
                onChanged: (value) {
                  difficulty = value!;
                },
              ),
            ],
          ),
          actions: [
            QuizButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(
                      categoryID: category.id,
                      numberOfQuestions: numberOfQuestions,
                      difficulty: difficulty,
                    ),
                  ),
                );
              },
              child: const QuizText(
                text: "Start Game!",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            QuizButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const QuizText(
                text: "Cancel",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      });
}
