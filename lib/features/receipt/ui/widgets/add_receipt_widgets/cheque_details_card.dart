import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/widgets/cards/section_card.dart';
import 'package:jawlati/core/widgets/forms/app_text_form_field.dart';

class ChequeDetailsCard extends StatefulWidget {
  final String? chequeNumber;
  final String? bankName;
  final DateTime? maturityDate;
  final Function(String) onChequeNumberChanged;
  final Function(String) onBankNameChanged;
  final Function(DateTime) onMaturityDateChanged;

  const ChequeDetailsCard({
    super.key,
    this.chequeNumber,
    this.bankName,
    this.maturityDate,
    required this.onChequeNumberChanged,
    required this.onBankNameChanged,
    required this.onMaturityDateChanged,
  });

  @override
  State<ChequeDetailsCard> createState() => _ChequeDetailsCardState();
}

class _ChequeDetailsCardState extends State<ChequeDetailsCard> {
  final TextEditingController _chequeController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chequeController.text = widget.chequeNumber ?? '';
    _bankController.text = widget.bankName ?? '';
    if (widget.maturityDate != null) {
      _dateController.text = _formatDate(widget.maturityDate!);
    }
  }

  @override
  void dispose() {
    _chequeController.dispose();
    _bankController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'تفاصيل الشيك',
      child: Column(
        children: [
          AppTextFormField(
            controller: _chequeController,
            hintText: 'رقم الشيك',
            labelText: 'رقم الشيك',
            onChanged: widget.onChequeNumberChanged,
            keyboardType: TextInputType.number,
          ),
          16.verticalSpace,
          AppTextFormField(
            controller: _bankController,
            hintText: 'اسم البنك',
            labelText: 'اسم البنك',
            onChanged: widget.onBankNameChanged,
            keyboardType: TextInputType.text,
          ),
          16.verticalSpace,
          GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: AppTextFormField(
                controller: _dateController,
                hintText: 'تاريخ الاستحقاق',
                labelText: 'تاريخ الاستحقاق',
                suffixIcon: Icon(
                  Icons.calendar_today,
                  color: AppColors.mainBlue,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          widget.maturityDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('ar'),
    );

    if (picked != null && picked != widget.maturityDate) {
      setState(() {
        _dateController.text = _formatDate(picked);
      });
      widget.onMaturityDateChanged(picked);
    }
  }
}
