part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// evento de inicio de aplicaciones
class AppStartEvent extends LoginEvent {}

/// evento de inicio de sesión de aplicaciones
class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({required this.password, required this.email});

  @override
  List<Object> get props => [email, password];
}

/// evento de aplicación de salida de inicio de sesión
class LoginOutEvent extends LoginEvent {}
