import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_states.dart';
import '../../../../shared/changes/constants.dart';
import '../../../../shared/changes/utils.dart';


class build_list_view extends StatefulWidget {
  const build_list_view({
    super.key,
  });

  @override
  State<build_list_view> createState() => _build_list_viewState();
}

class _build_list_viewState extends State<build_list_view> {
  late final cubit;

  @override
  void initState() {
    super.initState();
    cubit=mainCubit.get(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      mainCubit.get(context).getPosition();
    });
  }


  // @override
  // void dispose() {
  //   cubit.sc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<mainCubit,mainStates>(
      listener: (context, state) {
        if (state is AppBarIndexChanged) {
          Navigator.of(context).maybePop();

          final cubit =  mainCubit.get(context);
          if (!cubit.isScroll) {
            if (state.index == 0) {
              Scrollable.ensureVisible(
                 homeKey.currentContext!,
                  duration: duration,
                  curve: curve
              );
              Scrollable.of(context).dispose(

              );
            }
            if (state.index == 1) {
              Scrollable.ensureVisible(
                  serviceKey.currentContext!,
                  duration: duration,
                  curve: curve
              );
            }
            if (state.index == 2) {
              Scrollable.ensureVisible(
                  portfolioKey.currentContext!,
                  duration: duration,
                  curve: curve
              );
            }
            if (state.index == 3) {
              Scrollable.ensureVisible(
                  contactKey.currentContext!,
                  duration: duration,
                  curve: curve
              );
            }
          }
        }
      },
      builder: (context, state) {
        final cubit =mainCubit.get(context);
        return SingleChildScrollView(
          controller:cubit.sc,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
             ...BodyUtils.viewsVT
            ],
          ),
        );
      },
    );
  }
}
