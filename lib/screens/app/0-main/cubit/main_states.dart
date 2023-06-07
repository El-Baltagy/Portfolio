

abstract class mainStates {}
class initialmainStates extends mainStates {}

class InitialState extends mainStates {}
class changIFromArrow extends mainStates {}
class FirstState extends mainStates {}
class SecondState extends mainStates {}
class changView extends mainStates {
  final bool isVertical;
  changView(this.isVertical);
}

class AppBarIndexChanged extends mainStates  {
  final int index;

  AppBarIndexChanged(this.index);

  @override
  List<Object?> get props => [index];
}