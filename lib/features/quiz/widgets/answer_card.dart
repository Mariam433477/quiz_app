import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/colors.dart';
import 'package:quiz_app/core/utils/constants/spacing.dart';
 

class AnswerCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.answerSelectedBg
              : ColorsManager.answerUnselectedBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? ColorsManager.answerSelectedBorder
                : ColorsManager.answerUnselectedBorder,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? ColorsManager.answerSelectedShadow
                  : ColorsManager.answerUnselectedShadow,
              blurRadius: isSelected ? 8 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? ColorsManager.answerCircleSelected
                    : ColorsManager.answerCircleUnselected,
                border: Border.all(
                  color: isSelected
                      ? ColorsManager.answerCircleBorderSelected
                      : ColorsManager.answerCircleBorderUnselected,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: ColorsManager.white,
                    )
                  : null,
            ),
           horizontalSpace12,
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: ColorsManager.answerText,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
