part of 'validationfields_cubit.dart';

class ValidationfildsState extends Equatable {
  const ValidationfildsState({
    required this.isEmailValidated,
    required this.isPasswordValidated,
  });
  final bool isEmailValidated;
  final bool isPasswordValidated;

  ValidationfildsState copyWith({
    bool? isEmailValidated,
    bool? isPasswordValidated,
  }) =>
      ValidationfildsState(
        isEmailValidated: isEmailValidated ?? this.isEmailValidated,
        isPasswordValidated: isPasswordValidated ?? this.isPasswordValidated,
      );

  @override
  List<Object> get props => [isEmailValidated, isPasswordValidated];
}
