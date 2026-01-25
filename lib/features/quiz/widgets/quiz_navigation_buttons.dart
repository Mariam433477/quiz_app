import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/theme/colors.dart';
 
import 'package:quiz_app/core/utils/constants/spacing.dart';
import 'package:quiz_app/features/quiz/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz/cubit/quiz_state.dart';

class QuizNavigationButtons extends StatelessWidget {
  const QuizNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is! QuizLoaded) return const SizedBox();

        return Row(
          children: [
            // ================= PREVIOUS =================
            Expanded(
              child: ElevatedButton(
                onPressed: state.currentIndex == 0
                    ? null
                    : () {
                        context.read<QuizCubit>().previousQuestion();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.white,
                  foregroundColor: ColorsManager.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: state.currentIndex == 0
                          ? Colors.transparent
                          : ColorsManager.navPrevBorder,
                    ),
                  ),
                  elevation: 0,
                  disabledBackgroundColor:
                      ColorsManager.white,
                  disabledForegroundColor:
                      ColorsManager.navPrevDisabledText,
                ),
                child: const Text('Previous'),
              ),
            ),

            horizontalSpace12,

            // ================= NEXT =================
            Expanded(
              child: ElevatedButton(
                onPressed: state.selectedAnswerIndex == -1
                    ? null
                    : () {
                        context.read<QuizCubit>().nextQuestion();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.amber,
                  foregroundColor: ColorsManager.navNextText,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  disabledBackgroundColor:
                      ColorsManager.navNextDisabledBg,
                  disabledForegroundColor:
                      ColorsManager.navNextDisabledText,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
