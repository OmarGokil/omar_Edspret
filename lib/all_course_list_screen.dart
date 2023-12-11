import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/course/course_response.dart';
import 'package:flutter_application_2/widgets/course_card.dart';

class AllCourseListScreen extends StatelessWidget {
  final List<CourseData> courseList;
  const AllCourseListScreen({super.key,required this.courseList,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(backgroundColor: const Color(0xFF3A7FD5),
      title: const Text('Pilih Pelajaran',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22,
        vertical: 12,),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: courseList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8,),
          itemBuilder: (context, index) {
          return CourseCard(course: courseList[index]);
        },),
      ),
    );
      
    
  }
}