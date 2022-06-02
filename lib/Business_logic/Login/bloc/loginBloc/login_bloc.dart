import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:gym_organizado/Business_logic/Login/bloc/internetBloc/internet_bloc.dart';

import 'package:gym_organizado/Business_logic/Login/cubit/checkBox/checkbox_cubit.dart';
import 'package:gym_organizado/Business_logic/Login/cubit/loginInUserCredential/loginIn_user_credential_cubit.dart';

import 'package:gym_organizado/DataLayer/Models/loginUserModel.dart';
import 'package:gym_organizado/DataLayer/Repositories/authentication_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository userRepository;
  final InternetBloc internetBloc;
  final LoginInUserCredentialCubit loginInUserCredential;
  final CheckBoxCubit checkBoxCubitCubit;
  LoginBloc(
      {required this.checkBoxCubitCubit,
      required this.loginInUserCredential,
      required this.userRepository,
      required this.internetBloc})
      : super(LoginInitial()) {
    on<OnLoginButtonPresEvent>(_onLoginButtonPressed);
  }

  _onLoginButtonPressed(
      OnLoginButtonPresEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      if (internetBloc.state is InternetConnected) {
        var respuesta = await userRepository.loginUser(
            email: event.email, password: event.password);

        if (respuesta != null) {
          emit(LoginSuccess(user: respuesta.user));
          if (checkBoxCubitCubit.state is CkeckBoxPressed) {
            loginInUserCredential.remeberCredentials(
                email: respuesta.user.email, password: event.password);
          } else {
            loginInUserCredential.remeberCredentials(email: '', password: '');
          }
        } else {
          emit(const LoginError(message: "Usuario o contraseña incorrectos"));
        }
      } else {
        emit(const LoginError(message: "No internet connection"));
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
