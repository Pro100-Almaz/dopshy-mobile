// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScannerController)
final scannerControllerProvider = ScannerControllerProvider._();

final class ScannerControllerProvider
    extends $NotifierProvider<ScannerController, ScannerState> {
  ScannerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scannerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scannerControllerHash();

  @$internal
  @override
  ScannerController create() => ScannerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScannerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScannerState>(value),
    );
  }
}

String _$scannerControllerHash() => r'174c25a4d056a329592cf6bb03476b4dcdc2d4d5';

abstract class _$ScannerController extends $Notifier<ScannerState> {
  ScannerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ScannerState, ScannerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScannerState, ScannerState>,
              ScannerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
