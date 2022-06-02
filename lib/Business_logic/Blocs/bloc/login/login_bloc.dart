import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_organizado/Business_logic/Blocs/bloc/internet/bloc/internet_bloc.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/RberUserCredentials/rememberusercredentials_cubit.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/checkboxcubit/checkboccubit_cubit.dart';
import 'package:gym_organizado/DataLayer/Models/loginUserModel.dart';
import 'package:gym_organizado/DataLayer/Repositories/authentication_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository userRepository;
  final InternetBloc internetBloc;
  final RememberUserCredentialsCubit rememberusercredentialsCubit;
  final CheckBoxCubitCubit checkBoxCubitCubit;
  LoginBloc(
      {required this.checkBoxCubitCubit,
      required this.rememberusercredentialsCubit,
      required this.userRepository,
      required this.internetBloc})
      : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      if (internetBloc.state is InternetConnected) {
        var respuesta = await userRepository.loginUser(
            email: event.email, password: event.password);

        if (respuesta != null) {
          emit(LoginSuccess(user: respuesta.user));
          if (checkBoxCubitCubit.state is CkeckBoxPressed) {
            rememberusercredentialsCubit.remeberCredentials(
                email: respuesta.user.email, password: event.password);
          } else {
            rememberusercredentialsCubit.remeberCredentials(
                email: '', password: '');
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
