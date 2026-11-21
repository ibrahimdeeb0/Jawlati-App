import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import 'package:jawlati/core/widgets/index.dart';

import '../../data/models/client_model.dart';
import '../../logic/add_client_cubit/add_client_cubit.dart';
import '../../logic/add_client_cubit/add_client_state.dart';
import '../widgets/client_type_selector.dart';
import '../widgets/image_picker_card.dart';
import '../widgets/order_type_selector.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(title: 'إضافة عميل جديد'),
        body: BlocConsumer<AddClientCubit, AddClientState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (message, _) {
                AppDialog.showSuccessDialog(
                  context: context,
                  title: 'نجاح',
                  message: message,
                );
                Navigator.of(context).pop(true);
              },
              error: (message) {
                AppDialog.showErrorDialog(
                  context: context,
                  title: 'خطأ',
                  message: message,
                );
              },
            );
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return _ClientFormView();
          },
        ),
      ),
    );
  }
}

class _ClientFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddClientCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildClientForm(context),
            32.verticalSpace,
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildClientForm(BuildContext context) {
    final cubit = context.read<AddClientCubit>();

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('معلومات العميل', style: AppTextStyles.body16DarkBlueSemiBold),
            16.verticalSpace,
            BlocBuilder<AddClientCubit, AddClientState>(
              builder: (_, _) => ClientTypeSelector(
                selectedType: cubit.selectedClientType,
                onTypeChanged: cubit.updateClientType,
              ),
            ),
            16.verticalSpace,
            BlocBuilder<AddClientCubit, AddClientState>(
              builder: (context, state) {
                final availableOrderTypes =
                    cubit.selectedClientType == ClientType.individual
                    ? [OrderType.retail]
                    : [OrderType.retail, OrderType.wholesale, OrderType.mall];

                return OrderTypeSelector(
                  selectedOrderType: cubit.selectedOrderType,
                  availableOrderTypes: availableOrderTypes,
                  onOrderTypeChanged: cubit.updateOrderType,
                );
              },
            ),
            16.verticalSpace,
            AppTextFormField(
              controller: cubit.nameController,
              hintText: 'اسم العميل *',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يرجى إدخال اسم العميل';
                } else if (value.trim().length < 2) {
                  return 'يجب أن يكون الاسم مكونًا من حرفين على الأقل';
                }
                return null;
              },
            ),
            16.verticalSpace,
            AppTextFormField(
              controller: cubit.phoneController,
              hintText: 'رقم الهاتف *',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يرجى إدخال رقم الهاتف';
                } else if (value.trim().length < 8) {
                  return 'رقم الهاتف غير صحيح';
                }
                return null;
              },
            ),
            16.verticalSpace,
            AppTextFormField(
              controller: cubit.emailController,
              hintText: 'البريد الإلكتروني (اختياري)',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.trim().isNotEmpty) {
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'البريد الإلكتروني غير صحيح';
                  }
                }
                return null;
              },
            ),
            16.verticalSpace,
            AppTextFormField(
              controller: cubit.addressController,
              hintText: 'العنوان (اختياري)',
              maxLines: 2,
              validator: (p0) {},
            ),
            16.verticalSpace,
            if (cubit.selectedClientType == ClientType.company)
              Column(
                children: [
                  AppTextFormField(
                    controller: cubit.taxNumberController,
                    hintText: 'الرقم الضريبي (اختياري)',
                    keyboardType: TextInputType.number,
                    validator: (p0) {},
                  ),
                  16.verticalSpace,
                  AppTextFormField(
                    controller: cubit.managerNameController,
                    hintText: 'اسم المسؤول (اختياري)',
                    validator: (p0) {},
                  ),
                  16.verticalSpace,
                  BlocBuilder<AddClientCubit, AddClientState>(
                    builder: (context, state) => ImagePickerCard(
                      title: 'صورة السجل التجاري',
                      imagePath: cubit.commercialRegistryImagePath,
                      onImageSelected: cubit.updateCommercialRegistryImage,
                    ),
                  ),
                  16.verticalSpace,
                  BlocBuilder<AddClientCubit, AddClientState>(
                    builder: (context, state) => ImagePickerCard(
                      title: 'صورة الإقامة (المحل أو المول)',
                      imagePath: cubit.residenceImagePath,
                      onImageSelected: cubit.updateResidenceImage,
                    ),
                  ),
                  16.verticalSpace,
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocBuilder<AddClientCubit, AddClientState>(
      builder: (context, state) {
        final isLoading = state is Loading;

        return GradientButton(
          onPressed: isLoading
              ? null
              : () => context.read<AddClientCubit>().addClient(),
          text: isLoading ? 'جاري الإضافة...' : 'إضافة العميل',
          showLoadingOnPress: isLoading,
        );
      },
    );
  }
}
