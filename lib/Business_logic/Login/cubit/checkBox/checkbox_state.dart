part of 'checkbox_cubit.dart';

abstract class CheckBoxState extends Equatable {
  final bool isPressed;
  const CheckBoxState(this.isPressed);

  @override
  List<Object> get props => [isPressed];
}

class CheckboccubitInitial extends CheckBoxState {
  const CheckboccubitInitial(super.isPressed);
}

class CkeckBoxPressed extends CheckBoxState {
  const CkeckBoxPressed(super.isPressed);
}

class CkeckBoxNoPressed extends CheckBoxState {
  const CkeckBoxNoPressed(super.isPressed);
}
