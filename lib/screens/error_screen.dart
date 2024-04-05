import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/made_by_lovish.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/widgets/quiz_text.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMesage;
  const ErrorScreen({required this.errorMesage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QuizAppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: QuizAppColors.darkColor,
        centerTitle: true,
        title: const QuizText(text: "T R I V I A   A P P"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.xmark,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            QuizText(
              text: errorMesage,
              fontSize: 40,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const MadeByLovish(),
    );
  }
}
