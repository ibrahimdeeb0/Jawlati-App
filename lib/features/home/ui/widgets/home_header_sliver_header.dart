import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jawlati/core/assets/icons/app_icons.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class HomeHeaderSliverAppBar extends StatelessWidget {
  const HomeHeaderSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 110.h,
      floating: false,
      pinned: false,
      elevation: 0,
      backgroundColor: AppColors.backgroundSecondary,
      actionsPadding: EdgeInsets.zero,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.darkBlue, AppColors.mainBlue],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(AppIcons.stars),
                    ),
                    8.spacingHorizontal,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'نهارك سعيد',
                          style: AppTextStyles.heading20whiteBold,
                        ),
                        Text(
                          'ابراهيم',
                          style: AppTextStyles.heading20whiteBold,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'الاثنين، 21 Jul',
                      style: AppTextStyles.caption13lightBlueMedium,
                    ),
                    Text(
                      ' . ',
                      style: AppTextStyles.caption13lightBlueMedium.copyWith(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'مندوب مبيعات',
                      style: AppTextStyles.caption13lightBlueMedium,
                    ),
                  ],
                ),
                8.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
