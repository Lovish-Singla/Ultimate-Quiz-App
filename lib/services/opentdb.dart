import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/trivia_question.dart';

class TriviaApiService {
  static const String _baseUrl = 'https://opentdb.com/api.php';

  Future<List<TriviaQuestion>> fetchTriviaQuestions({
    required int amount,
    int? categoryID,
    String? difficulty,
  }) async {
    String queryParams = 'amount=$amount&type=multiple';
    if (categoryID != null) {
      queryParams += '&category=$categoryID';
    }
    if (difficulty != null) {
      queryParams += '&difficulty=$difficulty';
    }

    final url = Uri.parse('$_baseUrl?$queryParams');

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
