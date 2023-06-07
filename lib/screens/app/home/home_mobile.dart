import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/home/widgets/buttons.dart';
import 'package:messagy_app/screens/app/home/widgets/texts.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/navigation.dart';
import '../../../shared/core/configs/others/space.dart';


class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 3.h, ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FirstRowBuild(fontSize1R:16 ),
          Space.y(1.w)!,
           NameText(),
          Space.y(3.w)!,
          ThirdRowBuild(fontSize2R: 14, textList: mobileList()),
          Space.y(3.w)!,
          ForthRowBuild(theme: Theme.of(context), fontSize4R: 14,),
          Space.y(8.w)!,
          BuildRowButtons(),

          // Row(
          //   // mainAxisSize: MainAxisSize.min,
          //   children:  [
          //      Button1(textSize:14,text: 'Resume', reverse: true,
          //        function: () { openURL(resume); },),
          //     Space.x(6.w)!,
          //     Button1(textSize:14,text: 'Resume', reverse: true,
          //       function: () { openURL(resume); },),
          //     // const Button2(conHeight: 40,conWidth:140 ,textSize:14 ),
          //   ],
          // )
        ],
      ),
    );
  }
  List<AnimatedText> mobileList() {
    return List<AnimatedText>.generate(
        AnimatiobText().animationtxt.length,
            (index) => flickerAnimatedText(fontSize:14 ,text:AnimatiobText().animationtxt[index] )
    );
  }
}