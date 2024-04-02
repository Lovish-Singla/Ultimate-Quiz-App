import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  void Function()? onPressed;
  Widget? child;

  QuizButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3B3B4F), // Retro purple
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
        side: const BorderSide(width: 2, color: Color(0xFFF5F6F7)),
      ),
      child: child,
    );
  }
}
