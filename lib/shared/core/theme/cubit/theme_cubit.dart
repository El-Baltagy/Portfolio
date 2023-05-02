import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagy_app/screens/app/0-main/cubit/main_cubit.dart';
import 'package:messagy_app/shared/core/theme/cubit/theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(initiallState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isLightTheme = false;
  bool isFullSun = false;
  bool isFullMoon = false;


  init() async{
    await Future.delayed(Duration(seconds: 1), () {
      isLightTheme? isFullSun = true:isFullMoon=true;
    });
    emit(initiallState());
  }
  changeBackGround() async {
    if (isLightTheme) {
      isFullMoon=false;
      emit(dayModeTrue());
      await Future.delayed(Duration(milliseconds: 300), () async {
        isFullSun = true;
        emit(fullsunTrue());
      });
    } else {
      isFullSun = false;
      emit(fullsunFalse());
      await Future.delayed(Duration(milliseconds: 300), () async {
        isFullMoon=true;
        emit(dayModeFalse());
      });
  }}


  updateTheme(context) {
    isLightTheme = !isLightTheme;

    emit(themeState());
    changeBackGround();

    }
  }
