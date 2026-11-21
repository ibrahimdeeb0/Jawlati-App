import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../logic/load_request_cubit/load_request_cubit.dart';
import '../../../logic/load_request_cubit/load_request_state.dart';

class LoadRequestHeaderCard extends StatelessWidget {
  const LoadRequestHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'معلومات الطلب',
      child: BlocBuilder<LoadRequestCubit, LoadRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (date, notes, items, totalItems) {
              return Column(
                children: [
                  InfoRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'التاريخ',
                    value: DateTimeHelper.formatShortDate(date),
                  ),
                  InfoRow(
                    icon: Icons.access_time_outlined,
                    label: 'الوقت',
                    value: DateTimeHelper.formatTime(date),
                  ),
                  InfoRow(
                    icon: Icons.local_shipping_outlined,
                    label: 'نوع الطلب',
                    value: 'طلب تحميل',
                  ),
                ],
              );
            },
            error: (message) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
