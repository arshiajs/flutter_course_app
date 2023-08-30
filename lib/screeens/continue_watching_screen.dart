import 'package:flutter/material.dart';
import 'package:flutter_course_app/components/certificate_viewer.dart';
import 'package:flutter_course_app/components/lists/continue_watching_list.dart';
import 'package:flutter_course_app/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(34),
          topLeft: Radius.circular(34)
      ),
      color: kCardPopupBackgroundColor,
      boxShadow:  const [
        BoxShadow(
            color: kShadowColor,
            offset: Offset(0, -12),
            blurRadius: 32
        )
      ],
      minHeight: 65,
      maxHeight: MediaQuery.of(context).size.height*0.75,
      panel: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 18
              ),
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFFc5CBD6),
                  borderRadius: BorderRadius.circular(2)
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text('Contiue Watching Screen', style: kTitle1Style,),),
          ContinueWatchingList(),
          const SizedBox(height: 20),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text('Certificates', style: kTitle2Style,),),
          Expanded(child: CertificateViewer()),
        ],
      ),
    );
  }
}


