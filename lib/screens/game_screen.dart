import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/models/trivia_question.dart';
import 'package:quiz_app/screens/error_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_button.dart';
import 'package:quiz_app/widgets/quiz_text.dart';
import 'package:quiz_app/services/opentdb.dart';

class GameScreen extends StatefulWidget {
  final Category category;
  final int numberOfQuestions;
  final String difficulty;
  const GameScreen({
    super.key,
    required this.category,
    required this.numberOfQuestions,
    required this.difficulty,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<TriviaQuestion> _questions = [];
  int _currentIndex = 0;
  List<bool?> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    _fetchTriviaQuestions();
  }

  Future<void> _fetchTriviaQuestions() async {
    try {
      final apiService = TriviaApiService();
      final questions = await apiService.fetchTriviaQuestions(
        amount: 10,
        categoryID: widget.category.id >= 9 ? widget.category.id : null,
        difficulty: widget.difficulty,
      ); // Example: 10 questions from General Knowledge category (id: 9)
      setState(() {
        _questions = questions;
        _userAnswers = List<bool?>.filled(questions.length, null);
      });
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ErrorScreen(errorMesage: 'Error fetching trivia questions: $e'),
        ),
      );
    }
  }

  void _checkAnswer(String selectedOption) {
    setState(() {
      final isCorrect =
          selectedOption == _questions[_currentIndex].correctAnswer;
      _questions[_currentIndex].isCorrect = isCorrect;
      _userAnswers[_currentIndex] = isCorrect;
      // print(selectedOption);
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _questions.length;
      if (_currentIndex == _questions.length - 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsPage(
              questions: _questions,
              userAnswers: _userAnswers,
              category: widget.category,
              difficulty: widget.difficulty,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizAppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: QuizAppColors.darkColor,
        iconTheme: const IconThemeData(color: QuizAppColors.textColor),
        title: const QuizText(
          text: "T R I V I A",
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: _questions.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: QuizAppColors.textColor,
              ),
            )
          : Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuizText(
                        text:
                            "Question ${_currentIndex + 1} of ${_questions.length}",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      QuizText(
                        text: _questions[_currentIndex].question,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: _questions[_currentIndex]
                            .options
                            .map(
                              (option) => Column(
                                children: [
                                  QuizButton(
                                    onPressed: () {
                                      _checkAnswer(option);
                                      _nextQuestion();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        QuizText(
                                          text: option,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        // if (_answerSubmitted &&
                                        //     option ==
                                        //         _questions[_currentIndex]
                                        //             .correctAnswer)
                                        //   const Icon(
                                        //     Icons.check_rounded,
                                        //     color: Colors.green,
                                        //   ),
                                        // if (_answerSubmitted &&
                                        //     option !=
                                        //         _questions[_currentIndex]
                                        //             .correctAnswer)
                                        //   const Icon(
                                        //     Icons.close_rounded,
                                        //     color: Colors.red,
                                        //   )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(180, 20, 10, 20),
                        child: ElevatedButton(
                          onPressed: _nextQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: QuizAppColors.buttonColor,
                            shape: BeveledRectangleBorder(
                              side: const BorderSide(
                                width: 2,
                                color: QuizAppColors.textColor,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: const QuizText(
                            text: "Next Question",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: const MadeByLovish(),
    );
  }
}
