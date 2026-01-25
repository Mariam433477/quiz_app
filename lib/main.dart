 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/di/injections.dart';
 
import 'package:quiz_app/core/utils/constants/my_bloc_observer.dart';
import 'package:quiz_app/core/utils/constants/routes.dart';
import 'package:quiz_app/features/quiz/cubit/quiz_cubit.dart';
 
 
 

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp(
    ),
  );
}

class MyApp extends StatelessWidget {
 

  const MyApp({
    super.key,
   
  });

@override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (_) => QuizCubit()..fetchQuiz(),
    child: MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
     
      themeMode: ThemeMode.dark,
      routes: Routes.routes,
      initialRoute: Routes.quizScreen,
    ),
  );
}

}
