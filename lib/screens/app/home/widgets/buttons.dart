import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_states.dart';
import 'package:messagy_app/screens/app/home/widgets/texts.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/changes/strings.dart';
import '../../../../shared/navigation.dart';
import '../../../../shared/core/configs/others/space.dart';
import '../../0-main/cubit/main_cubit.dart';

class BuildRowButtons extends StatelessWidget {
   BuildRowButtons();


  @override
  Widget build(BuildContext context) {
    final cubit=mainCubit.get(context);
    return Row(
      children:  [
        Button1( text: 'Resume', reverse: true,
             function: () { openURL(resume); } ),
        Space.x(6.w)!,
        BlocBuilder<mainCubit,mainStates>(
          buildWhen: (previous, current) =>
             previous !=current &&current is  changIFromArrow,
          builder: (context, state) => Button1( text: 'Service', reverse: false,
              function: (){
                cubit.changeIndexFromArrow(true,isTab: true);
              }),
        ),
        // Button2(conHeight:50 ,conWidth: 180,textSize:20 ),
      ],
    );
  }
}
