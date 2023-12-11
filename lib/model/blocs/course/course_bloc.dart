import 'package:flutter_application_2/model/course/course_exercise_response.dart';
import 'package:flutter_application_2/repository/course/course_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/model/course/course_response.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;


  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseEvent>((events, emit)async {
      if (events is GetCourseListEvent){
        emit (CourseLoading());
        
        final data = await courseRepository.getCourselist(events.majorName);

        emit(CourseSuccess(courseList: data));
        
      } 
      
    });
  }
}
