import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/shared/changes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../changes/utils.dart';
import 'carousal_slider.dart';




class buildIndic1 extends StatelessWidget {
  const buildIndic1({
    super.key,
    required this.cubit,
  });

  final CarousalCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CarousalCubit,CarousalState,cahngeIndc1>(
        selector: (state) =>cahngeIndc1(cubit.currentIndicator1),
        builder: (context, state) => buildIndicator(
            current:state.index,count: servicesUtils.length)
    );
  }
}
class buildIndic2 extends StatelessWidget {
  const buildIndic2({
    super.key,
    required this.cubit,
  });

  final CarousalCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CarousalCubit,CarousalState,cahngeIndc2>(
        selector: (state) =>cahngeIndc2(cubit.currentIndicator2),
        builder: (context, state) => buildIndicator(
            current:state.index,count: projectUtils.length)
    );
  }
}

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