import 'package:flutter/material.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/models/trivia_question.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_button.dart';
import 'package:quiz_app/widgets/quiz_text.dart';
import 'package:quiz_app/services/opentdb.dart';

class GameScreen extends StatefulWidget {
  final int categoryID;
  final int numberOfQuestions;
  final String difficulty;
  const GameScreen({
    super.key,
    required this.categoryID,
    required this.numberOfQuestions,
    required this.difficulty,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<TriviaQuestion> _questions = [];
  int _currentIndex = 0;
  // bool _answerSubmitted = false;
  // final List<String> _options = [
  //   'Option 1',
  //   'Option 2',
  //   'Option 3',
  //   'Option 4'
  // ]; // Example options
  // final List<String> _questions = [
  //   // Example questions
  //   'Question 1: What is the capital of France?',
  //   'Question 2: What is the largest planet in our solar system?',
  //   'Question 3: Who wrote "To Kill a Mockingbird"?',
  // ];

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
        categoryID: widget.categoryID >= 9 ? widget.categoryID : null,
        difficulty: widget.difficulty,
      ); // Example: 10 questions from General Knowledge category (id: 9)
      setState(() {
        _questions = questions;
      });
    } catch (e) {
      print('Error fetching trivia questions: $e');
    }
  }

  void _checkAnswer(String selectedOption) {
    setState(() {
      // _answerSubmitted = true;
      if (selectedOption == _questions[_currentIndex].correctAnswer) {
        // Correct answer
        _questions[_currentIndex].isCorrect = true;
      } else {
        // Incorrect answer
        _questions[_currentIndex].isCorrect = false;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _questions.length;
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
