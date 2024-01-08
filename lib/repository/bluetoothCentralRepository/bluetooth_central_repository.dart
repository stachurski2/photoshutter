part of 'bluetooth_central_repository_impl.dart';

abstract class BluetoothCentralRepository {
  Stream<bool> runBluetoothCentral();

  scanDevices();

  connectToDevice(String deviceId);

  Stream<bool> isConnected();

  Stream<List<ScannedDevice>> scannedDevices();
}
