import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/changes/utils.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_states.dart';
import 'build_list_view.dart';

class BodyDT extends StatelessWidget {
  BodyDT();


  @override
  Widget build(BuildContext context) {
    final cubit = mainCubit.get(context);
    return cubit.isVerticalView? build_list_view():

    PageView.builder(
      controller: cubit.pageController,
      itemBuilder:(context, index) => SingleChildScrollView(
          child: BodyUtils.viewsVT[index]) ,
      itemCount: BodyUtils.viewsVT.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
