import 'package:flutter/material.dart';
import 'package:messagy_app/shared/core/animations/entrance_fader.dart';
import '../../../shared/changes/constants.dart';
import '../../../shared/core/res/responsive.dart';
import 'contact_desktop.dart';
import 'contact_mobile.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=mainCubit.get(context);
    return  Responsive(
      mobile: ContactMobileTab(),
      tablet: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
