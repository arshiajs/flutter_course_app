
import 'package:flutter/material.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/model/course.dart';

class ExploreCourseCard extends StatelessWidget {

  ExploreCourseCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(

        borderRadius: BorderRadius.circular(41),
        child: Container(
          height: 120,
          width: 280,
          decoration: BoxDecoration(
            gradient: course.background,
          ),
          child: Padding
            (padding: EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.courseSubtitle, style: kCardSubtitleStyle,),
                        SizedBox(height: 6,),
                        Text(course.courseTitle, style: kCardTitleStyle,)
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('asset/illustrations/${course.illustration}', fit: BoxFit.cover, height: 100,)

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
