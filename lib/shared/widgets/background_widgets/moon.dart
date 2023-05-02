import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../changes/strings.dart';
import 'size_config.dart';

class Moon extends StatelessWidget {
  const Moon({
    required Duration duration,
    required this.isFullMoon,
  })  : _duration = duration;

  final Duration _duration;
  final bool isFullMoon;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      curve: Curves.easeInOut,
      left: 45.w,
      top: isFullMoon ? -8.h : -50.h,
      child: SvgPicture.asset(StaticImage.moon,
      ),
    );
  }
}
