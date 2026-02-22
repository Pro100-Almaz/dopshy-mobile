import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../user_profile/data/user_profile_repository.dart';
import '../data/scan_history_repository.dart';
import '../domain/scan_record.dart';
import '../domain/scan_type.dart';

part 'scanner_controller.freezed.dart';
part 'scanner_controller.g.dart';

@freezed
abstract class ScannerState with _$ScannerState {
  const factory ScannerState({
    @Default(false) bool isProcessing,
    ScanRecord? lastRecord,
    String? error,
  }) = _ScannerState;
}

@riverpod
class ScannerController extends _$ScannerController {
  @override
  ScannerState build() => const ScannerState();

  /// Called when the camera detects a QR code value.
  Future<void> onQrScanned(String rawValue) async {
    if (state.isProcessing) return;
    state = state.copyWith(isProcessing: true, error: null, lastRecord: null);

    try {
      final Map<String, dynamic> data =
          jsonDecode(rawValue) as Map<String, dynamic>;

      if (data['type'] != 'building') {
        state = state.copyWith(
          isProcessing: false,
          error: 'Not a valid building QR code',
        );
        return;
      }

      final String buildingId = data['buildingId'] as String;
      final String buildingName = data['buildingName'] as String;

      final String? userId =
          ref.read(userProfileRepositoryProvider)?.id;
      if (userId == null) {
        state = state.copyWith(
          isProcessing: false,
          error: 'No profile found. Please complete your profile first.',
        );
        return;
      }

      final ScanHistoryRepository historyRepo =
          ref.read(scanHistoryRepositoryProvider.notifier);
      final ScanType? last = historyRepo.lastScanType(userId, buildingId);
      final ScanType nextType =
          last == ScanType.entry ? ScanType.exit : ScanType.entry;

      final ScanRecord record = ScanRecord(
        id: const Uuid().v4(),
        userId: userId,
        buildingId: buildingId,
        buildingName: buildingName,
        timestamp: DateTime.now(),
        type: nextType,
      );

      await historyRepo.addRecord(record);
      state = state.copyWith(isProcessing: false, lastRecord: record);
    } on FormatException {
      state = state.copyWith(
        isProcessing: false,
        error: 'Invalid QR code format',
      );
    } catch (e) {
      state = state.copyWith(isProcessing: false, error: e.toString());
    }
  }

  void reset() {
    state = const ScannerState();
  }
}
