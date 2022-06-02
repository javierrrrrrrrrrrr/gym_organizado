import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? connectionStream;
  InternetBloc() : super(InternetInitial()) {
    on<OnInternetChangeEvent>(_onInternetChangeEvent);

    connectionStream = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        add(const OnInternetChangeEvent(false));
      } else {
        add(const OnInternetChangeEvent(true));
      }
    });
  }

  _onInternetChangeEvent(
      OnInternetChangeEvent event, Emitter<InternetState> emit) {
    if (event.isInternetConnected) {
      emit(InternetConnected());
    } else {
      emit(InternetDisconnected());
    }
  }

  @override
  Future<void> close() {
    connectionStream?.cancel();
    return super.close();
  }
}
