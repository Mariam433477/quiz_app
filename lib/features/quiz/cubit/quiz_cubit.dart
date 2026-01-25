import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/models/quiz_question_model.dart';
import 'package:quiz_app/core/network/remote/dio_helper.dart';
import 'package:quiz_app/core/network/remote/endpoints.dart';
import 'package:quiz_app/main.dart';
import 'quiz_state.dart';
QuizCubit get quizCubit => QuizCubit.get(navigatorKey.currentContext!);
class QuizCubit extends Cubit<QuizState> {
  static QuizCubit get(BuildContext context) => BlocProvider.of(context);
  QuizCubit() : super(QuizInitial());

  Timer? _timer;

  static const int questionDuration = 15;

  /// حفظ إجابة كل سؤال (index السؤال : index الإجابة)
  final Map<int, int> _answers = {};

  // ================= FETCH QUIZ =================
  Future<void> fetchQuiz() async {
    emit(QuizLoading());

    final result = await DioHelper.getData(
      url: EndPoints.quiz,
    );

    result.fold(
      (failure) {
        emit(QuizError(failure));
      },
      (response) {
        final List questionsJson = response.data['results'];

        final questions = questionsJson
            .map<QuizQuestionModel>(
              (q) => QuizQuestionModel.fromJson(q),
            )
            .toList();

        _answers.clear();

        emit(
          QuizLoaded(
            questions: questions,
            currentIndex: 0,
            selectedAnswerIndex: -1,
            score: 0,
            timer: questionDuration,
          ),
        );

        _startTimer();
      },
    );
  }

  // ================= SELECT ANSWER =================
  void selectAnswer(int index) {
    if (state is! QuizLoaded) return;

    final current = state as QuizLoaded;

    _answers[current.currentIndex] = index;

    emit(
      current.copyWith(
        selectedAnswerIndex: index,
      ),
    );
  }

  // ================= NEXT QUESTION =================
  void nextQuestion() {
    if (state is! QuizLoaded) return;

    final current = state as QuizLoaded;
    _timer?.cancel();

    int newScore = current.score;

    final selectedIndex = _answers[current.currentIndex];
    final question = current.questions[current.currentIndex];

    // نحسب score مرة واحدة بس
    if (selectedIndex != null &&
        question.answers[selectedIndex] ==
            question.correctAnswer) {
      final alreadyCounted =
          current.selectedAnswerIndex == selectedIndex;
      if (!alreadyCounted) {
        newScore++;
      }
    }

    // لو آخر سؤال
    if (current.currentIndex + 1 >= current.questions.length) {
      emit(
        QuizFinished(
          score: newScore,
          total: current.questions.length,
        ),
      );
      return;
    }

    emit(
      current.copyWith(
        currentIndex: current.currentIndex + 1,
        selectedAnswerIndex:
            _answers[current.currentIndex + 1] ?? -1,
        score: newScore,
        timer: questionDuration,
      ),
    );

    _startTimer();
  }

  // ================= PREVIOUS QUESTION =================
  void previousQuestion() {
    if (state is! QuizLoaded) return;

    final current = state as QuizLoaded;

    if (current.currentIndex == 0) return;

    emit(
      current.copyWith(
        currentIndex: current.currentIndex - 1,
        selectedAnswerIndex:
            _answers[current.currentIndex - 1] ?? -1,
        timer: questionDuration,
      ),
    );

    _startTimer();
  }

  // ================= TIMER =================
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state is QuizLoaded) {
        final current = state as QuizLoaded;
        if (current.timer == 0) {
          nextQuestion();
        } else {
          emit(
            current.copyWith(
              timer: current.timer - 1,
            ),
          );
        }
      }
    });
  }

  // ================= RESTART =================
  void restartQuiz() {
    _timer?.cancel();
    _answers.clear();
    fetchQuiz();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
