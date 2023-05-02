import 'package:flutter/material.dart';
import 'package:messagy_app/shared/changes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class buildIndicator extends StatelessWidget {
  const buildIndicator({
    super.key,
    required this.current,
    required this.count
  });

  final int current;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: current,
      count: count,
      effect:  ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: primaryColor,
        dotHeight: 10,
        expansionFactor: 4,
        dotWidth: 10,
        spacing: 5.0,
      ),
    );
  }
}