import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/features/home/ui/home_screen.dart';
import 'package:jawlati/features/visits/data/models/client_visit_model.dart';
import 'package:jawlati/features/visits/data/repo/visits_repository.dart';
import 'package:jawlati/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _EmptyVisits implements VisitsRepository {
  @override
  Future<ClientVisit?> getCurrentVisit() async => null;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final font = FontLoader('Tajawal')
      ..addFont(rootBundle.load('assets/fonts/tajawal/Tajawal-Regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/tajawal/Tajawal-Medium.ttf'))
      ..addFont(rootBundle.load('assets/fonts/tajawal/Tajawal-Bold.ttf'))
      ..addFont(rootBundle.load('assets/fonts/tajawal/Tajawal-ExtraBold.ttf'));
    await font.load();
  });

  testWidgets('opens Jawlati and enters the demo dashboard', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(getIt.reset);

    SharedPreferences.setMockInitialValues({});
    await setupGetIt();
    await getIt.unregister<VisitsRepository>();
    getIt.registerSingleton<VisitsRepository>(_EmptyVisits());
    await DateTimeHelper.initialize();
    await tester.pumpWidget(
      const MyApp(initialRoute: AppRouterConstants.loginRouter),
    );

    expect(find.text('جولتي'), findsOneWidget);
    await tester.tap(find.text('دخول النسخة التجريبية'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('جولتي'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
