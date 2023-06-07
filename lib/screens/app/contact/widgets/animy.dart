

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/shared/changes/strings.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/changes/utils.dart';

class bildContactAnimy extends StatelessWidget {
  const bildContactAnimy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)?Lottie.asset(StaticImage.contactJsonDesk,
        // Responsive.isDesktop(context)?StaticImage.contactJsonDesk:StaticImage.contactJsonMob,
      // frameRate: FrameRate(60),
      reverse: true,filterQuality: FilterQuality.high,
      width: 20.w,
      height: Responsive.isMobile(context)?15.h:Responsive.isTablet(context)?20.h:30.h,
      fit:BoxFit.cover
    ):
    SizedBox(
      height: 8.h,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: Responsive.isTablet(context)?35:30,fontWeight: FontWeight.bold,color: Theme.of(context).textColor
        ),
        child: AnimatedTextKit(
          animatedTexts: contactList(),
          repeatForever: true,
        ),
      ),
    );
  }
}