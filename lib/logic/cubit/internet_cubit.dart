import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:astrotak/constants/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription connStreamSubscription;
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connStreamSubscription =
        connectivity.onConnectivityChanged.listen((connResult) {
      if (connResult == ConnectivityResult.wifi ||
          connResult == ConnectivityResult.mobile) {
        emit(InternetConnected(connectionStatus: ConnectionStatus.Connected));
      } else if (connResult == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }
    });
  }

  void internetConnected(ConnectionStatus connection) =>
      emit(InternetConnected(connectionStatus: connection));

  void internetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connStreamSubscription.cancel();
    return super.close();
  }
}
