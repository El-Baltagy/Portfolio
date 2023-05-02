import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/strings.dart';
import '../../../../shared/core/configs/others/space.dart';
import '../../../../shared/widgets/custom_text_heading.dart';
import '../../home/widgets/texts.dart';
import 'expanded_text.dart';


class buildFItem extends StatelessWidget {
  const buildFItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        Padding(
            padding:EdgeInsets.only(right: Responsive.isTablet(context)?size.width / 10:0),
        child: CustomSectionHeading(text: "\nFrequently Asked Questions",repeatingAnimation: false, context: context,
            fontSize: Responsive.isDesktop(context)?45:Responsive.isTablet(context)?36:20)),

        // buildShimmerText(text: 'Frequently Asked Questions',baseColor: Theme.of(context).textColor, highlightColor: Theme.of(context).shimmerColor
        //     , fontSize: Responsive.isDesktop(context)?25:Responsive.isTablet(context)?21:18),
        Space.y(5.h)!,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...expandedtext.asMap().entries.map((e) =>
                    BuildExpanded(expandedTxt: e.value ),
                ).toList(),
              ],
            ),
            if ( !Responsive.isMobile(context))
              ...[
                Spacer(),
                Lottie.asset(StaticImage.contact_stackJson ,
                  // frameRate: FrameRate(60),
                  // filterQuality: FilterQuality.high,
                  width: 30.w,
                )
              ]

          ],
        ),

      ],
    );
  }
}