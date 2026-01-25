import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/colors.dart';
import 'package:quiz_app/core/theme/text_styles.dart';

class QuestionCard extends StatelessWidget {
  final String question;

  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.questionShadow,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        question,
        textAlign: TextAlign.center,
        style: TextStylesManager.bold18.copyWith(
          height: 1.5,
          color: ColorsManager.black87,
        ),
      ),
    );
  }
}
