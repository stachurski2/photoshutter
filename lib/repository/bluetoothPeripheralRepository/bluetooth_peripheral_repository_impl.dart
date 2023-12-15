import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'dart:typed_data';
import 'package:photoshutter/repository/helpers/bluetooth_constants.dart';
part 'bluetooth_peripheral_repository.dart';

class BluetoothPeripheralRepositoryImpl extends BluetoothPeripheralRepository {
  final AdvertiseData advertiseData;
  final AdvertiseSettings advertiseSettings;
  final FlutterBlePeripheral _blePeripheral;

  BluetoothPeripheralRepositoryImpl()
      : advertiseData = AdvertiseData(
            serviceUuid: BluetoothConstants.serviceUuid,
            manufacturerId: BluetoothConstants.manufacturerId,
            manufacturerData:
                Uint8List.fromList(BluetoothConstants.manufacturerData),
            localName: BluetoothConstants.localName),
        advertiseSettings = AdvertiseSettings(
          connectable: true,
          timeout: 0,
        ),
        _blePeripheral = FlutterBlePeripheral();

  @override
  Stream<bool> runBluetoothPeripheral() {
    _blePeripheral.start(
        advertiseData: advertiseData, advertiseSettings: advertiseSettings);

    return _blePeripheral.onPeripheralStateChanged?.map((event) =>
            event == PeripheralState.idle ||
            event == PeripheralState.advertising) ??
        Stream.empty();
  }
}
