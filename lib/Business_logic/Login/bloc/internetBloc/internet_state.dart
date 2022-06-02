part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
  InternetConnected() {
    print('InternetConnected');
  }
}

class InternetDisconnected extends InternetState {
  InternetDisconnected() {
    print("Quitaste la Intenrt");
  }
}
