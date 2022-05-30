part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

/// - sin inicializar - La autenticación no es de inicialización
class AuthenticationUninitialized extends LoginState {}

/// - Cargando - Espere Guardar / ficha de eliminación
class AuthenticationLoading extends LoginState {}

/// - autenticados - Certificado éxito
class AuthenticationAuthenticated extends LoginState {}

/// - unautynticated - no autenticado
class AuthenticationUnauthenticated extends LoginState {}
