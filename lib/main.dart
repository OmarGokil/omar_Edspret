import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs/course/course_bloc.dart';
import 'package:flutter_application_2/blocs/course_exercise/course_exercise_bloc.dart';
import 'package:flutter_application_2/repository/course/course_repository.dart';
import 'package:flutter_application_2/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseBloc(courseRepository: CourseRepository())
            ..add(
              GetCourseListEvent(majorName: 'IPA'),
            ),
        ),
        BlocProvider(
          create: (context) => CourseExerciseBloc(courseRepository: CourseRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: 
              ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 92, 59, 149)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
