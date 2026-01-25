 
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/network/remote/endpoints.dart';
import 'package:quiz_app/features/quiz/cubit/quiz_cubit.dart';
 
 

final sl = GetIt.instance;

Future<void> initInjections() async {
  sl.registerFactory(() => QuizCubit());
 sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );

}
