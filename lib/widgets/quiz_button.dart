import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

// class QuizButton extends StatelessWidget {
//   void Function()? onPressed;
//   Widget? child;

//   QuizButton({
//     super.key,
//     required this.onPressed,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFF3B3B4F),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         shape: const BeveledRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(2),
//           ),
//         ),
//         side: const BorderSide(width: 2, color: Color(0xFFF5F6F7)),
//       ),
//       child: child,
//     );
//   }
// }

class QuizButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const QuizButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              // Color when button is pressed
              return QuizAppColors.darkColor; // Lighter retro purple
            }
            // Default color
            return QuizAppColors.buttonColor; // Retro purple
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.fromLTRB(20, 20, 20, 20),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            width: 2,
            color: QuizAppColors.textColor,
          ),
        ),
      ),
      child: child,
    );
  }
}
