import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkboccubit_state.dart';

class CheckBoxCubitCubit extends Cubit<CheckBoxCubitState> {
  CheckBoxCubitCubit() : super(const CheckboccubitInitial(false));

  void setCheckToPressed(bool value) {
    emit(CkeckBoxPressed(value));
  }

  void setCheckToNotPressed(bool value) {
    emit(CkeckBoxNoPressed(value));
  }
}
