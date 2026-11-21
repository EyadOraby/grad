# SANAD

*More than a helping hand.* SANAD is my graduation project: one Flutter app for everyday public services in Egypt.

- **Government services**: national ID renewal and integrated services card (IC) requests
- **Medical services**: find doctors, hospitals, radiology and physiotherapy centers, and book appointments with a calendar and time picker
- **Jobs**: listings suited to the user's condition
- Sign in with a national ID, a side drawer and a shared bottom navigation

## Running it

```bash
flutter pub get
flutter run            # a device or emulator
flutter run -d chrome  # the web version
```

On the web, `?screen=` opens a section directly, for example `?screen=medical`, `?screen=doctors` or `?screen=jobs`. The full list is in [`lib/deep_links.dart`](lib/deep_links.dart).

## Notes

- Data is sample data inside the app, so it runs without a backend. Firebase is configured for a future Cloud Firestore backend.
- Sign-in accepts any national ID while there is no accounts backend.
- Updated in 2026 to current Flutter and Dart 3: replaced discontinued packages, Material 3 navigation, fixed sign-out and the app's start flow. CI runs analyze, tests and a web build on every pull request.
