import 'package:flutter/material.dart';

class ColorsManager {
  // ===== Primary Colors =====
  static const Color primaryDark = Color(0xFF3E5151);
  static const Color primaryLight = Color(0xFFDECBA4);

  // ===== Common =====
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color amber = Colors.amber;
  static const Color red = Colors.red;

  // ===== AppBar =====
  static const Color transparent = Colors.transparent;

  // ===== Quiz Result Card =====
  static Color glassBackground = Colors.white.withValues(alpha: .1);
  static Color glassBorder = Colors.white.withValues(alpha:0.2);

  // ===== Text =====
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  // ===== Button =====
  static const Color buttonBackground = Colors.amber;
  static const Color buttonText = Colors.black87;
  // ===== Base =====
 
  static const Color grey = Colors.grey;

  // ===== Answer Card =====
  static Color answerSelectedBg = Colors.amber.withValues(alpha:0.2);
  static const Color answerUnselectedBg = Colors.white;

  static const Color answerSelectedBorder = Colors.amber;
  static const Color answerUnselectedBorder = Colors.transparent;

  static Color answerSelectedShadow = Colors.amber.withValues(alpha:0.3);
  static Color answerUnselectedShadow = Colors.black.withValues(alpha:0.05);

  static const Color answerCircleSelected = Colors.amber;
  static Color answerCircleUnselected = Colors.grey.shade200;

  static const Color answerCircleBorderSelected = Colors.amber;
  static Color answerCircleBorderUnselected = Colors.grey;

  static const Color answerText = Colors.black87;

  // ===== Question Card =====
  static const Color questionCardBackground = Colors.white;
  static const Color questionText = Colors.black87;

  static Color questionShadow =
      Colors.black.withValues(alpha:0.1);
      // ===== Question Header =====
  static const Color headerTitle = Colors.white;
  static const Color headerSubtitle = Colors.white70;

  static Color headerBadgeBg = Colors.white.withValues(alpha:0.2);
  static Color headerBadgeBorder = Colors.white.withValues(alpha:0.3);
  static const Color headerBadgeText = Colors.white;

  static Color progressBackground = Colors.white.withValues(alpha:0.2);
  static const Color progressValue = Colors.amber;
    // ===== Navigation Buttons =====
  static const Color navPrevBg = Colors.white;
  static const Color navPrevText = Colors.black87;
  static const Color navPrevBorder = Colors.black12;

  static const Color navNextBg = Colors.amber;
  static const Color navNextText = Colors.black;

  static Color navNextDisabledBg = Colors.amber.withValues(alpha:0.3);
  static const Color navNextDisabledText = Colors.black26;

  static const Color navPrevDisabledBg = Colors.white;
  static Color navPrevDisabledText = Colors.grey.shade300;

  // ===== Timer =====
  static const Color timerBackground = Colors.white;
  static Color timerShadow = Colors.black.withValues(alpha:0.1);

  static Color timerProgressBg = Colors.grey.shade200;

  static const Color timerNormal = Colors.amber;
  static const Color timerWarning = Colors.red;

  static const Color timerTextNormal = Colors.black87;
  static const Color timerTextWarning = Colors.red;

}
