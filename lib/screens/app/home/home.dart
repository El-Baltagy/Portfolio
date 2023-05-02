import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/shared/core/animations/entrance_fader.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/constants.dart';
import '../../../shared/core/res/responsive.dart';
import 'home_desktop.dart';
import 'home_mobile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=mainCubit.get(context);
    return  EntranceFader(
      delay: delayEntrance,
      duration: durationEntrance,
      offset:offsetEntrance,
      child: Responsive(
        mobile: HomeMobile( ),
        tablet: HomeDesktop(),
        desktop: HomeDesktop(),
      ),
    );
  }
}
