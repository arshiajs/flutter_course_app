import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/cards/recent_course_card.dart';
import 'package:flutter_course_app/model/course.dart';
import 'package:flutter_course_app/screeens/course_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({super.key});

  @override
  State<RecentCourseList> createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {


  final PageController _pageController = PageController(
    viewportFraction: 0.65,
    initialPage: 0,
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    fullscreenDialog: true,
                      builder: (context) => CourseScreen(course: recentCourses[index],)));
                },
                  child: RecentCourseCard(course: recentCourses[index]));
            },
            itemCount: recentCourses.length,
            controller: _pageController,
          ),
        ),
        SmoothPageIndicator(
          effect: JumpingDotEffect(activeDotColor: Colors.blueAccent),
          controller: _pageController,
          count: recentCourses.length,
        ),

      ],
    );
  }
}
