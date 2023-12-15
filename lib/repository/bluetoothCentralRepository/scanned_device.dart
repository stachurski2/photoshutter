class ScannedDevice {
  final String id;
  final String? adLocalName;
  final bool connectable;
  ScannedDevice(this.id, this.connectable, {this.adLocalName});
}
