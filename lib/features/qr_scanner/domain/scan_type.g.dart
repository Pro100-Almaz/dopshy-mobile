// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScanTypeAdapter extends TypeAdapter<ScanType> {
  @override
  final typeId = 5;

  @override
  ScanType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ScanType.entry;
      case 1:
        return ScanType.exit;
      default:
        return ScanType.entry;
    }
  }

  @override
  void write(BinaryWriter writer, ScanType obj) {
    switch (obj) {
      case ScanType.entry:
        writer.writeByte(0);
      case ScanType.exit:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
