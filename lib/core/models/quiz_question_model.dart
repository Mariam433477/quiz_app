class QuizQuestionModel {
  final String question;
  final String correctAnswer;
  final List<String> answers;
  final String category;
  final String difficulty;

  QuizQuestionModel({
    required this.question,
    required this.correctAnswer,
    required this.answers,
    required this.category,
    required this.difficulty,
  });

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    final List<String> allAnswers = [
      json['correct_answer'],
      ...json['incorrect_answers'],
    ]..shuffle();

    return QuizQuestionModel(
      question: _decodeHtml(json['question']),
      correctAnswer: json['correct_answer'],
      answers: List<String>.from(allAnswers),
      category: json['category'],
      difficulty: json['difficulty'],
    );
  }

  // عشان &#039; &quot; …
  static String _decodeHtml(String text) {
    return text
        .replaceAll('&#039;', "'")
        .replaceAll('&quot;', '"')
        .replaceAll('&rsquo;', '’')
        .replaceAll('&ldquo;', '“')
        .replaceAll('&rdquo;', '”');
  }
}
