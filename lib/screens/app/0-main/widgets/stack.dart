import 'package:flutter/material.dart';
import '../../../../shared/core/res/responsive.dart';
import 'arrows.dart';
import 'body.dart';
import 'build_list_view.dart';


class buildStack extends StatelessWidget {
  const buildStack({
    super.key,
    required this.scafoldKey,
  });

  final GlobalKey<ScaffoldState> scafoldKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (Responsive.isMobile(context))build_list_view(),
        if (!Responsive.isMobile(context)) BodyDT(),
        if (!Responsive.isMobile(context)) const Arrows()
      ],
    );
  }
}