import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'validationfields_state.dart';

class ValidationfieldsCubit extends Cubit<ValidationfildsState> {
  ValidationfieldsCubit()
      : super(const ValidationfildsState(
            isEmailValidated: false, isPasswordValidated: false));

  void validateEmailField(bool isValidFields) {
    emit(state.copyWith(isEmailValidated: isValidFields));
  }

  void validatePasswordField(bool isValidFields) {
    emit(state.copyWith(isPasswordValidated: isValidFields));
  }
}
