import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';

import '../../data/models/client_visit_model.dart';
import '../../logic/visits_cubit.dart';
import '../check_in_screen.dart';
import 'visit_issue_message.dart';

class CheckInOutButton extends StatelessWidget {
  const CheckInOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<VisitsCubit>().state;
    final active = state.currentVisit != null;
    return IconButton.outlined(
      tooltip: active ? 'إدارة الزيارة النشطة' : 'بدء زيارة',
      onPressed: state.isReady && !state.isBusy
          ? () => openVisitAction(context, state.currentVisit)
          : null,
      icon: state.isBusy
          ? const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              active ? Icons.logout : Icons.location_on,
              size: 20.r,
              color: active ? AppColors.mainOrange : Colors.white,
            ),
      style: IconButton.styleFrom(
        side: BorderSide(
          color: active ? AppColors.mainOrange : AppColors.borderGray,
        ),
      ),
    );
  }
}

Future<void> openVisitAction(BuildContext context, ClientVisit? visit) async {
  if (visit == null) {
    await Navigator.of(
      context,
    ).push<void>(MaterialPageRoute(builder: (_) => const CheckInScreen()));
    return;
  }
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    builder: (_) => _ActiveVisitActions(visit: visit),
  );
}

class _ActiveVisitActions extends StatefulWidget {
  const _ActiveVisitActions({required this.visit});

  final ClientVisit visit;

  @override
  State<_ActiveVisitActions> createState() => _ActiveVisitActionsState();
}

class _ActiveVisitActionsState extends State<_ActiveVisitActions> {
  final _notes = TextEditingController();
  VisitIssue? _issue;

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  Future<void> _finish({required bool cancel}) async {
    final cubit = context.read<VisitsCubit>();
    if (cancel) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('إلغاء الزيارة'),
            content: const Text('هل تريد تسجيل الزيارة كملغاة؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('رجوع'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('تأكيد الإلغاء'),
              ),
            ],
          ),
        ),
      );
      if (!mounted || confirmed != true) return;
    }

    if (cubit.state.currentVisit?.id != widget.visit.id) {
      setState(() => _issue = VisitIssue.noActiveVisit);
      return;
    }
    setState(() => _issue = null);
    final notes = _notes.text.trim();
    final messenger = ScaffoldMessenger.of(context);
    final issue = cancel
        ? await cubit.cancelVisit()
        : await cubit.checkOut(notes: notes.isEmpty ? null : notes);
    if (!mounted) return;

    if (issue != null) {
      setState(() => _issue = issue);
      return;
    }
    Navigator.pop(context);
    messenger.showSnackBar(
      SnackBar(content: Text(cancel ? 'تم إلغاء الزيارة' : 'تم إنهاء الزيارة')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final busy = context.watch<VisitsCubit>().state.isBusy;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            20 + MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'زيارة ${widget.visit.clientName ?? 'العميل'}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _notes,
                enabled: !busy,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'ملاحظات الإنهاء (اختيارية)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              if (busy) const LinearProgressIndicator(),
              if (_issue case final issue?) ...[
                Text(
                  visitIssueMessage(issue),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                if (issue == VisitIssue.locationDeniedForever)
                  TextButton(
                    onPressed: openVisitSettings,
                    child: const Text('فتح الإعدادات'),
                  ),
              ],
              FilledButton(
                onPressed: busy ? null : () => _finish(cancel: false),
                child: const Text('إنهاء الزيارة'),
              ),
              TextButton(
                onPressed: busy ? null : () => _finish(cancel: true),
                child: const Text('إلغاء الزيارة'),
              ),
              TextButton(
                onPressed: busy ? null : () => Navigator.pop(context),
                child: const Text('رجوع'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
