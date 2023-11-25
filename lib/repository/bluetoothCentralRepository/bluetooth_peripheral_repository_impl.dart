import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'dart:typed_data';
part 'bluetooth_peripheral_repository.dart';

class BluetoothPeripheralRepositoryImpl extends BluetoothPeripheralRepository {
  final AdvertiseData advertiseData = AdvertiseData(
      serviceUuid: 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7',
      manufacturerId: 1234,
      manufacturerData: Uint8List.fromList([1, 2, 3, 4, 5, 6]),
      localName: "hehe");

  BluetoothPeripheralRepositoryImpl();

  @override
  Stream<bool> runBluetoothPeripheral() {
    return FlutterBlePeripheral()
        .start(advertiseData: advertiseData)
        .asStream()
        .map<bool>((event) => event == BluetoothPeripheralState.granted);
  }
}
