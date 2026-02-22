import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user_profile.dart';

part 'user_profile_repository.g.dart';

@Riverpod(keepAlive: true)
class UserProfileRepository extends _$UserProfileRepository {
  static const String _key = 'profile';

  Box<dynamic> get _box => Hive.box('profileBox');

  @override
  UserProfile? build() {
    final dynamic raw = _box.get(_key);
    if (raw is UserProfile) return raw;
    return null;
  }

  Future<void> save(UserProfile profile) async {
    await _box.put(_key, profile);
    state = profile;
  }

  Future<void> clear() async {
    await _box.delete(_key);
    state = null;
  }
}
