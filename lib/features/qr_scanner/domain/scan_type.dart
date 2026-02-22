import 'package:hive_ce/hive.dart';

part 'scan_type.g.dart';

@HiveType(typeId: 5)
enum ScanType {
  @HiveField(0)
  entry,
  @HiveField(1)
  exit;

  String get label => this == ScanType.entry ? 'Entry' : 'Exit';
}
