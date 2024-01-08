import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/bluetooth_central_repository_impl.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/scanned_device.dart';
part 'shutter_state.dart';
part 'shutter_event.dart';

class ShutterBloc extends Bloc<ShutterEvent, ShutterState> {
  final BluetoothCentralRepository bluetoothCentralRepository;

  ShutterBloc({required this.bluetoothCentralRepository})
      : super(ShutterState()) {
    on<ShutterAppearEvent>(_startBluetoothCentralState);
    on<ShutterScanEvent>(_scanBluetoothDevicesState);
    on<ShutterConnectEvent>(_connectToDeviceState);
    on<ShutterListenConnectionEvent>(_listenConnectionState);
  }

  void _startBluetoothCentralState(
      ShutterAppearEvent event, Emitter<ShutterState> emit) async {
    final didBluetoothStartStream =
        bluetoothCentralRepository.runBluetoothCentral();

    await emit.forEach(didBluetoothStartStream,
        onData: (bool isBluetoothActive) {
      return state.copyWith(isBluetoothActive: isBluetoothActive);
    });
  }

  void _scanBluetoothDevicesState(
      ShutterScanEvent event, Emitter<ShutterState> emit) async {
    final scannedDevicesStream =
        bluetoothCentralRepository.scannedDevices().distinct();
    bluetoothCentralRepository.scanDevices();

    await emit.forEach(scannedDevicesStream,
        onData: (List<ScannedDevice> devices) {
      return state.copyWith(scannedDeviceList: devices);
    });
  }

  void _connectToDeviceState(
      ShutterConnectEvent event, Emitter<ShutterState> emit) {
    bluetoothCentralRepository.connectToDevice(event.deviceId);
  }

  void _listenConnectionState(
      ShutterListenConnectionEvent event, Emitter<ShutterState> emit) async {
    final isConnectedStream = bluetoothCentralRepository.isConnected();
    await emit.forEach(isConnectedStream, onData: (bool isConnected) {
      return state.copyWith(isConnected: isConnected);
    });
  }
}
