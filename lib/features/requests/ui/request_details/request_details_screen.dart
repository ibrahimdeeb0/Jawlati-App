import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../data/models/request_enums.dart';
import '../../data/models/load_request/load_request.dart';
import '../../data/models/sales_request/sales_request.dart';
import '../widgets/request_details_widgets/request_header_card.dart';
import '../widgets/request_details_widgets/request_items_section.dart';
import '../widgets/request_details_widgets/request_status_timeline.dart';
import '../widgets/request_details_widgets/request_summary_section.dart';

class RequestDetailsScreen extends StatelessWidget {
  final dynamic request;

  const RequestDetailsScreen({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                RequestHeaderCard(request: request),
                16.spacingVertical,
                _buildStatusSection(),
                16.spacingVertical,
                RequestItemsSection(request: request),
                if (_showSummary()) ...[
                  16.spacingVertical,
                  RequestSummarySection(request: request),
                ],
                24.spacingVertical,
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final isLoadRequest = request is LoadRequest;
    final title = isLoadRequest ? 'تفاصيل طلب التحميل' : 'تفاصيل طلب المبيعات';

    return MyAppBar(
      title: title,
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () => _shareRequest(),
        ),
      ],
    );
  }

  Widget _buildStatusSection() {
    return RequestStatusTimeline(request: request);
  }

  // Helper methods
  // ignore: unused_element
  RequestStatus _getRequestStatus() {
    if (request is LoadRequest) {
      return (request as LoadRequest).status;
    } else if (request is SalesRequest) {
      return (request as SalesRequest).status;
    }
    return RequestStatus.pending;
  }

  bool _showSummary() {
    return request is SalesRequest;
  }

  // Action methods
  void _shareRequest() {
    // مشاركة تفاصيل الطلب
  }
}
