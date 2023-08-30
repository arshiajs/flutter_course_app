import 'package:flutter/material.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/model/sidebar.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({required this.item});
  final SidebarItem item;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        const SizedBox(width: 12,),
        Container(child: Text(item.title, style: kCalloutLabelStyle))
      ],
    );
  }
}
