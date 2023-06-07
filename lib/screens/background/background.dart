import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/changes/colors.dart';
import '../../shared/core/theme/cubit/theme_cubit.dart';
import '../../shared/core/theme/cubit/theme_state.dart';
import '../../shared/widgets/background_widgets/moon.dart';
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
    final cubit=ThemeCubit.get(context);
    return Scaffold(
      body: BlocSelector<ThemeCubit,ThemeState,themeState>(
          selector: (val) =>themeState(cubit.isLightTheme),
          builder: (context, val) =>AnimatedContainer(
            duration: _duration,
            curve: Curves.easeInOut,
            width: double.infinity,
            height:MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:
                val.isLight?lightBgColors:
                darkBgColors ,
              ),
            ),
            child: Stack(
              children: [
                BlocSelector<ThemeCubit,ThemeState,fullsunTrue>(
                  selector: (state) => fullsunTrue(cubit.isFullSun),
                  builder: (context, state) => Sun(duration: _duration, isFullSun: state.isFullSun),),

                BlocSelector<ThemeCubit,ThemeState,fullMoonTrue>(
                  selector: (state) => fullMoonTrue(cubit.isFullMoon),
                  builder: (context, state) => Moon(duration: _duration, isFullMoon: state.isFullMoon),)
              ],
            ),
          )
),
    );
  }
}
