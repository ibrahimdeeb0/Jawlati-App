import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final List<Widget>? actions;
  final Widget? leading;

  const MyAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBlue, AppColors.mainBlue],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.buttonPrimary,
        ),
        titleSpacing: 0,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.heading20whiteBold,
            ),
            if (subTitle?.isNotEmpty == true)
              Text(
                subTitle!,
                style: AppTextStyles.caption12GrayMedium.copyWith(
                  color: AppColors.lightGray.colorWithOpacity(0.9),
                ),
              ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: actions,
        leading: leading,
        centerTitle: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
