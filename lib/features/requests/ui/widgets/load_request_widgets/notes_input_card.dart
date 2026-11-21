import 'package:flutter/material.dart';
import 'package:jawlati/core/widgets/index.dart';

class NotesInputCard extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const NotesInputCard({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'ملاحظات (اختياري)',
      child: AppTextFormField(
        controller: controller,
        hintText: 'أضف أي ملاحظات لمدير المبيعات...',
        maxLines: 4,
        onChanged: onChanged,
      ),
    );
  }
}
