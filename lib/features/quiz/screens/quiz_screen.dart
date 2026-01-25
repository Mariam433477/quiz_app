import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/theme/colors.dart';
 
import 'package:quiz_app/core/theme/text_styles.dart';
import 'package:quiz_app/core/utils/constants/primary/conditional_builder.dart';
import 'package:quiz_app/core/utils/constants/spacing.dart';
import 'package:quiz_app/features/quiz/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz/cubit/quiz_state.dart';

import '../widgets/answer_card.dart';
import '../widgets/quiz_navigation_buttons.dart';
import '../widgets/question_card.dart';
import '../widgets/question_header.dart';
import '../widgets/timer_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: ColorsManager.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsManager.primaryDark,
              ColorsManager.primaryLight,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: BlocBuilder<QuizCubit, QuizState>(
              builder: (context, state) {
                // ================= FINISHED =================
                if (state is QuizFinished) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorsManager.glassBackground,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: ColorsManager.glassBorder,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.emoji_events_rounded,
                            size: 80,
                            color: ColorsManager.amber,
                          ),
                          verticalSpace24,
                          Text(
                            'Quiz Completed!',
                            style: TextStylesManager.bold24.copyWith(
                              color: ColorsManager.textPrimary,
                            ),
                          ),
                          verticalSpace16,
                          Text(
                            'Your Score',
                            style: TextStylesManager.medium18.copyWith(
                              color: ColorsManager.textSecondary,
                            ),
                          ),
                          verticalSpace8,
                          Text(
                            '${state.score} / ${state.total}',
                            style: TextStylesManager.bold48.copyWith(
                              color: ColorsManager.textPrimary,
                            ),
                          ),
                          verticalSpace32,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<QuizCubit>().restartQuiz();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorsManager.buttonBackground,
                                foregroundColor:
                                    ColorsManager.buttonText,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 4,
                              ),
                              child: Text(
                                'Restart Quiz',
                                style: TextStylesManager.bold16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // ================= LOADING / ERROR / SUCCESS =================
                return ConditionalBuilder(
                  loadingState: state is QuizLoading,
                  errorState: state is QuizError,
                  errorBuilder: (context) {
                    final errorState = state as QuizError;
                    return Center(
                      child: Text(
                        errorState.message,
                        style: const TextStyle(
                          color: ColorsManager.red,
                        ),
                      ),
                    );
                  },
                  successBuilder: (context) {
                    final loadedState = state as QuizLoaded;
                    final question =
                        loadedState.questions[loadedState.currentIndex];

                    return Column(
                      children: [
                        QuestionHeader(
                          current: loadedState.currentIndex + 1,
                          total: loadedState.questions.length,
                          category: question.category,
                          difficulty: question.difficulty,
                        ),
                        verticalSpace24,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TimerWidget(seconds: loadedState.timer),
                                verticalSpace24,
                                QuestionCard(
                                  question: question.question,
                                ),
                                verticalSpace24,
                                ...List.generate(
                                  question.answers.length,
                                  (index) => AnswerCard(
                                    text: question.answers[index],
                                    isSelected:
                                        loadedState.selectedAnswerIndex ==
                                            index,
                                    onTap: () {
                                      context
                                          .read<QuizCubit>()
                                          .selectAnswer(index);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace16,
                        const QuizNavigationButtons(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
