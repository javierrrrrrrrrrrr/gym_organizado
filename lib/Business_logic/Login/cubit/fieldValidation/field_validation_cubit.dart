import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'field_validation_state.dart';

class FieldValidationCubit extends Cubit<FieldValidationState> {
  FieldValidationCubit()
      : super(const FieldValidationState(
            isEmailValidated: false, isPasswordValidated: false));

  void validateEmailField(bool isValidFields) {
    emit(state.copyWith(isEmailValidated: isValidFields));
  }

  void validatePasswordField(bool isValidFields) {
    emit(state.copyWith(isPasswordValidated: isValidFields));
  }
}
