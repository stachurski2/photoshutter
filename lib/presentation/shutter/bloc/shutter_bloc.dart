import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photoshutter/repository/bluetoothCentralRepository/bluetooth_central_repository_impl.dart';
part 'shutter_state.dart';
part 'shutter_event.dart';

class ShutterBloc extends Bloc<ShutterEvent, ShutterState> {

  final BluetoothCentralRepository bluetoothCentralRepository;

  ShutterBloc({required this.bluetoothCentralRepository}) : super(ShutterState()) {
    on<ShutterAppearEvent>(_startBluetoothCentralState);
  }

  void _startBluetoothCentralState(ShutterAppearEvent event, Emitter<ShutterState> emit) async {
    final didBluetoothStart = await bluetoothCentralRepository.runBluetoothCentral();
      emit(state.copyWith(didBluetoothStart: didBluetoothStart));
  }

}