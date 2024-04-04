import 'package:flutter/material.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class ErrorScreen extends StatelessWidget {
  Object? e;
  ErrorScreen({this.e, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const QuizText(text: "T R I V I A   A P P"),
      ),
      body: Center(
        child: Row(
          children: [
            const Icon(
              Icons.close_rounded,
              color: Colors.red,
            ),
            const QuizText(text: "Error Ocurred"),
            const SizedBox(height: 20),
            QuizText(text: e.toString()),
          ],
        ),
      ),
      bottomNavigationBar: const MadeByLovish(),
    );
  }
}
