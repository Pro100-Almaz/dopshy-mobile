import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import 'user_role.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
@HiveType(typeId: 2)
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String fullName,
    @HiveField(3) required String employeeId,
    @HiveField(4) required String department,
    @HiveField(5) String? avatarPath,
    @HiveField(6) @Default(UserRole.user) UserRole role,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
