import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import '../../../../shared/widgets/navbar_logo.dart';
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