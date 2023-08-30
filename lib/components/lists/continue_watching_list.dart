


import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/cards/continue_watching_card.dart';
import 'package:flutter_course_app/model/course.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ContinueWatchingList extends StatefulWidget {
  const ContinueWatchingList({super.key});

  @override
  State<ContinueWatchingList> createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
              controller: _pageController,
              itemCount: continueWatchingCourses.length,

              itemBuilder: (context, index){
                return ContinueWatchingCard(course: continueWatchingCourses[index]);

              }
          ),
        ),
        SizedBox(height: 20,),
        SmoothPageIndicator(
          effect: JumpingDotEffect(activeDotColor: Colors.blueAccent),
          controller: _pageController,
          count: recentCourses.length,
        ),
      ],
    );
  }
}


