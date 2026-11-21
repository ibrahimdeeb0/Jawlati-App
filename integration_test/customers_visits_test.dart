import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/services/location_service.dart';
import 'package:jawlati/core/storage/field_database.dart';
import 'package:jawlati/my_app.dart';
import 'package:jawlati/features/clients/ui/widgets/client_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test/support/test_location.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('adds a customer, restores the visit and completes it', (
    tester,
  ) async {
    final directory = await Directory.systemTemp.createTemp(
      'jawlati-integration-',
    );
    final dbPath = '${directory.path}/field.db';
    final location = TestLocation();
    SharedPreferences.setMockInitialValues({});
    await DateTimeHelper.initialize();

    addTearDown(() async {
      await tester.pumpWidget(const SizedBox.shrink());
      await getIt.reset();
      await directory.delete(recursive: true);
    });

    Future<void> enterDemo() async {
      await setupGetIt();
      await getIt.unregister<FieldDatabase>();
      getIt.registerSingleton(
        FieldDatabase(path: dbPath),
        dispose: (db) => db.close(),
      );
      await getIt.unregister<LocationService>();
      getIt.registerSingleton<LocationService>(location);
      await tester.pumpWidget(
        const MyApp(initialRoute: AppRouterConstants.loginRouter),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('دخول النسخة التجريبية'));
      await tester.pumpAndSettle();
    }

    Future<void> tapText(String label) async {
      final target = find.text(label).last;
      if (target.hitTestable().evaluate().isEmpty) {
        await Scrollable.ensureVisible(tester.element(target), alignment: 0.5);
        await tester.pumpAndSettle();
      }
      await tester.tap(target);
      await tester.pumpAndSettle();
    }

    const customer = 'عميل رحلة الاختبار';
    await enterDemo();
    await tapText('إضافة عميل');
    final form = find.byType(EditableText);
    await tester.enterText(form.at(0), customer);
    await tester.enterText(form.at(1), '0590000000');
    await tapText('إضافة العميل');

    await tapText('عرض العملاء');
    await tester.enterText(find.byType(EditableText), customer);
    await tester.pumpAndSettle();
    expect(find.widgetWithText(ClientCard, customer), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tapText('حالة الزيارة');
    await tapText('اختر عميل للزيارة');
    final pickerField = find.widgetWithText(TextField, 'ابحث عن عميل...');
    await tester.enterText(pickerField, customer);
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, customer));
    await tester.pumpAndSettle();
    await tapText('بدء الزيارة');
    expect(find.text('زيارة نشطة'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await getIt.reset();

    await enterDemo();
    expect(find.text('زيارة نشطة'), findsOneWidget);
    expect(find.text(customer), findsOneWidget);
    await tapText('زيارة نشطة');
    await tester.enterText(find.byType(EditableText), 'ملاحظات الزيارة');
    location.issue = LocationFailure.timedOut;
    await tapText('إنهاء الزيارة');
    expect(
      find.text('انتهت مهلة تحديد الموقع. حاول مرة أخرى.'),
      findsOneWidget,
    );
    expect(find.text('ملاحظات الزيارة'), findsOneWidget);

    location.issue = null;
    await tapText('إنهاء الزيارة');
    await tapText('سجل الزيارات');
    expect(find.text(customer), findsOneWidget);
    expect(find.textContaining('انتهت الزيارة'), findsOneWidget);
  });
}
