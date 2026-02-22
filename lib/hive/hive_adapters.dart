// lib/hive/hive_adapters.dart
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../config/theme/theme_ui_model.dart';
import '../features/authentication/domain/login_request.dart';
import '../features/qr_scanner/domain/scan_record.dart';
import '../features/qr_scanner/domain/scan_type.dart';
import '../features/user_profile/domain/user_profile.dart';
import '../features/user_profile/domain/user_role.dart';

@GenerateAdapters(<AdapterSpec<dynamic>>[
  AdapterSpec<LoginCredentials>(),
  AdapterSpec<ThemeUiModel>(),
  AdapterSpec<UserProfile>(),
  AdapterSpec<UserRole>(),
  AdapterSpec<ScanRecord>(),
  AdapterSpec<ScanType>(),
])
part 'hive_adapters.g.dart';
