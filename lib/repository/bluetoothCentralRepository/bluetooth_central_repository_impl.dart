import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:photoshutter/repository/helpers/bluetooth_constants.dart';
import 'scanned_device.dart';
import 'package:rxdart/rxdart.dart'; // Import the rxdart package
part 'bluetooth_central_repository.dart';

class BluetoothCentralRepositoryImpl extends BluetoothCentralRepository {
  late Stream<BluetoothAdapterState> _adapterStateStateStream;
  var _scannedDevices = <ScanResult>[];
  get _isConnected => FlutterBluePlus.connectedDevices.isNotEmpty;

  final _isConnectedSubject = BehaviorSubject<bool>();

  BluetoothCentralRepositoryImpl() {
    _adapterStateStateStream = FlutterBluePlus.adapterState;
  }

  @override
  Stream<bool> runBluetoothCentral() {
    _isConnectedSubject.add(_isConnected);
    return _adapterStateStateStream
        .map((event) => event == BluetoothAdapterState.on)
        .asBroadcastStream();
  }

  @override
  void scanDevices() {
    FlutterBluePlus.startScan();
  }

  @override
  Stream<List<ScannedDevice>> scannedDevices() {
    return FlutterBluePlus.scanResults.map((list) {
      _scannedDevices = list;
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
    }).distinct();
  }

  @override
  connectToDevice(String deviceId) async {
    final device = _scannedDevices.firstWhere((device) =>
        device.advertisementData.serviceUuids.firstOrNull.toString() ==
        deviceId);
    await device.device.connect();
    await FlutterBluePlus.stopScan();
    _isConnectedSubject.add(_isConnected);
  }

  @override
  Stream<bool> isConnected() {
    return _isConnectedSubject.asBroadcastStream();
  }

  @override
  disconnect() async {
    for (var device in FlutterBluePlus.connectedDevices) {
      await device.disconnect();
    }
    _isConnectedSubject.add(_isConnected);
  }
}
