import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/scan_record.dart';
import '../domain/scan_type.dart';

part 'scan_history_repository.g.dart';

@Riverpod(keepAlive: true)
class ScanHistoryRepository extends _$ScanHistoryRepository {
  Box<dynamic> get _box => Hive.box('scanBox');

  @override
  List<ScanRecord> build() {
    return _box.values.whereType<ScanRecord>().toList()
      ..sort((ScanRecord a, ScanRecord b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<void> addRecord(ScanRecord record) async {
    await _box.put(record.id, record);
    state = <ScanRecord>[record, ...state];
  }

  /// Returns the last scan type for a given user+building pair, or null if none.
  ScanType? lastScanType(String userId, String buildingId) {
    final List<ScanRecord> matches = state
        .where(
          (ScanRecord r) => r.userId == userId && r.buildingId == buildingId,
        )
        .toList();
    if (matches.isEmpty) return null;
    return matches.first.type;
  }

  Future<void> clear() async {
    await _box.clear();
    state = <ScanRecord>[];
  }
}
