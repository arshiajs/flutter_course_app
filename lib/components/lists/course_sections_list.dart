

import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/cards/course_sections_card.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/model/course.dart';

class CourseSectionList extends StatelessWidget {

  List<Widget> courseSectionsWidgets(){
    List<Widget> cards = [];
    for (var course in courseSections){

      cards.add(
          Padding(padding: EdgeInsets.only(bottom: 20),
            child: CourseSectionCard(course: course),
          )
      );
    }
    cards.add(
        Padding(padding: EdgeInsets.only(top: 12, bottom: 20),
          child: Text("No more Sections to view", style: kSubtitleStyle, textAlign: TextAlign.center,),
        )
    );
    return cards;
  }

  const CourseSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      children:  courseSectionsWidgets(),

    ));
  }
}
