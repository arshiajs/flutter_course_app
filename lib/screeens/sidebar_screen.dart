

import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/sidebar_row.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/model/sidebar.dart';

class SidebarScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white.withOpacity(0.95),

          borderRadius: BorderRadius.only(topRight: Radius.circular(34, ))
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width*0.85,
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      child:
      SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 35,
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Arshiajs' , style: kTitle1Style.apply(fontSizeDelta: 2),),
                    Text('Flutter Developer', style: kHeadlineLabelStyle,),
                  ],
                )

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1),
            SidebarRow(item: sidebarItem[0]),
            const SizedBox(height: 32,),
            SidebarRow(item: sidebarItem[1]),
            const SizedBox(height: 32,),

            SidebarRow(item: sidebarItem[2]),
            const SizedBox(height: 32,),

            SidebarRow(item: sidebarItem[3]),
            const Spacer(),
            Row(
              children: [
                Image.asset('asset/icons/icon-logout.png', width: 20,),
                const SizedBox(width: 10,),
                Text("LogOut", style: kSecondaryCalloutLabelStyle,)
              ],
            )

          ],
        ),
      ),
    );
  }
}
