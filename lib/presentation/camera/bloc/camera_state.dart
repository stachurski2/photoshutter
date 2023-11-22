part of 'camera_bloc.dart';

class CameraState {
  final bool isBluetoothActive;

  CameraState({
    this.isBluetoothActive = false
  });

  CameraState copyWith({
    bool? isBluetoothActive,
  }) {
    return CameraState(isBluetoothActive: isBluetoothActive ?? this.isBluetoothActive);
  }
}