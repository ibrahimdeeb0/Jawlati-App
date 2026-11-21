import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';

import 'widgets/dashboard_grid.dart';
import 'widgets/gradient_app_bar.dart';
import 'widgets/home_header_sliver_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: GradientAppBar(
          title: 'جولتي',
          actions: [
            IconButton.outlined(
              onPressed: () {},
              color: AppColors.backgroundPrimary,
              icon: Icon(Icons.notifications_outlined, size: 20.r),
              style: IconButton.styleFrom(
                side: BorderSide(color: AppColors.borderGray, width: 1),
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            HomeHeaderSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [12.verticalSpace, DashboardGrid(), 12.verticalSpace],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
