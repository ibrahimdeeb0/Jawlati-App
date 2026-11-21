import 'package:flutter/material.dart';
import 'package:jawlati/core/widgets/cards/section_card.dart';
import 'package:jawlati/core/widgets/forms/app_text_form_field.dart';

class NotesInputCard extends StatefulWidget {
  final String notes;
  final Function(String) onNotesChanged;

  const NotesInputCard({
    super.key,
    required this.notes,
    required this.onNotesChanged,
  });

  @override
  State<NotesInputCard> createState() => _NotesInputCardState();
}

class _NotesInputCardState extends State<NotesInputCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.notes;
  }

  @override
  void didUpdateWidget(NotesInputCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.notes != oldWidget.notes) {
      _controller.text = widget.notes;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'ملاحظات',
      child: AppTextFormField(
        controller: _controller,
        hintText: 'إضافة ملاحظات (اختياري)',
        labelText: 'ملاحظات',
        onChanged: widget.onNotesChanged,
        maxLines: 3,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}