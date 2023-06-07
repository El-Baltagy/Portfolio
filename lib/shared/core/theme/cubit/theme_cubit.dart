import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      emit(isLightTheme? fullsunTrue(true):fullMoonTrue(true));

    });
    emit(initiallState());
  }
  changeBackGround() async {
    if (isLightTheme) {
      isFullMoon=false;
      emit(fullMoonTrue(false));

      await Future.delayed(Duration(milliseconds: 400), () async {
        isFullSun = true;
        emit(fullsunTrue(true));
      });
    } else {
      isFullSun = false;
      emit(fullsunTrue(false));
      await Future.delayed(Duration(milliseconds: 400), () async {
        isFullMoon=true;
        emit(fullMoonTrue(true));
      });
  }
    emit(initiallState());}


  updateTheme(context) {
    isLightTheme = !isLightTheme;

    emit(themeState(isLightTheme));
    changeBackGround();

    }
  }
