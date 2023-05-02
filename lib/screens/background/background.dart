import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/changes/colors.dart';
import '../../shared/core/theme/cubit/theme_cubit.dart';
import '../../shared/core/theme/cubit/theme_state.dart';
import '../../shared/widgets/background_widgets/moon.dart';
import '../../shared/widgets/background_widgets/size_config.dart';
import '../../shared/widgets/background_widgets/sun.dart';


class BackGroundSc extends StatefulWidget {
  @override
  State<BackGroundSc> createState() => _BackGroundScState();
}

class _BackGroundScState extends State<BackGroundSc> {
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ThemeCubit>().init();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeCubit,ThemeState>(
      builder: (context, state) {
        final cubit=ThemeCubit.get(context);

        return Scaffold(
          body: AnimatedContainer(
            duration: _duration,
            curve: Curves.easeInOut,
            width: double.infinity,
            height:MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:cubit.isLightTheme?lightBgColors:darkBgColors ,
              ),
            ),
            child: Stack(
              children: [
                 Sun(duration: _duration, isFullSun: cubit.isFullSun),
                Moon(duration: _duration, isFullMoon: cubit.isFullMoon),
              ],
            ),
          ),
        );
      },

    );
  }
}

// if (!isDayMood) SvgPicture.asset("assets/images/Artboard 1.svg",
//   height: double.maxFinite,
//   width: double.maxFinite,
//   fit: BoxFit.cover,) ,