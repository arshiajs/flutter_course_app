
import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/home_screen_navbar.dart';
import 'package:flutter_course_app/components/lists/explore_course_list.dart';
import 'package:flutter_course_app/components/lists/recent_coruse_list.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/screeens/continue_watching_screen.dart';
import 'package:flutter_course_app/screeens/sidebar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;

  var sidebarHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),

    ).animate(
        CurvedAnimation(parent: sidebarAnimationController, curve: Curves.easeInOut)
    );
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
        CurvedAnimation(parent: sidebarAnimationController, curve: Curves.easeInOut)

    );
  }
  //to prevent un necessary memory usage
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sidebarAnimationController.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  HomeScreenNavBar(triggerAnimation: (){
                    setState(() {
                      sidebarHidden =! sidebarHidden;
                    });
                    sidebarAnimationController.forward();
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Recents", style: kLargeTitleStyle,),
                        const SizedBox(height: 5,),
                        Text("More courses ... ", style: kSubtitleStyle,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  RecentCourseList(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 16,
                        top: 25
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Explore', style: kTitle1Style,)
                      ],
                    ),
                  ),
                  ExploreCourseList(),
                ],
              ),
            ),
            ContinueWatchingScreen(),
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          sidebarHidden =! sidebarHidden;
                        });
                        sidebarAnimationController.reverse();
                      },
                      child: Container(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: sidebarAnimation,
                    child: SafeArea(
                      child: SidebarScreen(),
                      bottom: false,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}



