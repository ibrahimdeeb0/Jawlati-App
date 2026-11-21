import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/layout/my_app_bar.dart';
import '../../../core/widgets/forms/search_filter_bar.dart';
import '../../../core/widgets/buttons/gradient_button.dart';
import '../logic/inventory_cubit.dart';
import '../logic/inventory_state.dart';
import '../data/models/inventory_item.dart';
import 'widgets/audit_table.dart';
import 'widgets/quantity_input_sheet.dart';

class InventoryAuditScreen extends StatelessWidget {
  const InventoryAuditScreen({super.key});

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
        appBar: MyAppBar(title: 'جرد المواد'),
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
                              child: AuditTable(
                                items: items,
                                onItemTap: (item) =>
                                    _showQuantityInputSheet(context, item),
                              ),
                            );
                    },
                    submitting: (items) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        SizedBox(height: 16.h),
                        Text(
                          'جاري إرسال الجرد...',
                          style: AppTextStyles.body16DarkBlueSemiBold,
                        ),
                      ],
                    ),
                    submitted: (_) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 64.r,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'تم إرسال الجرد بنجاح',
                          style: AppTextStyles.body16DarkBlueSemiBold,
                        ),
                        SizedBox(height: 16.h),
                        GradientButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'العودة',
                        ),
                      ],
                    ),
                    error: (message) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'خطأ: $message',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 16.h),
                          GradientButton(
                            onPressed: () async {
                              context.read<InventoryCubit>().loadItems();
                            },
                            text: 'إعادة المحاولة',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<InventoryCubit, InventoryState>(
          builder: (context, state) {
            final canSubmit = context.read<InventoryCubit>().canSubmitAudit;

            return Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.backgroundPrimary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.colorWithOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: GradientButton(
                  onPressed: canSubmit
                      ? () async {
                          _submitAudit(context);
                        }
                      : () async {},
                  text: 'حفظ وإرسال الجرد',
                  icon: Icons.save,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showQuantityInputSheet(BuildContext context, InventoryItem item) {
    final cubit = context.read<InventoryCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuantityInputSheet(
        item: item,
        onQuantityChanged: (quantity) {
          cubit.updateItemAuditQuantity(item.id, quantity);
        },
      ),
    );
  }

  void _submitAudit(BuildContext context) {
    context.read<InventoryCubit>().submitAudit();
  }
}
