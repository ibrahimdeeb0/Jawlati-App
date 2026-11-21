import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/navigation/app_navigator_observer.dart';
import 'package:jawlati/core/navigation/app_router.dart';
import 'package:jawlati/core/theme/theme_manager.dart';
import 'package:jawlati/features/visits/logic/visits_cubit.dart';

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    final navigatorObserver = getIt<AppNavigatorObserver>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<VisitsCubit>(
              create: (context) => getIt<VisitsCubit>()..initialize(),
            ),
          ],
          child: MaterialApp(
            title: 'جولتي',
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.lightTheme,
            darkTheme: ThemeManager.darkTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: initialRoute,
            navigatorObservers: [navigatorObserver],
          ),
        );
      },
    );
  }
}
