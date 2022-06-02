import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkbox_state.dart';

class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit() : super(const CheckboccubitInitial(false));

  void setCheckToPressed(bool value) {
    emit(CkeckBoxPressed(value));
  }

  void setCheckToNotPressed(bool value) {
    emit(CkeckBoxNoPressed(value));
  }
}
