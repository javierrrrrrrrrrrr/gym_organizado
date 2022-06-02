part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class OnInternetChangeEvent extends InternetEvent {
  final bool isInternetConnected;

  const OnInternetChangeEvent(this.isInternetConnected);
  @override
  List<Object> get props => [isInternetConnected];
}
