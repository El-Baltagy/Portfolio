

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/shared/changes/strings.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';

class bildContactAnimy extends StatelessWidget {
  const bildContactAnimy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(StaticImage.contactJson,
      // frameRate: FrameRate(60),
      reverse: true,filterQuality: FilterQuality.high,
      width: 20.w,
      height: Responsive.isMobile(context)?15.h:Responsive.isTablet(context)?20.h:30.h,
      fit:BoxFit.cover
    );
  }
}