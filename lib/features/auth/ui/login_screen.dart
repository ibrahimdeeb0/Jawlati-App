import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';
import 'package:jawlati/core/theme/app_colors.dart';

import '../../../core/widgets/buttons/gradient_button.dart';
import 'widgets/login_info_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  24.spacingVertical,
                  LoginHeaderInfo(),
                  22.spacingVertical,
                  Container(
                    padding: EdgeInsets.fromLTRB(14.w, 22.h, 14.w, 28.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.backgroundPrimary,
                    ),
                    child: Column(
                      children: [
                        GradientButton(
                          onPressed: () {
                            return context.pushReplacementNamed(
                              AppRouterConstants.homeRouter,
                            );
                          },
                          text: 'دخول النسخة التجريبية',
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
