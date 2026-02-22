import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../data/user_profile_repository.dart';
import '../domain/user_profile.dart';
import '../domain/user_role.dart';
import 'profile_ui_model.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  ProfileUiModel build() {
    final UserProfile? profile = ref.watch(userProfileRepositoryProvider);
    return ProfileUiModel(profile: profile);
  }

  Future<void> saveProfile({
    required String email,
    required String fullName,
    required String employeeId,
    required String department,
    String? avatarPath,
    UserRole role = UserRole.user,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final String id = state.profile?.id ?? const Uuid().v4();
      final UserProfile profile = UserProfile(
        id: id,
        email: email,
        fullName: fullName,
        employeeId: employeeId,
        department: department,
        avatarPath: avatarPath ?? state.profile?.avatarPath,
        role: role,
      );
      await ref.read(userProfileRepositoryProvider.notifier).save(profile);
      state = state.copyWith(profile: profile, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateAvatar(String avatarPath) async {
    if (state.profile == null) return;
    await saveProfile(
      email: state.profile!.email,
      fullName: state.profile!.fullName,
      employeeId: state.profile!.employeeId,
      department: state.profile!.department,
      avatarPath: avatarPath,
      role: state.profile!.role,
    );
  }
}
