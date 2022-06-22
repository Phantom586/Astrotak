part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionStatus connectionStatus;

  InternetConnected({required this.connectionStatus});
}

class InternetDisconnected extends InternetState {}
