import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:photoshutter/repository/helpers/bluetooth_constants.dart';
import 'scanned_device.dart';
part 'bluetooth_central_repository.dart';

class BluetoothCentralRepositoryImpl extends BluetoothCentralRepository {
  late Stream<BluetoothAdapterState> _adapterStateStateStream;

  BluetoothCentralRepositoryImpl() {
    _adapterStateStateStream = FlutterBluePlus.adapterState;
  }

  @override
  Stream<bool> runBluetoothCentral() {
    return _adapterStateStateStream
        .map((event) => event == BluetoothAdapterState.on);
  }

  @override
  void scanDevices() {
    FlutterBluePlus.startScan();
  }

  @override
  Stream<List<ScannedDevice>> scannedDevices() {
    return FlutterBluePlus.scanResults.map((list) {
      return list
          .where((device) =>
              device.advertisementData.serviceUuids.firstOrNull
                  ?.toUpperCase()
                  .contains(BluetoothConstants.lastFourCharsFromServiceUuid
                      .toUpperCase()) ??
              false)
          .map((device) => ScannedDevice(
              device.advertisementData.serviceUuids.firstOrNull.toString(),
              device.advertisementData.connectable,
              adLocalName: device.advertisementData.localName))
          .toSet()
          .toList();
    });
  }
}
