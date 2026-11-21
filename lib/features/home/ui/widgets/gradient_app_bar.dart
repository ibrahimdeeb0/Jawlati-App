import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/assets/images/app_images.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import '../../../visits/ui/widgets/check_in_out_button.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const GradientAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(12.r),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBlue, AppColors.mainBlue],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.backgroundSecondary,
              child: Image.asset(AppImages.appLogo),
            ),
            10.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.heading20whiteBold,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CheckInOutButton(),
          ...(actions ?? []),
        ],
        centerTitle: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}
