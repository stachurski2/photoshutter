part of 'shutter_bloc.dart';

abstract class ShutterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShutterAppearEvent extends ShutterEvent {}

class ShutterScanEvent extends ShutterEvent {}

class ShutterConnectEvent extends ShutterEvent {
  final String deviceId;

  ShutterConnectEvent(this.deviceId);
}

class ShutterListenConnectionEvent extends ShutterEvent {}

class ShutterDisconnectEvent extends ShutterEvent {}
