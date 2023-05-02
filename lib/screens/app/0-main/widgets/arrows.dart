import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/utils.dart';
import '../../../../shared/widgets/arrows.dart';
import '../../../../shared/widgets/navbar_actions_button.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_states.dart';

class Arrows extends StatelessWidget {
  const Arrows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<mainCubit,mainStates>(
      builder: (context, state) {
        final cubit=mainCubit.get(context);
        return !cubit.isVerticalView?Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                 cubit.SelectedIndex!=0?
                 Transform.rotate(
                     angle: pi,
                     child: Arrow(isAdd: false,)):Container(),

                  Spacer(),
                  cubit.SelectedIndex<BodyUtils.viewsVT.length-1? Arrow(isAdd: true,):Container(),
                ],
              ),
            )
          ],
        ):Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: Responsive.isDesktop(context)? 33.h:26.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  cubit.SelectedIndex!=0?
                  Transform.rotate(
                      angle: 1.5*pi,
                      child: Arrow(isAdd: false,))
                      : Container(),
                  if (Responsive.isTablet(context))
                    ...[
                      Spacer(),
                      NavBarActionButton(20)
                    ],
                  Spacer(),
                  cubit.SelectedIndex<BodyUtils.viewsVT.length-1? Transform.rotate(
                      angle: 0.5*pi,
                      child: Arrow(isAdd: true,)):Container()
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
