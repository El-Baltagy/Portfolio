import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/core/res/responsive.dart';
import '../cubit/main_states.dart';
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
    return BlocBuilder<mainCubit,mainStates>(
        builder: (context, state) {
         return Stack(
            children: [
              if (Responsive.isMobile(context))build_list_view(),
              if (!Responsive.isMobile(context)) BodyDT(),
              if (!Responsive.isMobile(context)) const Arrows()
            ],
          );
        },
       );
  }
}
// NestedScroll( scafoldKey: scafoldKey)