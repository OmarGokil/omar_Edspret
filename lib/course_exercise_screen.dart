import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/course_exercise/course_exercise_bloc.dart';

class CourseExerciseScreen extends StatelessWidget {
  final String corsseTitle;
  const CourseExerciseScreen({super.key, required this.corsseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A7FD5),
        title: Text(
          corsseTitle,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CourseExerciseBloc, CourseExerciseState>(
          builder: (context, state) {
            if (state is CourseExerciseSuccess) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: state.courseExerciseList.length,
                itemBuilder: (context, index) {
                  final exersice = state.courseExerciseList[index];
                  return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                            ),
                            padding: const EdgeInsets.all(11),
                            child: Column(
                              children: [
                                Image.network(
                                  exersice.icon,
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
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  exersice.exerciseTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '${exersice.jumlahDone}/${exersice.jumlahSoal} soal',
                                  style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFF8E8E8E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 8,
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
