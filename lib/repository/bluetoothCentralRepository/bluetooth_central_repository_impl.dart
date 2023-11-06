import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
part 'bluetooth_central_repository.dart';

class BluetoothCentralRepositoryImpl extends BluetoothCentralRepository  {

  late Stream<BluetoothAdapterState> _adapterStateStateStream;

  BluetoothCentralRepositoryImpl() {
   _adapterStateStateStream = FlutterBluePlus.adapterState;
  }

  Stream<bool> runBluetoothCentral() {
     return _adapterStateStateStream.map<bool>((event) => event == BluetoothAdapterState.on ? true : false);
  }
}