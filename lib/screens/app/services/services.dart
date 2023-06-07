import 'package:flutter/material.dart';
import 'package:messagy_app/screens/app/services/services_desktop.dart';
import 'package:messagy_app/screens/app/services/services_mobile.dart';
import '../../../shared/core/res/responsive.dart';


class Services extends StatelessWidget {

  Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceDesktop(),
      desktop: ServiceDesktop(),
    );
  }
}
