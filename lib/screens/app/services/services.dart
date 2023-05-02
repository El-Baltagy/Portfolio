import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/screens/app/services/services_desktop.dart';
import 'package:messagy_app/screens/app/services/services_mobile.dart';
import 'package:messagy_app/shared/core/animations/entrance_fader.dart';

import '../../../shared/changes/constants.dart';
import '../../../shared/core/res/responsive.dart';


class Services extends StatelessWidget {

  Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=mainCubit.get(context);
    return  EntranceFader(
      delay: cubit.isVerticalView?noDelayEntrance:delayEntrance,
      duration: cubit.isVerticalView?noDurationEntrance:durationEntrance,
      offset:noOffsetEntrance,
      child: Responsive(
        mobile: ServiceMobile(),
        tablet: ServiceDesktop(),
        desktop: ServiceDesktop(),
      ),
    );
  }
}
