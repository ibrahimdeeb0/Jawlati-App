# جولتي · Jawlati

جولتي تطبيق Flutter بواجهة عربية لمندوبي المبيعات والتوزيع. يجمع العملاء والزيارات والفواتير والتحصيل والجرد ضمن جولة المندوب اليومية.

Jawlati is an Arabic-language Flutter app for field sales and distribution reps. The local demo brings customer records, visit check-in and check-out, and sales workflows together in one dashboard.

## What you can try

| Area | Current demo behavior |
| --- | --- |
| Demo entry | Open the dashboard with **دخول النسخة التجريبية**. The demo runs without an account or backend. |
| Customers and visits | Add or browse customers, select a customer to start a visit, and find completed or cancelled visits in the history. Customers and visits persist in SQLite. Check-in and check-out use device location. |
| Invoicing and collections | Explore sales invoices, returns, and receipt vouchers. A sample sales invoice can be opened for PDF sharing or printing. Invoice creation currently simulates saving. |
| Requests and inventory | Explore sales and load requests, stock quantities, and stock counts. Audit submission currently simulates success. |

## Run locally

Use **Flutter 3.44.8**, pinned in [.fvmrc](.fvmrc), with the toolchain for your target platform. iOS targets **15.0 or later** and requires Xcode and CocoaPods. App startup was verified on an iPhone 17 simulator. Android runtime verification is pending.

Start a simulator or emulator, then run these commands from the repository root.

```sh
flutter --version
flutter pub get
flutter devices
flutter run
```

If you use FVM, run `fvm install` and use `fvm flutter` for the commands above. If more than one device is available, select it with `flutter run -d DEVICE_ID`.

On the first screen, tap **دخول النسخة التجريبية** to open the sales dashboard. To try visit check-in or check-out, enable location and grant the app permission. Set a simulated location if your simulator has no position.

## Code structure

| Path | Responsibility |
| --- | --- |
| [`lib/features/`](lib/features/) | Feature modules with screens, Cubit state, and data access. |
| [`lib/core/`](lib/core/) | Shared UI, routing, dependency registration, and platform services. |
| [`test/widget_test.dart`](test/widget_test.dart) | Widget smoke test for opening Jawlati and entering the dashboard. |

The app uses **Cubit** for UI state, **Freezed** for immutable models and states, and **GetIt** to register dependencies. The customer and visit repositories use **SQLite** for local storage. On first use, the visits repository imports existing visit records from SharedPreferences. Check-in and check-out use the device location service. **Dio** backs the API service classes. The default demo has no configured API endpoint.

## Checks

```sh
flutter analyze --no-pub
flutter test --no-pub
flutter test integration_test/customers_visits_test.dart -d DEVICE_ID
```

The widget smoke test covers the demo entry and dashboard. Storage tests cover duplicate check-in, failed writes, and migration. The device integration test uses a simulated location and verifies the customer-to-visit flow across a database reopen. Static analysis currently reports inherited warnings and lints.

## Demo walkthrough

Add a customer, start a visit from the dashboard, and reopen the app. The dashboard restores the active visit. End the visit and open **سجل الزيارات** to see the completed record.
