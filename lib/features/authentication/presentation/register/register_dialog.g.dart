// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dialog.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the email used during registration so profile setup can pre-fill it.

@ProviderFor(PendingEmail)
final pendingEmailProvider = PendingEmailProvider._();

/// Holds the email used during registration so profile setup can pre-fill it.
final class PendingEmailProvider
    extends $NotifierProvider<PendingEmail, String> {
  /// Holds the email used during registration so profile setup can pre-fill it.
  PendingEmailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingEmailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingEmailHash();

  @$internal
  @override
  PendingEmail create() => PendingEmail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$pendingEmailHash() => r'40aee2a64a8b086e05cf4bfbdccbce2e89bd419f';

/// Holds the email used during registration so profile setup can pre-fill it.

abstract class _$PendingEmail extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
