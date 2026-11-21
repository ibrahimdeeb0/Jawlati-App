import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/layout/my_app_bar.dart';
import '../../../core/widgets/forms/search_filter_bar.dart';
import '../../../core/widgets/buttons/gradient_button.dart';
import '../../../core/navigation/app_router_constants.dart';
import '../logic/inventory_cubit.dart';
import '../logic/inventory_state.dart';
import 'widgets/inventory_table.dart';

class InventoryQuantitiesScreen extends StatelessWidget {
  const InventoryQuantitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Load items when screen is first built
    context.read<InventoryCubit>().loadItems();

    return _buildScreen(context);
  }

  Widget _buildScreen(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(title: 'الكميات'),
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.all(16.r),
              child: TextFieldSearchBar(
                searchHint: 'البحث في المواد...',
                searchQuery: '',
                onSearchChanged: (value) {
                  context.read<InventoryCubit>().filterItems(value);
                },
              ),
            ),

            // Audit Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GradientButton(
                onPressed: () async {
                  Navigator.pushNamed(
                    context,
                    AppRouterConstants.inventoryAudit,
                  );
                },
                text: 'جرد المواد',
                icon: Icons.inventory_2_outlined,
              ),
            ),

            SizedBox(height: 16.h),

            // Items Table
            Expanded(
              child: BlocBuilder<InventoryCubit, InventoryState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: Text('ابدأ بتحميل البيانات')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (items) {
                      return items.isEmpty
                          ? const Center(child: Text('لا توجد مواد'))
                          : Padding(
                              padding: EdgeInsets.all(16.r),
                              child: InventoryTable(items: items),
                            );
                    },
                    submitting: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    submitted: (_) =>
                        const Center(child: Text('تم إرسال الجرد بنجاح')),
                    error: (message) => Center(
                      child: Text(
                        'خطأ: $message',
                        style: AppTextStyles.body14BlackMedium.copyWith(
                          color: AppColors.errorRed,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
