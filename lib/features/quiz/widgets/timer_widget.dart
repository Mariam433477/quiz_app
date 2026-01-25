import 'package:flutter/material.dart';
import 'package:quiz_app/core/theme/colors.dart';
 
import 'package:quiz_app/core/theme/text_styles.dart';

class TimerWidget extends StatelessWidget {
  final int seconds;

  const TimerWidget({
    super.key,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    // 15 seconds is the max time
    final double progress = seconds / 15;

    final bool isWarning = seconds <= 5;

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ColorsManager.timerShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 6,
              backgroundColor: ColorsManager.timerProgressBg,
              valueColor: AlwaysStoppedAnimation<Color>(
                isWarning
                    ? ColorsManager.red
                    : ColorsManager.amber,
              ),
            ),
          ),
          Text(
            seconds.toString(),
            style: TextStylesManager.bold24.copyWith(
              color: isWarning
                  ? ColorsManager.red
                  : ColorsManager.black87,
            ),
          ),
        ],
      ),
    );
  }
}
