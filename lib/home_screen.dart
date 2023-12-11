import 'package:flutter/material.dart';
import 'package:flutter_application_2/all_course_list_screen.dart';
import 'package:flutter_application_2/blocs/banner/banner_bloc.dart';
import 'package:flutter_application_2/blocs/course/course_bloc.dart';
import 'package:flutter_application_2/repository/banner/banner__repository.dart';
import 'package:flutter_application_2/widgets/course_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      
        BlocProvider<BannerBloc>(
          create: (context) => BannerBloc(bannerRepository: BannerRepository())
            ..add(GetBannerListEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/5556/5556499.png'),
              ),
            ),
          ],
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai Altop',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 147,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color: const Color(0xFF3A7FD5),
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 26,
                  ),
                  child: Row(
                    children: [ const
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Mau kerjain\nlatihan soal\napa hari ini?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('assets/images/person.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pilih Pelajaran',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    BlocBuilder<CourseBloc, CourseState>(
                      builder: (BuildContext context, state) {
                        if (state is CourseSuccess) {
                          return TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AllCourseListScreen(
                                      courseList: state.courseList);
                                },
                              ));
                            },
                            child: const Text(
                              'Lihat Semua',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          );
                        }

                        return const TextButton(
                          onPressed: null,
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    print(state.runtimeType);

                    if (state is CourseFailed) {}
                    
                    if (state is CourseSuccess) {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        separatorBuilder: (context, index) {
                          return CourseCard(course: state.courseList[index]);
                        },
                      );
                    }

                    return Center(child: const CircularProgressIndicator());
                  },
                ),
                const SizedBox(
                  height: 27,
                ),
                const Text(
                  'Terbaru',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<BannerBloc, BannerState>(
                  builder: (context, state) {
                    if (state is BannerFailed) {}
                    if (state is BannerSuccess) {
                      return SizedBox(
                        height: 146,
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: state.bannerList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: SizedBox(
                                  width: 284,
                                  height: 146,
                                  child: Image.network(
                                    state.bannerList[index].eventImage,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text(
                                        'No Img',
                                        style: TextStyle(
                                          fontSize: 7,
                                        ),
                                        textAlign: TextAlign.center,
                                      );
                                    },
                                  )),
                            );
                          },
                        ),
                      );
                    }

                    return Center(child: const CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
