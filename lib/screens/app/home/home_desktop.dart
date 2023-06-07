import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/screens/app/home/widgets/buttons.dart';
import 'package:messagy_app/screens/app/home/widgets/texts.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/core/configs/others/space.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              right: 6.w,
              bottom: 1.5.w,
              child: SizedBox(
                width: 35.w,
                height: 75.h,
                child: Lottie.asset(StaticImage.mainJson,
                    frameRate: FrameRate(60),
                    filterQuality: FilterQuality.high),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    width: 55.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FirstRowBuild(fontSize1R: 30),
                        // Space.y(0.5.w)!,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            NameText(),
                          ],
                        ),
                        ThirdRowBuild(
                            fontSize2R: 20, textList:
                        deskTopList()
                        ),
                        Space.y(1.5.w)!,
                        ForthRowBuild(theme: theme, fontSize4R: 20,),
                        Space.y(3.w)!,
                        BuildRowButtons(),
                      ],
                    ),
                  ),
                  // const ZoomAnimations(),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: startHeight * 1.5),
      ],
    )
    ;
  }
}



















