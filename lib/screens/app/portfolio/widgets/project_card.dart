import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:messagy_app/shared/widgets/cashedImage.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/changes/colors.dart';
import '../../../../shared/changes/constants.dart';
import '../../../../shared/changes/strings.dart';
import '../../../../shared/components.dart';
import '../../../../shared/core/res/responsive.dart';
import '../../../../shared/changes/utils.dart';
import '../../home/widgets/texts.dart';

class ProjectCard extends StatefulWidget {
  final ProjectUtils project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: theme.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            mouseCursor: MouseCursor.uncontrolled,
            // onTap: () {
              // GoPage().pushNavigation(context, path: projectDetail(appName: widget.project.titles, title: widget.project.description, image:  widget.project.banners,))  ;},
            // onTap: () {
            //   openURL(widget.project.links);
            // },
            onHover: (isHovering) {

              if (isHovering) {
                if (!isHover) {
                  setState(() => isHover = true);
                }
              } else {
                if (isHover) {
                  setState(() => isHover = false);
                }
              }
            },
            child: Container(
              width: Responsive.isDesktop(context) ? 30.w : 70.w,
              height: 36.h,
              decoration: BoxDecoration(
                gradient: isHover ? pinkpurple : grayBack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),topRight: Radius.circular(20)
                ),
                boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                 // if (Responsive.isDesktop(context))
                   Padding(
                    padding: isHover ? const EdgeInsets.symmetric(horizontal: 0).copyWith(top: 10,bottom: 20) : EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          StaticImage.logo,
                          height:Responsive.isMobile(context)? height * 0.07:height * 0.1,
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          widget.project.titles,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isHover ? whiteColor : theme.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          widget.project.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isHover ? whiteColor : theme.textColor,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: isHover ? 0.1 : 1.0,
                    curve: curve,
                    child: cashedImage(
                        width: Responsive.isDesktop(context) ? 35.w : 70.w,
                        imageName: widget.project.banners,
                        height: 36.h,
                    isProject: true),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 3.h,bottom: Responsive.isDesktop(context)?3.h:0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Button1( text: 'GitHub', reverse: true,isProject: true,
                  function: () { openURL(widget.project.links); },),
                SizedBox(
                  width: 4.w,
                ),
                Button1( text: 'Details', reverse: false,isProject: true,
                  isGithub: false,
                  function: () {
                    setState(() => isHover =!isHover);
                  },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// image: DecorationImage(
// image: AssetImage(widget.project.banners),
// fit: BoxFit.cover
// )