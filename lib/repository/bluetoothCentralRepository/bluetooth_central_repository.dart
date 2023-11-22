part of 'bluetooth_central_repository_impl.dart';

abstract class BluetoothCentralRepository {
  Stream<bool> runBluetoothCentral();

  scanDevices();

  Stream<List<ScannedDevice>> scannedDevices();
}