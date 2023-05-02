import 'package:flutter/material.dart';
import 'package:messagy_app/shared/changes/colors.dart';

import '../../../../shared/changes/strings.dart';
import '../../../../shared/components.dart';

class buildOutlinedButton extends StatelessWidget {
  buildOutlinedButton({
    required this.fontSize,required this.fontWeight});

  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => openURL(gitHub),
      child:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'See More',
          style: TextStyle(
            color: primaryColor,
            fontSize: fontSize ,
            fontWeight: fontWeight ,
          ),
        ),
      ),
    );
  }
}