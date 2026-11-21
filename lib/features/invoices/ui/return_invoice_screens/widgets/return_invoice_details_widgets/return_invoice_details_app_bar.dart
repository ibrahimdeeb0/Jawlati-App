import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class ReturnInvoiceDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subTitle;
  final List<Widget>? actions;

  const ReturnInvoiceDetailsAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainBlue,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.textInverse,
          size: 20.r,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.heading20whiteBold,
          ),
          if (subTitle.isNotEmpty)
            Text(
              subTitle,
              style: AppTextStyles.body14DarkBlueRegular.copyWith(
                color: AppColors.textInverse.colorWithOpacity(0.8),
              ),
            ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
