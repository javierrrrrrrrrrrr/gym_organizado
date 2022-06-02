part of 'field_validation_cubit.dart';

class FieldValidationState extends Equatable {
  const FieldValidationState({
    required this.isEmailValidated,
    required this.isPasswordValidated,
  });
  final bool isEmailValidated;
  final bool isPasswordValidated;

  FieldValidationState copyWith({
    bool? isEmailValidated,
    bool? isPasswordValidated,
  }) =>
      FieldValidationState(
        isEmailValidated: isEmailValidated ?? this.isEmailValidated,
        isPasswordValidated: isPasswordValidated ?? this.isPasswordValidated,
      );

  @override
  List<Object> get props => [isEmailValidated, isPasswordValidated];
}
