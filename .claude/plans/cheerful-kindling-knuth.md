# Plan: QR Building Access Tracker

## Context
Build a QR-based building entry/exit tracking app on top of the existing Flutter template. All data is stored locally with Hive (no backend yet). Users authenticate, set up a profile (full name, employee ID, department, photo, role), show their personal QR code to be scanned, and also scan building QR codes to log entry/exit. A scan history is persisted per user.

---

## New Dependencies (pubspec.yaml)
```yaml
mobile_scanner: ^7.0.0       # camera QR scanning
qr_flutter: ^4.1.0           # generate user QR codes
image_picker: ^1.0.7         # profile photo from gallery/camera
uuid: ^4.5.1                 # generate unique IDs
```

---

## New Models

### `lib/features/user_profile/domain/user_role.dart`
```dart
enum UserRole { user, manager, admin }
```
(Hive adapter via `@HiveType(typeId: 3)`)

### `lib/features/user_profile/domain/user_profile.dart`
Freezed + Hive model:
- `id` (String, UUID)
- `email` (String)
- `fullName` (String)
- `employeeId` (String)
- `department` (String)
- `avatarPath` (String?) — local file path
- `role` (UserRole, default: user)

### `lib/features/qr_scanner/domain/scan_type.dart`
```dart
enum ScanType { entry, exit }
```

### `lib/features/qr_scanner/domain/scan_record.dart`
Freezed + Hive model:
- `id` (String, UUID)
- `userId` (String)
- `buildingId` (String)
- `buildingName` (String)
- `timestamp` (DateTime)
- `type` (ScanType — auto-determined: alternates entry/exit per building)

---

## Files to Create

### Feature: User Profile
```
lib/features/user_profile/
  domain/
    user_role.dart
    user_profile.dart
  data/
    user_profile_repository.dart   # Riverpod keepAlive notifier, Hive 'profileBox'
  presentation/
    profile_screen.dart            # displays name, email, employeeId, dept, role badge, avatar
    edit_profile_screen.dart       # form to set/edit all profile fields + image picker
    profile_controller.dart        # @riverpod class, wraps UserProfileRepository
    profile_ui_model.dart          # Freezed: UserProfile? + isLoading + error
```

### Feature: QR Scanner
```
lib/features/qr_scanner/
  domain/
    scan_type.dart
    scan_record.dart
  data/
    scan_history_repository.dart   # Riverpod keepAlive notifier, Hive 'scanBox'
  presentation/
    scanner_screen.dart            # MobileScanner widget; parses JSON QR → ScanRecord
    my_qr_screen.dart              # QrImageView showing user's encoded JSON identity
    scan_history_screen.dart       # ListView of ScanRecord sorted newest-first
    scanner_controller.dart        # handles scan logic, entry/exit toggle, saves record
```

### Main Screen (replace HomeScreen template)
```
lib/features/home/presentation/main_screen.dart
```
Bottom NavigationBar with 4 tabs:
1. History (`scan_history_screen.dart`)
2. Scan QR (`scanner_screen.dart`)
3. My QR (`my_qr_screen.dart`)
4. Profile (`profile_screen.dart`)

---

## Files to Modify

| File | Change |
|------|--------|
| `pubspec.yaml` | Add 4 new dependencies |
| `lib/hive/hive_adapters.dart` | Add `AdapterSpec<UserProfile>`, `AdapterSpec<ScanRecord>`, `AdapterSpec<UserRole>`, `AdapterSpec<ScanType>` |
| `lib/hive/hive.dart` | Open `profileBox` and `scanBox` on startup |
| `lib/router/app_router.dart` | Add routes: `main`, `profileSetup`, `editProfile`; replace `home` with `main` |
| `lib/features/authentication/presentation/login/login_screen.dart` | After login: check if profile exists → if yes go `/main`, if no go `/profileSetup` |
| `lib/features/authentication/presentation/register/register_dialog.dart` | After register success: dismiss and navigate to `/profileSetup` |

---

## Navigation Flow

```
/login
  → login success + profile exists      → /main
  → login success + no profile          → /profileSetup
  → register success                    → /profileSetup

/profileSetup  (edit_profile_screen in "setup mode")
  → save profile                        → /main

/main (bottom nav)
  [0] History
  [1] Scan QR
  [2] My QR
  [3] Profile → tap Edit               → /editProfile
```

---

## QR Code Format

**User's QR** (shown in My QR tab):
```json
{"type":"user","userId":"<uuid>","employeeId":"E-001","name":"John Doe","department":"Engineering"}
```

**Building QR** (scanned by user, created externally):
```json
{"type":"building","buildingId":"B-001","buildingName":"Main Office","location":"Floor 3"}
```

If the scanned QR doesn't match the building JSON schema, show an error snackbar.

**Entry/Exit toggle logic** (in `ScannerController`):
- Check the most recent `ScanRecord` for `(userId, buildingId)` in Hive
- If last was `entry` → this scan is `exit`; otherwise → `entry`

---

## Hive Type IDs

| Model | typeId |
|-------|--------|
| `LoginCredentials` | 0 (existing) |
| `ThemeUiModel` | 1 (existing) |
| `UserProfile` | 2 |
| `UserRole` | 3 |
| `ScanRecord` | 4 |
| `ScanType` | 5 |

---

## Implementation Order
1. Add dependencies → `flutter pub get`
2. Create domain models (UserProfile, UserRole, ScanRecord, ScanType)
3. Update `hive_adapters.dart` and `hive.dart`
4. Run `build_runner`
5. Create data repositories (UserProfileRepository, ScanHistoryRepository)
6. Create presentation layer (controllers, UI models, screens)
7. Create MainScreen with bottom nav
8. Update router
9. Update login/register flow for profile check

---

## Verification
- Run `fvm flutter run --flavor dev -t lib/main_dev.dart`
- Register a new account → should navigate to profile setup
- Fill in profile → tap save → lands on main screen
- Go to "My QR" tab → QR code displays
- Go to "Scan" tab → camera opens → scan a building QR → success snackbar with entry/exit status
- Go to "History" tab → scan record appears
- Scan again for same building → should toggle to exit
- Go to Profile → details match what was entered
