import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';

import '../../changes/strings.dart';
import 'size_config.dart';

class Sun extends StatelessWidget {
  const Sun({
    required Duration duration,
    required this.isFullSun,
  })  : _duration = duration;

  final Duration _duration;
  final bool isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      curve: Curves.easeInOut,
      left: Responsive.isDesktop(context)?40.w:Responsive.isMobile(context)?10.w:30.w,
      top: isFullSun ? -22.h : -50.h,
      child: SvgPicture.asset(StaticImage.sun),
    );
  }
}
