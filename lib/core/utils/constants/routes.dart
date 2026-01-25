import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/screens/quiz_screen.dart';
 

class Routes {
  
  static const String quizScreen = "/quiz";
 
  static Map<String, WidgetBuilder> get routes => {
    
     quizScreen: (context) => const QuizScreen(),
 
  };
}
