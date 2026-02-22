import 'package:hive_ce/hive.dart';

part 'user_role.g.dart';

@HiveType(typeId: 3)
enum UserRole {
  @HiveField(0)
  user,
  @HiveField(1)
  manager,
  @HiveField(2)
  admin;

  String get label {
    switch (this) {
      case UserRole.user:
        return 'User';
      case UserRole.manager:
        return 'Manager';
      case UserRole.admin:
        return 'Admin';
    }
  }
}
