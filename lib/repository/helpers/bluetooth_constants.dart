class BluetoothConstants {
  static const String serviceUuid = 'bf27730d-860a-4e09-889c-2d8b6a9e0fe7';
  static const int manufacturerId = 1234;
  static const List<int> manufacturerData = [1, 2, 3, 4, 5, 6];
  static const String localName = "hehe";

  static String get lastFourCharsFromServiceUuid =>
      serviceUuid.substring(serviceUuid.length - 4);
}
