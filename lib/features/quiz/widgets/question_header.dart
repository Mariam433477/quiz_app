import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/colors.dart';
 
import 'package:quiz_app/core/theme/text_styles.dart';
import 'package:quiz_app/core/utils/constants/spacing.dart';

class QuestionHeader extends StatelessWidget {
  final int current;
  final int total;
  final String category;
  final String difficulty;

  const QuestionHeader({
    super.key,
    required this.current,
    required this.total,
    required this.category,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question $current/$total',
                    style: TextStylesManager.bold20.copyWith(
                      color: ColorsManager.headerTitle,
                    ),
                  ),
               verticalSpace4,
                  Text(
                    category,
                    style: TextStylesManager.medium14.copyWith(
                      color: ColorsManager.headerSubtitle,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
        horizontalSpace16,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.headerBadgeBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorsManager.headerBadgeBorder,
                ),
              ),
              child: Text(
                difficulty,
                style: TextStylesManager.medium12.copyWith(
                  color: ColorsManager.headerBadgeText,
                ),
              ),
            ),
          ],
        ),
     verticalSpace16,
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: 8,
            backgroundColor: ColorsManager.progressBackground,
            valueColor: const AlwaysStoppedAnimation(
              ColorsManager.progressValue,
            ),
          ),
        ),
      ],
    );
  }
}
