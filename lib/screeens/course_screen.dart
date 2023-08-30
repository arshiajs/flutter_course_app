import 'package:flutter/material.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:flutter_course_app/model/course.dart';
import 'package:flutter_course_app/screeens/course_sections_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  CourseScreen({super.key, required this.course});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {

  Widget indicators() {
    List<Widget> indicators = [];

    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
        width: 7.0,
        height: 7.0,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == 0 ? const Color(0xFF0971FE) : const Color(0xFFA6AEBD)),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  late PanelController panelController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    panelController = PanelController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SlidingUpPanel(
          controller: panelController,
          backdropEnabled: true,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(34)),
          color: kCardPopupBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, -12),
              blurRadius: 32
            )
          ],
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height*0.9,
          panel: CourseSectionScreen(

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(gradient: widget.course.background),
                            child: SafeArea(
                              bottom: false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              padding: EdgeInsets.all(8),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(18)),
                                              child: Hero(
                                                tag: widget.course.logo,
                                                child: Image.asset(
                                                    'asset/logos/${widget.course.logo}'),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Hero(
                                              tag: widget.course.courseSubtitle,
                                              child: Text(
                                                widget.course.courseSubtitle,
                                                style: kTitle1Style.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Hero(
                                              tag: widget.course.courseTitle,
                                              child: Text(
                                                widget.course.courseTitle,
                                                style: kTitle2Style.copyWith(
                                                    color: Colors.black, fontSize: 22),
                                              ),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color:
                                                    kPrimaryLabelColor.withOpacity(0.5),
                                              ),
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  Expanded(
                                      child: Hero(
                                        tag: widget.course.illustration,
                                        child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: kShadowColor,
                                  blurRadius: 15,
                                  offset: Offset(0, 4),
                                )
                              ]
                          ),
                          child: Image.asset('asset/icons/icon-play.png')),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: 28.0,
                    right: 28.0,
                    bottom: 20
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: const CircleAvatar(
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                  child: Icon(
                                     Icons.people
                                       ,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "28.7k",
                                style: kTitle2Style,
                              ),
                              Text(
                                "Students",
                                style: kSearchPlaceholderStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 58.0,
                            width: 58.0,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: const CircleAvatar(
                                  radius: 21.0,
                                  backgroundColor: kCourseElementIconColor,
                                  child: Icon(
                                     Icons.format_quote
                                       ,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "12.4k",
                                style: kTitle2Style,
                              ),
                              Text(
                                "Comments",
                                style: kSearchPlaceholderStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      indicators(),
                      GestureDetector(
                        onTap: () {
                          panelController.open();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          width: 80.0,
                          height: 40.0,
                          child: Text(
                            "View all",
                            style: kSearchTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code.",
                        style: kBodyLabelStyle,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "About this course",
                        style: kTitle1Style,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "This course was written for people who are passionate about design and about Apple's SwiftUI. It beginner-friendly, but it is also packed with tricks and cool workflows about building the best UI. Currently, Xcode 11 is still in beta so the installation process may be a little hard. However, once you get everything working, then it'll get much friendlier!",
                        style: kBodyLabelStyle,
                      ),
                      const SizedBox(height: 24.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




