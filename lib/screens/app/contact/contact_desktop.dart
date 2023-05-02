import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:messagy_app/screens/app/contact/widgets/animy.dart';
import 'package:messagy_app/screens/app/contact/widgets/buildStack.dart';
import 'package:messagy_app/screens/app/contact/widgets/expanded_text.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/components.dart';
import '../../../shared/core/configs/others/space.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/widgets/custom_text_heading.dart';
import '../../../shared/widgets/footer.dart';
import '../home/widgets/texts.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 10),
        child:Column(
          children: [
            SizedBox(height: startHeight),
            buildFItem(),
            bildContactAnimy(),
            CustomSectionSubHeading(
              text:
              contactSubHeadding  ,
            ),
            Space.y(1.5.w)!,
            Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 50,
                children: contactUtils
                    .asMap()
                    .entries
                    .map((e) => IconButton(
                  icon: Image.network(
                    e.value.icon,
                    color: theme.textColor,
                  ),
                  onPressed: () => openURL(e.value.url),
                  highlightColor: Colors.white54,
                  iconSize: 21,
                ))
                    .toList()),

            SizedBox(height: 2.h),
            Footer(),

          ],
        ),
      ),
    );
  }
}






