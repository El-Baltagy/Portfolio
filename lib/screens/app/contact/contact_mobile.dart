import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/contact/widgets/animy.dart';
import 'package:messagy_app/screens/app/contact/widgets/buildStack.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/components.dart';
import '../../../shared/core/configs/others/space.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/widgets/custom_text_heading.dart';
import '../../../shared/widgets/footer.dart';
import '../../../shared/widgets/gradient_slider.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: size.width / 10,right:Responsive.isMobile(context)?size.width / 10:0 ),
      child: Column(
        children: [
              buildFItem(),
          Padding(
            padding:  EdgeInsets.only(right:Responsive.isTablet(context)?size.width / 10:5 ),
            child: bildContactAnimy(),
          ),
          Space.y(3.w)!,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomSectionSubHeading(text: contactSubHeadding),
          ),
          Space.y(5.w)!,
          GradientSlideToAct(
            width: 275,
            text: 'Get Started',
            textStyle: TextStyle(color: Colors.white,fontSize: 15),
            backgroundColor: Color(0Xff172663),
            onSubmit: (){
              openURL(whatsapp);
            },
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple,
                  Colors.deepPurple,
                ]
            ),
          ),
          // InkWell(
          //   onTap: () => openURL(whatsapp),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          //     decoration: BoxDecoration(
          //         gradient: buttonGradi, borderRadius: BorderRadius.circular(10)),
          //     child: const Text(
          //       'Get Started',
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.w500,
          //         color: blackColor,
          //       ),
          //     ),
          //   ),
          // ),
          Space.y(5.w)!,
          Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 50,
              children: contactUtils
                  .asMap()
                  .entries
                  .map((e) => IconButton(
                        icon: Image.network(
                          e.value.icon,
                          color: Colors.purple,
                        ),
                        onPressed: () => openURL(e.value.url),
                        highlightColor: Colors.white54,
                        iconSize: 20,
                      ))
                  .toList()),
          SizedBox(height: 2.h),
          Footer(),

        ],
      ),
    );
  }
}
