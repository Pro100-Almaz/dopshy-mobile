import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../router/app_router.dart';
import '../../../utils/context_extensions.dart';
import '../../authentication/data/hive/user_repository.dart';
import '../domain/user_profile.dart';
import '../domain/user_role.dart';
import 'profile_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Color _roleColor(UserRole role, ColorScheme cs) {
    switch (role) {
      case UserRole.admin:
        return Colors.red.shade600;
      case UserRole.manager:
        return Colors.orange.shade700;
      case UserRole.user:
        return cs.primary;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserProfile? profile = ref.watch(profileControllerProvider).profile;

    if (profile == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: const Center(child: Text('No profile found.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => context.push(SGRoute.editProfile.route),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 55,
              backgroundColor: context.colorScheme.primaryContainer,
              backgroundImage: profile.avatarPath != null
                  ? FileImage(File(profile.avatarPath!))
                  : null,
              child: profile.avatarPath == null
                  ? Icon(
                      Icons.person,
                      size: 55,
                      color: context.colorScheme.onPrimaryContainer,
                    )
                  : null,
            ),
            const Gap(16),
            Text(
              profile.fullName,
              style: context.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(4),
            Text(profile.email, style: context.textTheme.bodyMedium),
            const Gap(12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: _roleColor(profile.role, context.colorScheme)
                    .withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _roleColor(profile.role, context.colorScheme),
                ),
              ),
              child: Text(
                profile.role.label,
                style: TextStyle(
                  color: _roleColor(profile.role, context.colorScheme),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(32),
            const Divider(),
            _InfoTile(
              icon: Icons.badge_outlined,
              label: 'Employee ID',
              value: profile.employeeId,
            ),
            _InfoTile(
              icon: Icons.business_outlined,
              label: 'Department',
              value: profile.department,
            ),
            const Gap(32),
            OutlinedButton.icon(
              onPressed: () async {
                await ref
                    .read(userRepositoryProvider.notifier)
                    .logout();
                if (context.mounted) {
                  context.go(SGRoute.login.route);
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text('Log out'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: context.colorScheme.primary),
      title: Text(label, style: context.textTheme.labelMedium),
      subtitle: Text(value, style: context.textTheme.bodyLarge),
    );
  }
}
