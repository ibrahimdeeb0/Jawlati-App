import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/theme/app_colors.dart';

import '../../logic/visits_cubit.dart';
import '../visit_history_screen.dart';
import 'check_in_out_button.dart';

class VisitStatusCard extends StatelessWidget {
  const VisitStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<VisitsCubit>();
    final state = cubit.state;
    final visit = state.currentVisit;
    final title = visit == null ? 'حالة الزيارة' : 'زيارة نشطة';
    final subtitle = switch ((state.loadFailed, state.isReady, visit)) {
      (true, _, _) => 'تعذر استعادة الزيارة. اضغط لإعادة المحاولة.',
      (false, false, _) => 'جاري تحميل الزيارة...',
      (false, true, null) => 'لا توجد زيارة نشطة • اضغط لبدء زيارة جديدة',
      (_, _, final active?) => active.clientName ?? 'العميل',
    };

    return Card(
      color: visit == null ? AppColors.lightBlue : AppColors.lightOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(
              visit == null ? Icons.add_location : Icons.location_on,
            ),
            title: Text(title),
            subtitle: Text(subtitle),
            onTap: state.loadFailed
                ? cubit.initialize
                : state.isReady && !state.isBusy
                ? () => openVisitAction(context, visit)
                : null,
          ),
          if (state.isBusy) const LinearProgressIndicator(),
          TextButton.icon(
            onPressed: state.isBusy
                ? null
                : () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (_) => const VisitHistoryScreen(),
                    ),
                  ),
            icon: const Icon(Icons.history),
            label: const Text('سجل الزيارات'),
          ),
        ],
      ),
    );
  }
}
