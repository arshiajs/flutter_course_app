
import 'package:flutter/material.dart';
import 'package:flutter_course_app/constants.dart';

class SideBarButton extends StatelessWidget {

  const SideBarButton({
    super.key, required this.triggerAnimation,
  });
  final Function triggerAnimation;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // this is for: when taping the buttom, it done just for bottom
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(
          maxHeight: 40,
          maxWidth: 40
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow:  const [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16,
              )
            ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
      onPressed: (){
        triggerAnimation();
      },
    );
  }
}
