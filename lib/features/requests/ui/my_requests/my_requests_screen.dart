import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';

import '../../logic/requests_cubit/requests_cubit.dart';
import '../../logic/requests_cubit/requests_state.dart';
import '../widgets/requests_filter_bar.dart';
import '../widgets/request_card.dart';
import '../widgets/empty_requests_state.dart';
import '../widgets/add_request_fab.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppColors.backgroundSecondary,
            appBar: _buildAppBar(),
            body: Column(
              children: [
                _buildSearchField(context),
                _buildFilterBar(),
                Expanded(child: _buildRequestsList(context, state)),
              ],
            ),
            floatingActionButton:
                AddRequestFab(cubit: context.read<RequestsCubit>()),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return MyAppBar(
      title: 'طلباتي',
    );
  }

  Widget _buildSearchField(BuildContext context) {
    final cubit = context.read<RequestsCubit>();
    return Container(
      margin: EdgeInsets.all(16.r),
      child: TextFieldSearchBar(
        onSearchChanged: (query) => cubit.searchRequests(query),
        searchHint: 'البحث في الطلبات...',
        searchQuery: cubit.searchController.text,
      ),
    );
  }

  Widget _buildFilterBar() {
    return const RequestsFilterBar();
  }

  Widget _buildRequestsList(BuildContext context, RequestsState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      loaded: (
        requests,
        filteredRequests,
        selectedFilter,
        selectedStatus,
        searchQuery,
      ) {
        if (filteredRequests.isEmpty) {
          return EmptyRequestsState(
            searchQuery: searchQuery,
            onRefresh: () => context.read<RequestsCubit>().refreshData(),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => context.read<RequestsCubit>().refreshData(),
          child: ListView.builder(
            padding: EdgeInsets.all(16.r),
            itemCount: filteredRequests.length,
            itemBuilder: (context, index) {
              final request = filteredRequests[index];
              return RequestCard(
                request: request,
                onTap: () => _onRequestTap(context, request),
              );
            },
          ),
        );
      },
      error: (message) => _buildErrorState(message, context),
    );
  }

  Widget _buildErrorState(String message, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.r,
              color: AppColors.red,
            ),
            16.spacingVertical,
            Text(
              'حدث خطأ',
              style: AppTextStyles.heading20BlackBold,
            ),
            8.spacingVertical,
            Text(
              message,
              style: AppTextStyles.body16GrayMedium,
              textAlign: TextAlign.center,
            ),
            24.spacingVertical,
            LegacyGradientButton(
              onPressed: () => context.read<RequestsCubit>().retryLoading(),
              text: 'إعادة المحاولة',
            )
          ],
        ),
      ),
    );
  }

  void _onRequestTap(BuildContext context, dynamic request) {
    context.pushNamed(
      AppRouterConstants.requestDetails,
      arguments: request,
    );
  }
}
