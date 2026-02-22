// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_history_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScanHistoryRepository)
final scanHistoryRepositoryProvider = ScanHistoryRepositoryProvider._();

final class ScanHistoryRepositoryProvider
    extends $NotifierProvider<ScanHistoryRepository, List<ScanRecord>> {
  ScanHistoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanHistoryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanHistoryRepositoryHash();

  @$internal
  @override
  ScanHistoryRepository create() => ScanHistoryRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ScanRecord> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ScanRecord>>(value),
    );
  }
}

String _$scanHistoryRepositoryHash() =>
    r'9fd30e8479e25a99f5372d60fc3dd5a0d3231cee';

abstract class _$ScanHistoryRepository extends $Notifier<List<ScanRecord>> {
  List<ScanRecord> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<ScanRecord>, List<ScanRecord>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ScanRecord>, List<ScanRecord>>,
              List<ScanRecord>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
