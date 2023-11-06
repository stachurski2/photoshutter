part of 'shutter_bloc.dart';

class ShutterState {
  final bool isBluetoothActive;

  const ShutterState({
    this.isBluetoothActive = false
  });

  ShutterState copyWith({
    bool? isBluetoothActive,
  }) {
    return ShutterState(isBluetoothActive: isBluetoothActive ?? this.isBluetoothActive);
  }
}