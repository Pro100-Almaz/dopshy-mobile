import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/user_profile.dart';

part 'profile_ui_model.freezed.dart';

@freezed
abstract class ProfileUiModel with _$ProfileUiModel {
  const factory ProfileUiModel({
    UserProfile? profile,
    @Default(false) bool isLoading,
    String? error,
  }) = _ProfileUiModel;
}
