import 'package:flutter/material.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/services/location_service.dart';

import '../../logic/visits_cubit.dart';

String visitIssueMessage(VisitIssue issue) => switch (issue) {
  VisitIssue.locationDisabled => 'فعّل خدمة الموقع ثم أعد المحاولة.',
  VisitIssue.locationDenied => 'اسمح بالوصول إلى الموقع ثم أعد المحاولة.',
  VisitIssue.locationDeniedForever =>
    'اسمح بالوصول إلى الموقع من إعدادات التطبيق.',
  VisitIssue.locationTimedOut => 'انتهت مهلة تحديد الموقع. حاول مرة أخرى.',
  VisitIssue.alreadyActive => 'أنهِ الزيارة النشطة قبل بدء زيارة جديدة.',
  VisitIssue.noActiveVisit => 'لم تعد هذه الزيارة نشطة.',
  VisitIssue.clientNotFound => 'العميل غير متاح. اختر عميلًا آخر.',
  VisitIssue.busy => 'هناك عملية جارية. حاول مرة أخرى بعد اكتمالها.',
  VisitIssue.unexpected => 'تعذر حفظ الزيارة. أعد المحاولة.',
};

void showVisitIssue(BuildContext context, VisitIssue issue) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(visitIssueMessage(issue)),
      action: issue == VisitIssue.locationDeniedForever
          ? SnackBarAction(label: 'فتح الإعدادات', onPressed: openVisitSettings)
          : null,
    ),
  );
}

void openVisitSettings() => getIt<LocationService>().openAppSettings();
