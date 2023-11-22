import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/bluetooth_central_repository_impl.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/scanned_device.dart';
part 'shutter_state.dart';
part 'shutter_event.dart';

class ShutterBloc extends Bloc<ShutterEvent, ShutterState> {

  final BluetoothCentralRepository bluetoothCentralRepository;


  ShutterBloc({required this.bluetoothCentralRepository}) : super(ShutterState()) {
    on<ShutterAppearEvent>(_startBluetoothCentralState);
    on<ShutterScanEvent>(_scanBluetoothDevicesState);
  }

  void _startBluetoothCentralState(ShutterAppearEvent event, Emitter<ShutterState> emit) async {
    final didBluetoothStartStream = bluetoothCentralRepository.runBluetoothCentral();

    await emit.forEach(didBluetoothStartStream, onData: (bool isBluetoothActive) {
      return state.copyWith(isBluetoothActive: isBluetoothActive);
    });
  }

  void _scanBluetoothDevicesState(ShutterScanEvent event, Emitter<ShutterState> emit) async {
    final scannedDevicesStream = bluetoothCentralRepository.scannedDevices().distinct();
    bluetoothCentralRepository.scanDevices();

    await emit.forEach(scannedDevicesStream, onData: (List<ScannedDevice> devices){
      return state.copyWith(scannedDeviceList: devices);
    });
  }

}