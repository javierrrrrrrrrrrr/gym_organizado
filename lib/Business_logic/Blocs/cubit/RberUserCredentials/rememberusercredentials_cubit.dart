import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'rememberusercredentials_state.dart';

class RememberUserCredentialsCubit
    extends HydratedCubit<RememberusercredentialsState> {
  RememberUserCredentialsCubit()
      : super(const RememberusercredentialsState(email: '', password: ''));

  void remeberCredentials({
    required String email,
    required String password,
  }) {
    emit(RememberusercredentialsState(email: email, password: password));
  }

  @override
  RememberusercredentialsState? fromJson(Map<String, dynamic> json) {
    return RememberusercredentialsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RememberusercredentialsState state) {
    return state.toMap();
  }
}
