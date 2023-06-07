import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/shared/core/animations/entrance_fader.dart';
import '../../../shared/changes/constants.dart';
import '../../../shared/core/res/responsive.dart';
import 'portfolio_desktop.dart';
import 'portfolio_mobile.dart';

class Portfolio extends StatelessWidget {
   Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=mainCubit.get(context);
    return  Responsive(
      mobile: PortfolioMobileTab(),
      tablet: PortfolioDesktop(),
      desktop: PortfolioDesktop(),
    );
  }
}
