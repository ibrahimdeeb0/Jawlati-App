import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/layout/company_header_card.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../logic/receipt_details_cubit/receipt_details_cubit.dart';
import '../../logic/receipt_details_cubit/receipt_details_state.dart';
import '../widgets/receipt_details_widgets/receipt_info_card.dart';
import '../widgets/receipt_details_widgets/receipt_client_info_card.dart';
import '../widgets/receipt_details_widgets/receipt_payment_details_card.dart';
import '../widgets/receipt_details_widgets/receipt_action_buttons.dart';

class ReceiptDetailsScreen extends StatelessWidget {
  final String receiptId;

  const ReceiptDetailsScreen({
    super.key,
    required this.receiptId,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ReceiptDetailsCubit>().loadReceiptDetails(receiptId);
    
    return BlocListener<ReceiptDetailsCubit, ReceiptDetailsState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                  style: AppTextStyles.body14DarkBlueRegular.copyWith(
                    color: AppColors.textInverse,
                  ),
                ),
                backgroundColor: AppColors.successGreen,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(16.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message,
                  style: AppTextStyles.body14DarkBlueRegular.copyWith(
                    color: AppColors.textInverse,
                  ),
                ),
                backgroundColor: AppColors.errorRed,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(16.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<ReceiptDetailsCubit, ReceiptDetailsState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: MyAppBar(
                title: 'تفاصيل سند القبض',
                subTitle: _getSubtitle(state),
                actions: [
                  IconButton(
                    onPressed: () => _printReceipt(context, state),
                    icon: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: AppColors.textInverse.colorWithOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.print_outlined,
                        color: AppColors.textInverse,
                        size: 20.r,
                      ),
                    ),
                  ),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () => context
                    .read<ReceiptDetailsCubit>()
                    .loadReceiptDetails(receiptId),
                child: _buildBody(context, state),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ReceiptDetailsState state) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (receipt) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              const CompanyHeaderCard(),
              16.spacingVertical,
              ReceiptInfoCard(receipt: receipt),
              16.spacingVertical,
              ReceiptClientInfoCard(receipt: receipt),
              16.spacingVertical,
              ReceiptPaymentDetailsCard(receipt: receipt),
              24.spacingVertical,
              ReceiptActionButtons(
                receipt: receipt,
                onPrint: () => _printReceipt(context, state),
                onEdit: () => _editReceipt(context, receipt.id),
                onDelete: () => _deleteReceipt(context, receipt.id),
              ),
              32.spacingVertical,
            ],
          ),
        );
      },
      success: (message) => _buildLoadedBody(context),
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.r,
              color: AppColors.errorRed,
            ),
            16.spacingVertical,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                color: AppColors.errorRed,
              ),
            ),
            16.spacingVertical,
            ElevatedButton(
              onPressed: () => context
                  .read<ReceiptDetailsCubit>()
                  .loadReceiptDetails(receiptId),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'إعادة المحاولة',
                style: AppTextStyles.button16WhiteSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedBody(BuildContext context) {
    return BlocBuilder<ReceiptDetailsCubit, ReceiptDetailsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (receipt) => _buildBody(context, state),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  String _getSubtitle(ReceiptDetailsState state) {
    return state.maybeWhen(
      loaded: (receipt) => 'رقم ${receipt.receiptNumber}',
      orElse: () => '',
    );
  }

  void _printReceipt(BuildContext context, ReceiptDetailsState state) {
    state.maybeWhen(
      loaded: (receipt) {
        context.read<ReceiptDetailsCubit>().printReceipt(receipt);
      },
      orElse: () {},
    );
  }

  void _editReceipt(BuildContext context, String receiptId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تعديل سند القبض...',
          style: AppTextStyles.body14DarkBlueRegular.copyWith(
            color: AppColors.textInverse,
          ),
        ),
        backgroundColor: AppColors.infoBlue,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  void _deleteReceipt(BuildContext context, String receiptId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد من حذف سند القبض؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<ReceiptDetailsCubit>().deleteReceipt(receiptId);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}