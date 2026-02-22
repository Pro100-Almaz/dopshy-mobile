import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../router/app_router.dart';
import '../../../utils/context_extensions.dart';
import '../../authentication/presentation/register/register_dialog.dart';
import '../domain/user_role.dart';
import 'profile_controller.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key, this.isSetup = false});

  /// When true, the screen is shown after registration for first-time setup.
  final bool isSetup;

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _employeeIdController;
  late final TextEditingController _departmentController;
  UserRole _selectedRole = UserRole.user;
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileControllerProvider).profile;
    _fullNameController =
        TextEditingController(text: profile?.fullName ?? '');
    _employeeIdController =
        TextEditingController(text: profile?.employeeId ?? '');
    _departmentController =
        TextEditingController(text: profile?.department ?? '');
    _selectedRole = profile?.role ?? UserRole.user;
    _avatarPath = profile?.avatarPath;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _employeeIdController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) {
      setState(() => _avatarPath = image.path);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final String? email = ref.read(profileControllerProvider).profile?.email ??
        ref.read(pendingEmailProvider);
    await ref.read(profileControllerProvider.notifier).saveProfile(
          email: email ?? '',
          fullName: _fullNameController.text.trim(),
          employeeId: _employeeIdController.text.trim(),
          department: _departmentController.text.trim(),
          avatarPath: _avatarPath,
          role: _selectedRole,
        );
    if (mounted) {
      context.go(SGRoute.main.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading =
        ref.watch(profileControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSetup ? 'Set Up Profile' : 'Edit Profile'),
        automaticallyImplyLeading: !widget.isSetup,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: context.colorScheme.primaryContainer,
                  backgroundImage: _avatarPath != null
                      ? FileImage(File(_avatarPath!))
                      : null,
                  child: _avatarPath == null
                      ? Icon(
                          Icons.person,
                          size: 50,
                          color: context.colorScheme.onPrimaryContainer,
                        )
                      : null,
                ),
              ),
              const Gap(8),
              TextButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.photo_camera_outlined),
                label: const Text('Change Photo'),
              ),
              const Gap(24),
              TextFormField(
                controller: _fullNameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (String? v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const Gap(16),
              TextFormField(
                controller: _employeeIdController,
                decoration: const InputDecoration(
                  labelText: 'Employee ID',
                  prefixIcon: Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (String? v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const Gap(16),
              TextFormField(
                controller: _departmentController,
                decoration: const InputDecoration(
                  labelText: 'Department',
                  prefixIcon: Icon(Icons.business_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (String? v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const Gap(16),
              DropdownButtonFormField<UserRole>(
                value: _selectedRole,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  prefixIcon: Icon(Icons.shield_outlined),
                  border: OutlineInputBorder(),
                ),
                items: UserRole.values
                    .map(
                      (UserRole r) => DropdownMenuItem<UserRole>(
                        value: r,
                        child: Text(r.label),
                      ),
                    )
                    .toList(),
                onChanged: (UserRole? v) {
                  if (v != null) setState(() => _selectedRole = v);
                },
              ),
              const Gap(32),
              FilledButton(
                onPressed: isLoading ? null : _save,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(widget.isSetup ? 'Get Started' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
