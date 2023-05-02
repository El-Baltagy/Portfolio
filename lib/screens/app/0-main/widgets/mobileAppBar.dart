import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_states.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/core/theme/cubit/theme_cubit.dart';
import '../../../../shared/core/theme/cubit/theme_state.dart';
import '../../../../shared/widgets/navbar_logo.dart';
import '../cubit/main_cubit.dart';
import '_navbar_desktop.dart';

class mobileAppBar extends StatelessWidget {
  const mobileAppBar({
    super.key,
    required this.scafoldKey,
  });

  final GlobalKey<ScaffoldState> scafoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth:20.w,
      leading:  Padding(
        padding:  EdgeInsets.only(left:8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8),
            NavBarLogo(
              width:20 ,
              height:40 ,
            ),
            SizedBox(height: 8)
          ],
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.only(left: 8.w),
      //   child: IconButton(
      //       onPressed: (){
      //         scafoldKey.currentState!.openDrawer();
      //       }, icon: const Icon(Icons.menu)),
      // ),
      actions: [
        Padding(
          padding:  EdgeInsets.only(right:6.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  switchTheme(),
                  themeIcons()
                ],
              ),
              SizedBox(height: 8)
            ],
          ),
        )
      ],
    );
  }
}