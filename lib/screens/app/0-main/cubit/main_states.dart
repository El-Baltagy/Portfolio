

abstract class mainStates {}
class initialmainStates extends mainStates {}

class InitialState extends mainStates {}
class FirstState extends mainStates {}
class SecondState extends mainStates {}

class AppBarIndexChanged extends mainStates  {
  final int index;

  AppBarIndexChanged(this.index);

  @override
  List<Object?> get props => [index];
}