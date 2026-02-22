// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScanRecordAdapter extends TypeAdapter<ScanRecord> {
  @override
  final typeId = 4;

  @override
  ScanRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScanRecord(
      id: fields[0] as String,
      userId: fields[1] as String,
      buildingId: fields[2] as String,
      buildingName: fields[3] as String,
      timestamp: fields[4] as DateTime,
      type: fields[5] as ScanType,
    );
  }

  @override
  void write(BinaryWriter writer, ScanRecord obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.buildingId)
      ..writeByte(3)
      ..write(obj.buildingName)
      ..writeByte(4)
      ..write(obj.timestamp)
      ..writeByte(5)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScanRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanRecord _$ScanRecordFromJson(Map<String, dynamic> json) => _ScanRecord(
  id: json['id'] as String,
  userId: json['userId'] as String,
  buildingId: json['buildingId'] as String,
  buildingName: json['buildingName'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  type: $enumDecode(_$ScanTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ScanRecordToJson(_ScanRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'buildingId': instance.buildingId,
      'buildingName': instance.buildingName,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': _$ScanTypeEnumMap[instance.type]!,
    };

const _$ScanTypeEnumMap = {ScanType.entry: 'entry', ScanType.exit: 'exit'};
