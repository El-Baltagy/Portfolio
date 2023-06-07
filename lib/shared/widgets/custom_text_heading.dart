import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:messagy_app/shared/core/configs/configs.dart';


import '../core/res/responsive.dart';

CustomSectionHeading({required context,required
    fontSize,required text, required repeatingAnimation
}){
  return AnimatedTextKitContact(text: text,repeatingAnimation:repeatingAnimation,
      fontSize:fontSize );
}

class AnimatedTextKitContact extends StatelessWidget {
  const AnimatedTextKitContact({
    Key? key,
    required this.text,
    required this.fontSize, required this.repeatingAnimation,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final bool repeatingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation:repeatingAnimation ,
      repeatForever: true,
      animatedTexts:<TyperAnimatedText>  [
        TyperAnimatedText(text,
        speed: const Duration(milliseconds: 150),
        textStyle:TextStyle(fontSize: fontSize,height: 0.4) ),
    ] ,
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Responsive(
      desktop: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.textColor.withOpacity(0.7),
          fontSize: 18,
        ),
      ),
      tablet: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.textColor.withOpacity(0.6),
          fontSize: 16,
        ),
      ),
      mobile: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.textColor.withOpacity(0.6),
          fontSize: 13,
        ),
      ),
    );
  }
}
