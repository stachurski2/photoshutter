import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
part 'bluetooth_central_repository.dart';

class BluetoothCentralRepositoryImpl extends BluetoothCentralRepository  {
  Future<bool> runBluetoothCentral() {
    return Future(() => true);
  }
}