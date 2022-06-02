part of 'checkboccubit_cubit.dart';

abstract class CheckBoxCubitState extends Equatable {
  final bool isPressed;
  const CheckBoxCubitState(this.isPressed);

  @override
  List<Object> get props => [isPressed];
}

class CheckboccubitInitial extends CheckBoxCubitState {
  const CheckboccubitInitial(super.isPressed);
}

class CkeckBoxPressed extends CheckBoxCubitState {
  const CkeckBoxPressed(super.isPressed);
}

class CkeckBoxNoPressed extends CheckBoxCubitState {
  const CkeckBoxNoPressed(super.isPressed);
}
