import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../logic/sales_request_cubit/sales_request_cubit.dart';
import '../../../logic/sales_request_cubit/sales_request_state.dart';

class SalesRequestHeaderCard extends StatelessWidget {
  const SalesRequestHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'معلومات الطلب',
      child: BlocBuilder<SalesRequestCubit, SalesRequestState>(
        builder: (context, state) {
          return Column(
            children: [
              InfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'التاريخ',
                value: DateTimeHelper.formatShortDate(DateTime.now()),
              ),
              InfoRow(
                icon: Icons.access_time_outlined,
                label: 'الوقت',
                value: DateTimeHelper.formatTime(DateTime.now()),
              ),
              InfoRow(
                icon: Icons.receipt_long_outlined,
                label: 'نوع الطلب',
                value: 'طلب مبيعات',
              ),
            ],
          );
        },
      ),
    );
  }
}
