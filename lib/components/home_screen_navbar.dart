

import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/searchfield_widget.dart';
import 'package:flutter_course_app/components/sidebar_button.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/screeens/profile_Screen.dart';

class HomeScreenNavBar extends StatelessWidget {
   HomeScreenNavBar({super.key, required this.triggerAnimation});
  final Function triggerAnimation;


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarButton(triggerAnimation: triggerAnimation),
          SearchFieldWidget(),
          const Icon(Icons.notifications, color: kPrimaryLabelColor,),
          const SizedBox(width: 16,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('asset/images/profile.jpg',),
            ),
          )
        ],
      ),
    );
  }
}

