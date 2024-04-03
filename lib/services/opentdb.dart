import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/trivia_question.dart';

class TriviaApiService {
  static const String _baseUrl = 'https://opentdb.com/api.php';

  Future<List<TriviaQuestion>> fetchTriviaQuestions(
      {required int amount, int? categoryID}) async {
    final url = Uri.parse('$_baseUrl?amount=$amount&type=multiple' +
        (categoryID != null ? '&category=$categoryID' : ''));

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['response_code'] == 0) {
        final List<dynamic> results = data['results'];
        return results.map((json) => TriviaQuestion.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load trivia questions');
      }
    } else {
      throw Exception('Failed to load trivia questions');
    }
  }
}
