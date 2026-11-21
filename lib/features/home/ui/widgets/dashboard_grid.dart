import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/widgets/cards/gradient_icon_button_card.dart';
import 'package:jawlati/features/visits/ui/widgets/visit_status_card.dart';

import '../../logic/dashboard_item.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return _buildResponsiveLayout(context, constraints);
        },
      ),
    );
  }

  Widget _buildResponsiveLayout(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    // Calculate optimal item width and cross axis count based on screen width
    final screenWidth = constraints.maxWidth;
    final minItemWidth = 100.w; // Minimum width for each card
    final maxItemWidth = 140.w; // Maximum width for each card
    final spacing = 16.w;

    // Calculate how many items can fit
    int crossAxisCount = _calculateCrossAxisCount(
      screenWidth,
      minItemWidth,
      spacing,
    );

    // Calculate actual item width
    double itemWidth =
        (screenWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

    // Ensure item width is within bounds
    itemWidth = itemWidth.clamp(minItemWidth, maxItemWidth);

    return _buildWrapLayout(context, itemWidth);
  }

  int _calculateCrossAxisCount(
    double screenWidth,
    double minItemWidth,
    double spacing,
  ) {
    // Start with maximum possible items and work down
    for (int count = 4; count >= 2; count--) {
      double totalSpacing = spacing * (count - 1);
      double availableWidth = screenWidth - totalSpacing;
      double itemWidth = availableWidth / count;

      if (itemWidth >= minItemWidth) {
        return count;
      }
    }
    return 2; // Minimum 2 columns
  }

  Widget _buildWrapLayout(BuildContext context, double itemWidth) {
    return Column(
      children: [
        // بطاقة حالة الزيارة
        VisitStatusCard(),
        
        SizedBox(height: 16.h),
        
        // بقية عناصر الـ Dashboard
        Wrap(
          spacing: 16.w,
          runSpacing: 16.h,
          alignment: WrapAlignment.start,
          children: dashboardItems.map((item) {
            return SizedBox(
              width: itemWidth,
              child: AspectRatio(
                aspectRatio: 0.8, // Consistent aspect ratio
                child: GradientIconButtonCard(
                  icon: item.icon,
                  label: item.label,
                  onPressed: () => item.onPressed(context),
                  gradientColors: item.gradientColors,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
