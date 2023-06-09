import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/navigation.dart';
import '../../../shared/core/configs/others/space.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/core/res/responsive.dart';
import '../../../shared/widgets/carousal_slider.dart';
import '../../../shared/widgets/custom_text_heading.dart';
import '../../../shared/widgets/indicator.dart';
import '../services/services_mobile.dart';
import '../services/widgets/button.dart';
import 'widgets/project_card.dart';

class PortfolioMobileTab extends StatefulWidget {
  const PortfolioMobileTab({Key? key}) : super(key: key);

  @override
  State<PortfolioMobileTab> createState() => _PortfolioMobileTabState();
}

class _PortfolioMobileTabState extends State<PortfolioMobileTab> {
  int current=0;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CarousalCubit,CarousalState>(
      builder: (context, state) {
        final cubit=CarousalCubit.get(context);

        return Column(
          children: [
            SizedBox(height: startHeight),
            buildStartSection(context,'\nProjects'),
            Space.y(3.w)!,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomSectionSubHeading(text: protfolioSubHeading),
            ),
            Space.y(5.w)!,
            carousalBloc2(cubit: cubit),
            Space.y(3.w)!,
            buildIndic2(cubit: cubit),
            Space.y(6.h)!,
            buildOutlinedButton(
              fontSize: 16,fontWeight:FontWeight.w600 ,
            ),

          ],
        );
      },

    );
  }
}


