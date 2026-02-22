// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/authentication/presentation/login/login_screen.dart';
import '../features/home/presentation/main_screen.dart';
import '../features/user_profile/presentation/edit_profile_screen.dart';
import 'fade_extension.dart';

part 'app_router.g.dart';

enum SGRoute {
  main,
  login,
  profileSetup,
  editProfile;

  String get route => '/${toString().replaceAll('SGRoute.', '')}';
  String get name => toString().replaceAll('SGRoute.', '');
}

@riverpod
GoRouter goRouter(Ref ref) => GoRouter(
  initialLocation: SGRoute.login.route,
  routes: <GoRoute>[
    GoRoute(
      path: SGRoute.login.route,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ).fade(),
    GoRoute(
      path: SGRoute.main.route,
      builder: (BuildContext context, GoRouterState state) =>
          const MainScreen(),
    ).fade(),
    GoRoute(
      path: SGRoute.profileSetup.route,
      builder: (BuildContext context, GoRouterState state) =>
          const EditProfileScreen(isSetup: true),
    ).fade(),
    GoRoute(
      path: SGRoute.editProfile.route,
      builder: (BuildContext context, GoRouterState state) =>
          const EditProfileScreen(),
    ).fade(),
  ],
);
