import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/toast_helper.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../logic/load_request_cubit/load_request_cubit.dart';
import '../../logic/load_request_cubit/load_request_state.dart';
import '../widgets/load_request_widgets/load_request_header_card.dart';
import '../widgets/load_request_widgets/load_request_items_table.dart';
import '../widgets/load_request_widgets/load_request_summary_card.dart';
import '../widgets/load_request_widgets/notes_input_card.dart';

class AddLoadRequestScreen extends StatelessWidget {
  const AddLoadRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadRequestCubit, LoadRequestState>(
      listener: (context, state) {
        state.whenOrNull(
          submissionSuccess: () {
            ToastHelper.showToast(
              message: 'تم إنشاء الطلب بنجاح',
              type: ToastType.success,
            );
            context.popWithResult(true);
          },
          submissionFailure: (error) {
            ToastHelper.showToast(
              message: 'فشل الحفظ: $error',
              type: ToastType.error,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _InitialView(),
          loading: () => _LoadingView(),
          error: (message) => _ErrorView(message: message),
          loaded: (
            date,
            requestItems,
            notes,
            filteredItems,
          ) =>
              _buildLoadedUI(context),
          submissionSuccess: () {
            final lastState = context.read<LoadRequestCubit>().state;
            if (lastState is Loaded) {
              return _buildLoadedUI(context);
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Directionality _buildLoadedUI(BuildContext context) {
    final cubit = context.read<LoadRequestCubit>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(title: 'طلب تحميل جديد'),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    const LoadRequestHeaderCard(),
                    16.spacingVertical,
                    NotesInputCard(
                      controller: cubit.notesController,
                      onChanged: (notes) {
                        cubit.updateNotes(notes);
                      },
                    ),
                    16.spacingVertical,
                    const LoadRequestItemsTable(),
                  ],
                ),
              ),
            ),
            const LoadRequestSummaryCard(),
          ],
        ),
      ),
    );
  }
}

class _InitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب تحميل جديد',
        ),
        body: Center(
          child: Text(
            'جاري التحضير...',
            style: AppTextStyles.body16GrayMedium,
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب تحميل جديد',
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: MyAppBar(
          title: 'طلب مبيعات جديد',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64.r,
                color: AppColors.red,
              ),
              16.spacingVertical,
              Text(
                'حدث خطأ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.red,
                    ),
              ),
              8.spacingVertical,
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.body16GrayMedium,
              ),
              16.spacingVertical,
              LegacyGradientButton(
                onPressed: () => context.read<LoadRequestCubit>().refreshData(),
                text: 'إعادة المحاولة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
