import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/model/course/course_exercise_response.dart';
import 'package:flutter_application_2/repository/course/course_repository.dart';



part 'course_exercise_event.dart';
part 'course_exercise_state.dart';

class CourseExerciseBloc
    extends Bloc<CourseExerciseEvent, CourseExerciseState> {
  final CourseRepository courseRepository;

  CourseExerciseBloc({required this.courseRepository})
      : super(CourseExerciseInitial()) {
    on<CourseExerciseEvent>((events, emit) async {
      if (events is GetCourseExerciseEvent) {
        emit(CourseExerciseLoading());

        final data =
            await courseRepository.getCourseExerciseList(events.courseId);

        emit(CourseExerciseSuccess(courseExerciseList: data));
      }
    });
  }
}
