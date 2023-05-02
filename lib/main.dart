import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/screens/app/0-main/main_section.dart';
import 'package:messagy_app/shared/core/theme/app_theme.dart';
import 'package:messagy_app/shared/core/theme/cubit/theme_cubit.dart';
import 'package:messagy_app/shared/core/theme/cubit/theme_state.dart';
import 'package:messagy_app/shared/widgets/blocObserver.dart';
import 'package:messagy_app/shared/widgets/carousal_slider.dart';
import 'package:sizer/sizer.dart';
import 'connection/bloc/connected_bloc.dart';
import 'connection/network_check.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<mainCubit>(create: (_) => mainCubit()),
        BlocProvider<CarousalCubit>(create: (_) => CarousalCubit()),
        BlocProvider<ConnectedBloc>(create: (context) => ConnectedBloc()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context, state) {
          final cubit=ThemeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'El-Baltagy',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isLightTheme?
            ThemeMode.light: ThemeMode.dark,

            home: NChecking(),
          );
        },

      );
    });
  }
}
