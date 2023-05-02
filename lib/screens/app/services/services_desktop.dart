import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/services/services_mobile.dart';
import 'package:messagy_app/shared/core/res/responsive.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/core/configs/others/space.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/widgets/carousal_slider.dart';
import '../../../shared/widgets/custom_text_heading.dart';
import 'package:messagy_app/screens/app/services/widgets/services_card.dart';

import '../../../shared/widgets/indicator.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 8),
      margin: const EdgeInsets.only(bottom: 20),
      child: BlocBuilder<CarousalCubit,CarousalState>(
        builder: (context, state) {
          final cubit=CarousalCubit.get(context);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: startHeight),
              // const CustomSectionHeading(text: '\nSkills?', repeatingAnimation: false,),
              // Space.y(3.w)!,
              buildStartSection(context,'\nWhat I can do?'),
              Space.y(1.w)!,
              CustomSectionSubHeading(text: servicesSubHeading),
              Space.y(2.w)!,
              if(Responsive.isDesktop(context))
                Wrap(
                  spacing: width * 0.05,
                  runSpacing: height * 0.05,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: servicesUtils
                      .asMap()
                      .entries
                      .map(
                        (e) => ServiceCard(service: e.value),
                  )
                      .toList(),
                ),
              if(Responsive.isTablet(context))
                ...[
                  buildCarouselSlider(
                    count: servicesUtils.length,
                    onPageChanged: ( int value,carousalChange) {
                      cubit.cahngeIndicator1(value);
                    },
                    itemBuilder:(BuildContext context, int itemIndex, int i) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.w),
                      child: ServiceCard(service: servicesUtils[i]),
                    ) ,
                  ),
                  Space.y(6.h)!,
                  buildIndicator(current: cubit.currentIndicator1,count: servicesUtils.length),
                ],

            ],
          );
        },

      ),
    );
  }
}
