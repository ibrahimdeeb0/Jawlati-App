import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/date_time_helper.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setup Dependencies
  await setupGetIt();

  // initialize date formatting
  await DateTimeHelper.initialize();

  // Ensure flutter_screenutil works correctly in release mode.
  await ScreenUtil.ensureScreenSize();

  // Check login status
  String initialRoute = await getInitialRoute();

  runApp(
    MyApp(initialRoute: initialRoute),
  );
}

Future<String> getInitialRoute() async {
  // String? userToken =
  //     await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  // Return the initial route based on login status
  // return !(userToken.isNullOrEmpty()) ? SizedBox() : SizedBox();
  // return '/$userToken';
  return AppRouterConstants.loginRouter;
}
