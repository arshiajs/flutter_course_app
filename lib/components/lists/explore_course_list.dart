
import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/cards/explore_course_card.dart';
import 'package:flutter_course_app/model/course.dart';

class ExploreCourseList  extends StatelessWidget {
  const ExploreCourseList  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20),
        physics: BouncingScrollPhysics(),
        itemCount: exploreCourses.length,
        itemBuilder: (context, index){

          return ExploreCourseCard(course:exploreCourses[index],);
        },

      ),
    );
  }
}
