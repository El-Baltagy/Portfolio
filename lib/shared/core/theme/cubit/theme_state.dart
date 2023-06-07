

abstract class ThemeState {

}
 class initiallState extends ThemeState{}
 class loadingState extends ThemeState{}
 class themeState extends ThemeState{
  final bool isLight;
  themeState(this.isLight);
 }

 class fullsunTrue extends ThemeState{
  final bool isFullSun;
  fullsunTrue(this.isFullSun);
 }
 class fullMoonTrue extends ThemeState{
  final bool isFullMoon;
  fullMoonTrue(this.isFullMoon);
 }

