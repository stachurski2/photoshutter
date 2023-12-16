part of 'shutter_bloc.dart';

class ShutterState {
  final bool isConnected;
  final bool isBluetoothActive;
  final List<ScannedDevice> scannedDeviceList;

  ShutterState(
      {this.scannedDeviceList = const <ScannedDevice>[],
      this.isBluetoothActive = false,
      this.isConnected = false});

  ShutterState copyWith(
      {bool? isBluetoothActive,
      List<ScannedDevice>? scannedDeviceList,
      bool? isConnected}) {
    return ShutterState(
        isConnected: isConnected ?? this.isConnected,
        isBluetoothActive: isBluetoothActive ?? this.isBluetoothActive,
        scannedDeviceList: scannedDeviceList ?? <ScannedDevice>[]);
  }
}
