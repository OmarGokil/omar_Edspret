import 'package:flutter/material.dart';
import 'package:flutter_application_2/course_exercise_screen.dart';
import 'package:flutter_application_2/model/course/course_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../blocs/course_exercise/course_exercise_bloc.dart';

class CourseCard extends StatelessWidget {
  final CourseData course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseExerciseBloc, CourseExerciseState>(
      builder: (context, state) {
        return InkWell(
          onTap: (){
            context.read<CourseExerciseBloc>().add(
              GetCourseExerciseEvent(courseId: course.courseId)
            );

           Navigator.push(context, MaterialPageRoute(builder: (context) => CourseExerciseScreen(corsseTitle: course.courseName,),
           ),
          );

          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 21,
              horizontal: 18,
            ),
            child: Row(
              children: [
                Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Image.network(
                    course.urlCover,
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'No Img',
                        style: TextStyle(
                          fontSize: 7,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.courseName),
                      Text(
                          '${course.jumlahDone}/${course.jumlahMateri}Paket Latihan Soal'),
                      const SizedBox(
                        height: 11,
                      ),
                      const LinearProgressIndicator(
                        value: 0.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
