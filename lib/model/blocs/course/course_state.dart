part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CourseData> courseList;

  CourseSuccess ({required this.courseList});
}

final class CourseFailed extends CourseState {
  final String errormessage;

  CourseFailed ({required this.errormessage});
}




final class CourseExerciseLoading extends CourseState {}

final class CourseExerciseSuccess extends CourseState {
  final List<CourseExercisesData> courseExerciseList;

  CourseExerciseSuccess ({required this.courseExerciseList});
}

final class CourseExerciseFailed extends CourseState {
  final String errormessage;

  CourseExerciseFailed ({required this.errormessage});
}