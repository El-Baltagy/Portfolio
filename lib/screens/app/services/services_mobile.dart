import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/services/widgets/services_card.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/core/configs/others/space.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/core/res/responsive.dart';
import '../../../shared/widgets/carousal_slider.dart';
import '../../../shared/widgets/custom_text_heading.dart';
import '../../../shared/widgets/indicator.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<CarousalCubit,CarousalState>(
      builder: (context, state) {
        final cubit=CarousalCubit.get(context);

        return Column(
          children: [
            SizedBox(height: startHeight),
             buildStartSection(context,'\nWhat I can do?'),
            Space.y(3.w)!,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomSectionSubHeading(text: servicesSubHeading),
            ),
            Space.y(5.w)!,
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
        );
      },

    );
  }


}
buildStartSection(context,text) {
  return CustomSectionHeading(text:text , repeatingAnimation: false, context: context, fontSize: Responsive.isDesktop(context)?56:Responsive.isTablet(context)?45:30,);
}