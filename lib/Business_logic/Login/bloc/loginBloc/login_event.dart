part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// evento de inicio de aplicaciones
class AppStartEvent extends LoginEvent {}

/// evento de inicio de sesión de aplicaciones
class OnLoginButtonPresEvent extends LoginEvent {
  final String email;
  final String password;

  const OnLoginButtonPresEvent({required this.password, required this.email});

  @override
  List<Object> get props => [email, password];
}

/// evento de aplicación de salida de inicio de sesión
class OnLogisnOutEvent extends LoginEvent {}
