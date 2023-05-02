import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../changes/strings.dart';


class NavBarLogo extends StatelessWidget {
  const NavBarLogo({ required this.height, required this.width}) ;
final double height;
final double width;
  @override
  Widget build(BuildContext context) {

    return SvgPicture.asset(StaticImage.logo,
      height: height,
      width: width,
    );
  }
}
