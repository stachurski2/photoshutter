part of 'shutter_bloc.dart';

class ShutterState {
  final bool isBluetoothActive;
  final List<ScannedDevice> scannedDeviceList;

  ShutterState({
    this.scannedDeviceList = const <ScannedDevice>[],
    this.isBluetoothActive = false
  });

  ShutterState copyWith({
    bool? isBluetoothActive,
    List<ScannedDevice>? scannedDeviceList
  }) {
    return ShutterState(isBluetoothActive: isBluetoothActive ?? this.isBluetoothActive, scannedDeviceList: scannedDeviceList ?? <ScannedDevice>[]);
  }
}