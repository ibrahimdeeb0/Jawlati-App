import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';

import '../data/models/client_visit_model.dart';
import '../logic/visits_cubit.dart';

class VisitHistoryScreen extends StatefulWidget {
  const VisitHistoryScreen({super.key});

  @override
  State<VisitHistoryScreen> createState() => _VisitHistoryScreenState();
}

class _VisitHistoryScreenState extends State<VisitHistoryScreen> {
  late Future<List<ClientVisit>> _visits;

  @override
  void initState() {
    super.initState();
    _visits = context.read<VisitsCubit>().getAllVisits();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('سجل الزيارات')),
        body: FutureBuilder<List<ClientVisit>>(
          future: _visits,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: TextButton(
                  onPressed: () => setState(() {
                    _visits = context.read<VisitsCubit>().getAllVisits();
                  }),
                  child: const Text('تعذر تحميل سجل الزيارات. أعد المحاولة'),
                ),
              );
            }

            final visits = snapshot.requireData;
            if (visits.isEmpty) {
              return const Center(child: Text('لا توجد زيارات مسجلة'));
            }
            return ListView.builder(
              itemCount: visits.length,
              itemBuilder: (context, index) {
                final visit = visits[index];
                final started = DateTimeHelper.formatInvoiceDate(
                  visit.checkInTime.toLocal(),
                );
                final ended = visit.checkOutTime?.toLocal();
                return ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: Text(visit.clientName ?? 'العميل'),
                  subtitle: Text(
                    [
                      visit.statusText,
                      'البدء $started',
                      if (ended != null)
                        'الإنهاء ${DateTimeHelper.formatInvoiceDate(ended)}',
                    ].join('\n'),
                  ),
                  isThreeLine: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
