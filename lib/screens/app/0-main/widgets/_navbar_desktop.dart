import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_states.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/core/theme/cubit/theme_cubit.dart';
import '../../../../shared/core/theme/cubit/theme_state.dart';
import '../../../../shared/widgets/navbar_actions_button.dart';
import '../../../../shared/widgets/navbar_logo.dart';
class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10,left:10.w,right: 6.w ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           NavBarLogo(height:60 ,width:10.w ),
          Row(children: [
            if (!Responsive.isTablet(context))
              NavBarActionButton(20),
             SizedBox(
              width: 5.w,
            ),
            if (Responsive.isTablet(context))Row(
              children: [
                switchTheme(),
                themeIcons()
              ],
            ),
            if (Responsive.isDesktop(context)) Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                switchTheme(),
                switchScroll(),
              ],
            ),
            if (Responsive.isDesktop(context)) Container(
              height:9.h ,
              width:3.w ,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  themeIcons(),
                  Spacer(),
                  rotationIcons(),
                ],
              ),
            ),
          ],),
        ],
      ),
    );
  }
}

class switchScroll extends StatelessWidget {
  const switchScroll();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<mainCubit,mainStates>(builder:
    (context, state) {
      final cubit=mainCubit.get(context);
      return Switch(
        value: context.read<mainCubit>().isVerticalView,
        activeColor: Theme.of(context).primaryColor,
        inactiveTrackColor: Colors.grey,
        onChanged: (newValue) {
          cubit.updateView();
          cubit.changeIndex(0);
        },
      );
    },);
  }
}

class switchTheme extends StatelessWidget {
  const switchTheme();



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeState>(builder: (context, state) {
      final cubit=ThemeCubit.get(context);
     return Switch(
        value:  cubit.isLightTheme,
        activeColor: Theme.of(context).primaryColor,
        inactiveTrackColor: Colors.grey,
        onChanged: (newValue) {
          cubit.updateTheme(newValue);
          // cubit.updateTheme();
        },
      );
    },);
  }
}

class rotationIcons extends StatelessWidget {
  const rotationIcons();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<mainCubit,mainStates>(builder: (context, state) {
      final cubit=mainCubit.get(context);
      return SizedBox(
          width:3.w ,
          height: 4.h,
          child: Transform.rotate(
              angle:  cubit.isVerticalView?0:0.5*pi,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Theme.of(context).textColor, BlendMode.srcATop),
                child: LottieBuilder.network(
                  filterQuality: FilterQuality.high,
                    'https://assets4.lottiefiles.com/packages/lf20_p4eki2q3.json'),
              )));
    },);
  }
}

class themeIcons extends StatelessWidget {
  const themeIcons();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeState>(builder: (context, state) {
      final cubit=ThemeCubit.get(context);
      return Padding(
        padding:  EdgeInsets.only(right: Responsive.isDesktop(context)?8.0:0,bottom:Responsive.isDesktop(context)?8.0:0 ),
        child: Icon(
          !cubit.isLightTheme ? Icons.dark_mode_outlined : Icons.light_mode,
          color: Theme.of(context).textColor,
        ),
      );
    },);
  }
}
