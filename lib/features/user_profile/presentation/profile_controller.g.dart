// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileController)
final profileControllerProvider = ProfileControllerProvider._();

final class ProfileControllerProvider
    extends $NotifierProvider<ProfileController, ProfileUiModel> {
  ProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileControllerHash();

  @$internal
  @override
  ProfileController create() => ProfileController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileUiModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileUiModel>(value),
    );
  }
}

String _$profileControllerHash() => r'cf84ecc62a6a1f3ef07d6697f4d44cbf804f8c8a';

abstract class _$ProfileController extends $Notifier<ProfileUiModel> {
  ProfileUiModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProfileUiModel, ProfileUiModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileUiModel, ProfileUiModel>,
              ProfileUiModel,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
