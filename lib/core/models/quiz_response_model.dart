import 'quiz_question_model.dart';

class QuizResponseModel {
  final int responseCode;
  final List<QuizQuestionModel> results;

  QuizResponseModel({
    required this.responseCode,
    required this.results,
  });

  factory QuizResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizResponseModel(
      responseCode: json['response_code'],
      results: (json['results'] as List)
          .map((e) => QuizQuestionModel.fromJson(e))
          .toList(),
    );
  }
}
