# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

**Install dependencies:**
```bash
flutter pub get
```

**Code generation** (required after modifying Riverpod providers, Freezed models, Hive adapters, or JSON serializable classes):
```bash
dart run build_runner build --delete-conflicting-outputs
```

**Run by flavor:**
```bash
flutter run --flavor dev -t lib/main_dev.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor prod -t lib/main_prod.dart
```

**Static analysis:**
```bash
dart analyze
```

**Tests:**
```bash
flutter test
# Single test file:
flutter test test/path/to/test_file.dart
```

## Architecture

This project follows **Clean Architecture** organized by feature. Each feature under `lib/features/` has three layers:
- `data/` — repositories, data sources (Hive, HTTP)
- `domain/` — models (Freezed), use cases
- `presentation/` — screens, controllers (Riverpod notifiers), UI models

**State management:** Riverpod with code generation (`@riverpod` annotations). Controllers are Riverpod notifiers; use `riverpod_generator` output (`.g.dart` files). Never instantiate providers manually.

**Immutable state models:** All UI state and domain models use Freezed (`@freezed` annotation). Run build_runner after modifying them. Models with JSON support use `@JsonSerializable`.

**Routing:** GoRouter defined in `lib/router/app_router.dart`. Routes are an enum; screens register via `GoRoute`. Custom page transitions are in `fade_extension.dart` and `slide_extension.dart`.

**Networking:** `NetworkRepository` (`lib/data/repository/network_repository.dart`) is a Riverpod provider wrapping Dio. It includes retry, caching (in-memory), and logging interceptors. Uses generic `get<T>()` and `post<T>()` methods. Base URL comes from `AppFlavor.currentFlavor`.

**Local storage:** Hive CE initialized in `lib/hive/hive.dart`. Adapters are generated — run build_runner after adding `@HiveType`/`@HiveField` annotations. A `prefs` box stores app-level preferences (theme mode).

**Flavors:** Three flavors — `dev`, `staging`, `prod`. Flavor config (app name, bundle ID, base URL) lives in `lib/flavors/app_flavor.dart`. Always target a flavor when running or building.

**Localization:** Easy Localization with translation JSON files in `assets/translations/`. Supported locales: `en`, `tr`. Use `context.tr('key')` in widgets.

**Theme:** FlexColorScheme (Material 3, Deep Blue scheme). `ThemeLogic` Riverpod notifier manages theme mode and persists it to Hive.

## Code Generation Files

Files ending in `.freezed.dart`, `.g.dart` are generated — do not edit them manually. After any change to annotated classes, run build_runner.

## Linting

Custom rules are in `lint_rules.yaml` (included by `analysis_options.yaml`). The Riverpod linting plugin is active. Strict mode is enabled: `strict-casts`, `strict-inference`, `strict-raw-types`.
