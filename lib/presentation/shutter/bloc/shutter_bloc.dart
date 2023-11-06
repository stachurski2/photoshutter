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
    final didBluetoothStartStream = bluetoothCentralRepository.runBluetoothCentral();
    // await didBluetoothStart.listen((isBluetoothActive) async {
    //   emit(state.copyWith(isBluetoothActive: isBluetoothActive));
    // });
    await emit.forEach(didBluetoothStartStream, onData: (bool isBluetoothActive) {
      print("test");
      print(isBluetoothActive.toString());
      return state.copyWith(isBluetoothActive: isBluetoothActive);
    });
  }

}