import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import 'scan_type.dart';

part 'scan_record.freezed.dart';
part 'scan_record.g.dart';

@freezed
@HiveType(typeId: 4)
abstract class ScanRecord with _$ScanRecord {
  const factory ScanRecord({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String buildingId,
    @HiveField(3) required String buildingName,
    @HiveField(4) required DateTime timestamp,
    @HiveField(5) required ScanType type,
  }) = _ScanRecord;

  factory ScanRecord.fromJson(Map<String, dynamic> json) =>
      _$ScanRecordFromJson(json);
}
