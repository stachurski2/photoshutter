import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'scanned_device.dart';
part 'bluetooth_central_repository.dart';

class BluetoothCentralRepositoryImpl extends BluetoothCentralRepository  {

  late Stream<BluetoothAdapterState> _adapterStateStateStream;

  BluetoothCentralRepositoryImpl() {
   _adapterStateStateStream = FlutterBluePlus.adapterState;
  }

  @override
  Stream<bool> runBluetoothCentral() {
     return _adapterStateStateStream.map<bool>((event) => event == BluetoothAdapterState.on ? true : false);
  }

  @override
  scanDevices() {
    FlutterBluePlus.startScan();
  }

  @override
  Stream<List<ScannedDevice>> scannedDevices () {
    return FlutterBluePlus.scanResults.map((list) => list.map((device) => ScannedDevice(device.advertisementData.serviceUuids.firstOrNull.toString() ?? "", adLocalName: device.advertisementData.localName.toString())).toList());
  }
}

