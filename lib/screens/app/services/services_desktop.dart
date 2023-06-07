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
    Size size = MediaQuery.of(context).size;

    final cubit=CarousalCubit.get(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      margin: const EdgeInsets.only(bottom: 20),
      child: BlocBuilder<CarousalCubit,CarousalState>(
        builder: (context, state) {

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: startHeight),
              buildStartSection(context,'\nWhat I can do?'),
              Space.y(1.w)!,
              CustomSectionSubHeading(text: servicesSubHeading),
              Space.y(2.w)!,
              if(Responsive.isDesktop(context))
                Wrap(
                  spacing:size. width * 0.05,
                  runSpacing:size. height * 0.05,
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
                  carousalBloc1(cubit: cubit),
                  Space.y(6.h)!,
                  buildIndic1(cubit: cubit),
                ],

            ],
          );
        },

      ),
    );
  }
}
