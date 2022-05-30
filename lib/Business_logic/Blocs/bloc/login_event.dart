part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// evento de inicio de aplicaciones
class AppStart extends LoginEvent {}

/// evento de inicio de sesión de aplicaciones
class LoginIn extends LoginEvent {
  final String token;

  const LoginIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => "LoggedIn { token: $token }";
}

/// evento de aplicación de salida de inicio de sesión
class LoginOut extends LoginEvent {}
