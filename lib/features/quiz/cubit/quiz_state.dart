import 'package:quiz_app/core/models/quiz_question_model.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuizQuestionModel> questions;
  final int currentIndex;
  final int selectedAnswerIndex;
  final int score;
  final int timer;

  QuizLoaded({
    required this.questions,
    required this.currentIndex,
    required this.selectedAnswerIndex,
    required this.score,
    required this.timer,
  });

  QuizLoaded copyWith({
    int? currentIndex,
    int? selectedAnswerIndex,
    int? score,
    int? timer,
  }) {
    return QuizLoaded(
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswerIndex:
          selectedAnswerIndex ?? this.selectedAnswerIndex,
      score: score ?? this.score,
      timer: timer ?? this.timer,
    );
  }
}

class QuizFinished extends QuizState {
  final int score;
  final int total;

  QuizFinished({
    required this.score,
    required this.total,
  });
}

class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}
