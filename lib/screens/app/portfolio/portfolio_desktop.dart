import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../shared/changes/sizes.dart';
import '../../../shared/changes/strings.dart';
import '../../../shared/components.dart';
import '../../../shared/core/configs/others/space.dart';
import '../../../shared/changes/utils.dart';
import '../../../shared/core/res/responsive.dart';
import '../../../shared/widgets/carousal_slider.dart';
import '../../../shared/widgets/custom_text_heading.dart';
import '../../../shared/widgets/indicator.dart';
import '../services/services_mobile.dart';
import '../services/widgets/button.dart';
import 'widgets/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      margin: const EdgeInsets.only(bottom: 20),
      child: BlocBuilder<CarousalCubit,CarousalState>(
        builder: (context, state) {
          final cubit=CarousalCubit.get(context);

          return Column(
            children: [
              SizedBox(height: startHeight),
              buildStartSection(context,'\nProjects'),
              Space.y(1.w)!,
              CustomSectionSubHeading(text: protfolioSubHeading),
              Space.y(2.w)!,
              if(Responsive.isDesktop(context))
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 3.h,
                  spacing: 2.w,
                  children: projectUtils
                      .asMap()
                      .entries
                      .map(
                        (e) => ProjectCard(project: e.value),
                  )
                      .toList(),
                ),
              if(Responsive.isTablet(context))
                ...[
                  buildCarouselSlider(
                    count: projectUtils.length,
                    isService: false,
                    onPageChanged: ( int value,carousalChange) {
                      cubit.cahngeIndicator2(value);
                    },
                    itemBuilder:(BuildContext context, int itemIndex, int i) =>  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ProjectCard(project: projectUtils[i]),
                    ),
                  ),
                  Space.y(4.h)!,
                  buildIndicator(current: cubit.currentIndicator2,count: projectUtils.length),
                ],
              Space.y(6.h)!,
              buildOutlinedButton(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          );
        },

      ),
    );
  }
}
