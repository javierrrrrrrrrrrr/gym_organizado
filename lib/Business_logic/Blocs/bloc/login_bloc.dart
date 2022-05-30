import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../DataLayer/Repositories/authentication_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository? userRepository;

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  LoginState get initialState => AuthenticationUninitialized();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AppStarted) {
      // Juicio si hay señal
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    } else if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    } else if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
