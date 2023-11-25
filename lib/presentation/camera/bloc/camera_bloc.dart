import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/bluetooth_peripheral_repository_impl.dart';

part 'camera_state.dart';
part 'camera_event.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final BluetoothPeripheralRepository bluetoothPeripheralRepository;

  CameraBloc({required this.bluetoothPeripheralRepository})
      : super(CameraState()) {
    on<CameraAppearEvent>(_startBluetoothPeripheralState);
  }

  void _startBluetoothPeripheralState(
      CameraAppearEvent event, Emitter<CameraState> emit) async {
    final didBluetoothStartStream =
        bluetoothPeripheralRepository.runBluetoothPeripheral();
    await emit.forEach(didBluetoothStartStream,
        onData: (bool isBluetoothActive) {
      return state.copyWith(isBluetoothActive: isBluetoothActive);
    });
  }
}
