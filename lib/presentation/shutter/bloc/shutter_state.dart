part of 'shutter_bloc.dart';

class ShutterState {
  final bool didBluetoothStart;

  const ShutterState({
    this.didBluetoothStart = false
  });

  ShutterState copyWith({
    bool? didBluetoothStart,
  }) {
    return ShutterState(didBluetoothStart: didBluetoothStart ?? this.didBluetoothStart);
  }
}