import 'package:html_unescape/html_unescape.dart';

class TriviaQuestion {
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final List<String> options;
  bool? isCorrect;

  TriviaQuestion({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.options,
    this.isCorrect,
  });

  factory TriviaQuestion.fromJson(Map<String, dynamic> json) {
    var unescape = HtmlUnescape();
    final String ques = unescape.convert(json['question']);

    List<String> incorrectOptions =
        List<String>.from(json['incorrect_answers']);
    List<String> incorrAns = [];
    for (var i = 0; i < incorrectOptions.length; i++) {
      String incorrectAns = unescape.convert(incorrectOptions[i]);
      incorrAns.add(incorrectAns);
    }

    final List<String> allOptions = incorrAns;

    allOptions.add(unescape.convert(json['correct_answer']));

    allOptions.shuffle();

    return TriviaQuestion(
      category: json['category'],
      question: ques,
      correctAnswer: unescape.convert(json['correct_answer']),
      incorrectAnswers: incorrectOptions,
      options: allOptions,
      isCorrect: false,
    );
  }
}
