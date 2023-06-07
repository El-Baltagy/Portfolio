import 'package:flutter/material.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';

import '../changes/strings.dart';
import '../navigation.dart';
import '../core/res/responsive.dart';
class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Responsive(
        mobile: bildMobFooter(height: height),
        tablet: buildDeskTabFooter(height: height, width: width),
        desktop: buildDeskTabFooter(height: height, width: width));
  }
}

class bildMobFooter extends StatelessWidget {
  const bildMobFooter({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FirstPart(fontSize: 10,),
        SizedBox(
          height:10,
        ),
        SecondPart(fontSize:10 ,),
        SizedBox(
          height:20 ,
        ),
      ],
    );
  }
}

class buildDeskTabFooter extends StatelessWidget {
  const buildDeskTabFooter({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      padding:  EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FirstPart(fontSize:Responsive.isDesktop(context)? 13:11),
            SizedBox(
              width:width*0.2 ,
            ),
            SecondPart(fontSize:Responsive.isDesktop(context)? 13:11 ),

          ],
        ),
      ),
    );
  }
}



class FirstPart extends StatelessWidget {
  const FirstPart({
    Key? key, required this.fontSize,
  }) : super(key: key);
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "All Copyright Reserved (c) 2023",
          style: TextStyle(
            color:theme.textColor,fontSize: fontSize
          ),
        ),
        InkWell(
          onTap: () => openURL(whatsapp) ,
          child: Text(
            "  < Mohamed El-Baltagy >",
            style: TextStyle(
              color: theme.textColor,fontWeight: FontWeight.w700,fontSize: fontSize
            ),
          ),
        ),
      ],
    );
  }
}

class SecondPart extends StatelessWidget {
  const SecondPart({
    Key? key, required this.fontSize,
  }) : super(key: key);

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              "Privacy Policy",
              style: TextStyle(
                color: theme.textColor,fontSize: fontSize
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "  |  ",
            style: TextStyle(
              color: theme.textColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              "Terms & Conditions",
              style: TextStyle(
                color: theme.textColor,fontSize: fontSize,
              ),
            ),
          ),
        )
      ],
    );
  }
}