import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/utils/colors.dart';

class QuizText extends StatelessWidget {
  const QuizText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: GoogleFonts.turretRoad(
        textStyle: TextStyle(
          color: QuizAppColors.textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
