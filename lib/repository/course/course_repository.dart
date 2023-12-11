import 'package:dio/dio.dart';
import 'package:flutter_application_2/constants/constans.dart';
import 'package:flutter_application_2/model/course/course_exercise_response.dart';
import 'package:flutter_application_2/model/course/course_response.dart';


class CourseRepository{

  Future <List<CourseData>> getCourselist([String])async{ 


    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_course?major_name=IPA&user_email=testerngbayu@gmail.com';

      final response = await Dio().get(url,options: Options(
        headers: {"x-api-key" : "18be70c0-4e4d-44ff-a475-50c51ece99a0"},
      ),
    );

      final courseResponse = CourseResponse.fromJson(response.data);

      return courseResponse.data;
    } catch (e) {
      print('Error at CourseRepository $e');
      rethrow;
    }

    
  }

  Future<List<CourseExercisesData>> getCourseExerciseList(String courseId)async{
    try {
      const url = 'https://edspert.widyaedu.com/exercise/data_exercise';
      
       

      final response = await Dio().get(url,queryParameters: {
        "course_id":courseId,
        "user_email":"testerngbayu@gmail.com",
      }, options: Options(
        headers: LearningConstans.headers.toJson(),
      ),
    );
      
      final courseExercisesData = CourseExercisesResponse.fromJson(response.data);

      return courseExercisesData.data;

    } catch (e) {
       print('Error at CourseRepository getCourseExerciseList $e');
      rethrow;
    }
  }


}