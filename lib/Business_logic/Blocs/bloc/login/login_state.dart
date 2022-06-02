part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

/// - Cargando - Espere Guardar / ficha de eliminación
class LoginLoading extends LoginState {}

/// - unautynticated - no autenticado
class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
  @override
  List<Object> get props => [message];
}

// final String email;
//   final String password;

//   const LoginInitial({required this.email, required this.password});

//   @override
//   List<Object> get props => [email, password];
