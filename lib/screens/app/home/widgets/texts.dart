import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:messagy_app/shared/changes/colors.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/strings.dart';
import '../../../../shared/core/animations/entrance_fader.dart';
import '../../../../shared/widgets/cashedImage.dart';

class FirstRowBuild extends StatelessWidget {
  const FirstRowBuild({
    Key? key, required this.fontSize1R,
  }) : super(key: key);

  final double fontSize1R;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(hellotag,
            style: TextStyle(
              fontWeight:FontWeight.w400,fontSize: fontSize1R,
            )),
        EntranceFader(
          offset: const Offset(0, 0),
          delay: const Duration(seconds: 2),
          duration: const Duration(milliseconds: 800),
          // child: Image.network(StaticImage.hi, height: 40),
          child: cashedImage(
            height: 40,
            width:40 ,
            imageName:StaticImage.hi ,
          )
        ),
      ],
    );
  }
}



class NameText extends StatelessWidget {
  NameText();

  @override
  Widget build(BuildContext context) {

    return Image.asset(StaticImage.nameImg ,
      height: Responsive.isDesktop(context)?30.h:Responsive.isTablet(context)?22.h: 25.h,
      width:Responsive.isDesktop(context)?35.w:Responsive.isTablet(context)?40.w: 80.w ,

    )
    ;
  }
}



class ThirdRowBuild extends StatelessWidget {
  ThirdRowBuild({
    required this.fontSize2R, required this.textList
});

  final double fontSize2R;
  final List<AnimatedText>textList;
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("A young ",
        style: TextStyle(
            fontWeight:FontWeight.w400,fontSize: fontSize2R,
        ),),
        AnimatedTextKit(
          isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts:  textList,
        ),
        Text(" Developer" ,
          style: TextStyle(
            fontWeight:FontWeight.w400,fontSize: fontSize2R,
          ),),
      ],
    );
  }
}

class ForthRowBuild extends StatelessWidget {
  const ForthRowBuild({
    Key? key,
    required this.theme, required this.fontSize4R,
  }) : super(key: key);

  final ThemeData theme;
  final double fontSize4R;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Text(miniDescription,
          style: TextStyle(
            fontSize: fontSize4R,
            fontWeight: FontWeight.w400,
            color: theme.textColor.withOpacity(0.6),
          )),
    );
  }
}

class Button1 extends StatefulWidget {
  const Button1({
    Key? key, required this.function,  required this.text, required this.reverse,this.isProject=false,  this.isGithub=true,
  }) : super(key: key);

final bool isProject;
  final String text;
  final bool reverse,isGithub;
  final VoidCallback function;
  @override
  State<Button1> createState() => _Button1State();
}
bool isHover=false;

class _Button1State extends State<Button1> {


  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Container(
      height: widget.isProject?Responsive.isDesktop(context)?50:Responsive.isTablet(context)?40:30:   Responsive.isTablet(context)?50:40,
      width:widget.isProject?Responsive.isDesktop(context)?180:Responsive.isTablet(context)?18.w:25.w:  Responsive.isDesktop(context)?180:Responsive.isTablet(context)?160:140,
      decoration: BoxDecoration(
          color:widget.reverse?isHover?primaryColor:null:!isHover?primaryColor:null,
          border: Border.all(
              color:  primaryColor,
              width: 3
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40))
      ),
      child: InkWell(
        onTap: widget.function,
        onHover: (value) {
          if (value) {
            setState(() => isHover = true);
          } else {
            setState(() => isHover = false);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isProject)
              Padding(
                padding:  EdgeInsets.only(left: 0.6.w,right: 1.w),
                child:
               ! widget.isGithub?Icon(Icons.info_outline_rounded,
                color: widget.reverse?isHover?theme.text2:theme.textColor:isHover?theme.textColor:theme.text2,):

                Image.network(
                  StaticImage.imageButton,
                color: widget.reverse?isHover?theme.text2:theme.textColor:isHover?theme.textColor:theme.text2,
            ),
              ),
            Text(
             widget.text,
            style: TextStyle(
              color: widget.reverse? !isHover?primaryColor:theme.textColor:isHover?primaryColor:theme.textColor,
              fontSize: Responsive.isDesktop(context)?20:Responsive.isTablet(context)?17:14,
              fontWeight:FontWeight.w100 ,
            ),
            ),
          ],
        ),
      ),
    );
  }
}





List<AnimatedText> tabList = [
  flickerAnimatedText(fontSize:20 ,text:AnimatiobText().animationtxt.toString() ),
];


FlickerAnimatedText flickerAnimatedText({
  required String text,
  required double fontSize,

}) {
  return FlickerAnimatedText(text,
      speed: const Duration(seconds: 3),
      textStyle: TextStyle(
        fontSize: fontSize
      ));
}

// Shimmer buildShimmerText({
//   required String text,
//   required Color baseColor,
//   required Color highlightColor,
//   ShimmerDirection shimmerDirection=ShimmerDirection.ltr,
//   double fontSize=30,
//   FontWeight fontWeight=FontWeight.w300,
//   bool isAnimated=true,
//   int noOfAnimated=3000,
// }) {return Shimmer.fromColors(
//   enabled:isAnimated ,
//   baseColor:baseColor,
//   highlightColor:highlightColor,
//   direction:shimmerDirection,
//   loop:isAnimated?noOfAnimated:0 ,
//   child: Text(
//     text,
//     style: TextStyle(
//       fontSize:fontSize ,fontWeight:fontWeight ,
//     ),
//   ),
// );
// }





