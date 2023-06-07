import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/colors.dart';
import '../../../../shared/changes/constants.dart';
import '../../../../shared/changes/strings.dart';
import '../../../../shared/core/configs/others/space.dart';
import '../../../../shared/core/res/responsive.dart';

class BuildExpanded extends StatefulWidget {
  const BuildExpanded({
    Key? key, required this.expandedTxt
  }) : super(key: key);
  final ExpandedTxt expandedTxt;

  @override
  State<BuildExpanded> createState() => _BuildExpandedState();
}

class _BuildExpandedState extends State<BuildExpanded> {
  bool isHover=false;
  @override
  Widget build(BuildContext context) {

    final theme=Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: Responsive.isDesktop(context)?600:Responsive.isTablet(context)?60.w:80.w,
              padding: EdgeInsets.symmetric(horizontal: Responsive.isTablet(context)?10:20)
              .copyWith(top: 10,bottom: 5 ),
              decoration: BoxDecoration(
                gradient:  isHover?pinkpurple:theme.card,
                borderRadius: BorderRadius.circular(15),
                boxShadow:  isHover
                    ? [
                  const BoxShadow(
                    blurRadius: 12.0,
                    offset: Offset(2.0, 3.0),
                  )
                ]
                    :  [blackColorShadow] ,
              ),
              child: ExpandablePanel(
                collapsed: Space.y(1.h)!,
                theme: ExpandableThemeData(
                iconColor: Colors.red,
                  useInkWell: true,
                fadeCurve: curve,
                animationDuration: duration*0.25,
                sizeCurve:curve,
                ),
                expanded:Text(widget.expandedTxt.text2,
                  style: TextStyle(
                      color:theme.textColor,
                      fontSize:Responsive.isDesktop(context)?14:Responsive.isTablet(context)?13:12),),
                header: Text(widget.expandedTxt.text1,
                  style: TextStyle(
                      color:theme.textColor,
                      fontSize:Responsive.isDesktop(context)?18:Responsive.isTablet(context)?15:14),),
              ),
            ),
          ],
        ),
        Space.y(3.h)!,
      ],
    );
  }
}