import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/models/request_enums.dart';
import '../../data/repo/requests_repository.dart';
import '../../data/models/load_request/load_request.dart';
import '../../data/models/sales_request/sales_request.dart';
import 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  final RequestsRepository _repository;

  RequestsCubit(this._repository) : super(const RequestsState.initial()) {
    _initialize();
  }

  final AppLogger _logger = AppLogger();

  // بيانات الطلبات (Local State)
  List<dynamic> _allRequests = [];
  RequestType? _selectedFilter;
  RequestStatus? _selectedStatus;
  String _searchQuery = '';

  // Controllers
  final TextEditingController searchController = TextEditingController();

  Future<void> _initialize() async {
    await _loadInitialData();
  }

  // تحميل البيانات الأولية من الـ Repository
  Future<void> _loadInitialData() async {
    try {
      emit(const RequestsState.loading());
      _logger.info('Loading all requests...');

      final requests = await _repository.getAllRequests();
      _allRequests = requests;

      _logger.info('Loaded ${_allRequests.length} requests');

      // إصدار الحالة المحملة
      _emitLoadedState();
    } catch (e) {
      _logger.error('Failed to load requests: $e');
      emit(RequestsState.error('فشل في تحميل الطلبات: ${e.toString()}'));
    }
  }

  // إعادة تحميل البيانات
  Future<void> refreshData() async {
    _logger.debug('-->> start refreshData');
    await _loadInitialData();
  }

  void _emitLoadedState({List<dynamic>? filteredRequests}) {
    filteredRequests ??= _getFilteredRequests();

    emit(
      RequestsState.loaded(
        requests: List.from(_allRequests),
        filteredRequests: filteredRequests,
        selectedFilter: _selectedFilter,
        selectedStatus: _selectedStatus,
        searchQuery: _searchQuery,
      ),
    );
  }

  // فلترة الطلبات حسب النوع
  void filterByType(RequestType? type) {
    _selectedFilter = type;
    _selectedStatus = null; // إعادة تعيين فلتر الحالة
    _searchQuery = '';
    searchController.clear();

    _emitLoadedState();
    _logger.info('Filtered by type: ${type?.value ?? 'all'}');
  }

  // فلترة الطلبات حسب الحالة
  void filterByStatus(RequestStatus? status) {
    _selectedStatus = status;
    _selectedFilter = null; // إعادة تعيين فلتر النوع
    _searchQuery = '';
    searchController.clear();

    _emitLoadedState();
    _logger.info('Filtered by status: ${status?.value ?? 'all'}');
  }

  // البحث في الطلبات
  void searchRequests(String query) {
    _searchQuery = query;
    _selectedFilter = null;
    _selectedStatus = null;

    _emitLoadedState();
    _logger.info('Searching requests with query: "$query"');
  }

  // مسح جميع المرشحات
  void clearFilters() {
    _selectedFilter = null;
    _selectedStatus = null;
    _searchQuery = '';
    searchController.clear();

    _emitLoadedState();
    _logger.info('All filters cleared');
  }

  // الحصول على الطلبات المفلترة
  List<dynamic> _getFilteredRequests() {
    List<dynamic> filtered = List.from(_allRequests);

    // تطبيق فلتر النوع
    if (_selectedFilter != null) {
      filtered = filtered.where((request) {
        if (_selectedFilter == RequestType.load) {
          return request is LoadRequest;
        } else {
          return request is SalesRequest;
        }
      }).toList();
    }

    // تطبيق فلتر الحالة
    if (_selectedStatus != null) {
      filtered = filtered.where((request) {
        if (request is LoadRequest) {
          return request.status == _selectedStatus;
        } else if (request is SalesRequest) {
          return request.status == _selectedStatus;
        }
        return false;
      }).toList();
    }

    // تطبيق البحث
    if (_searchQuery.isNotEmpty) {
      final searchTerm = _searchQuery.toLowerCase();
      filtered = filtered.where((request) {
        if (request is LoadRequest) {
          return request.requestNumber.toLowerCase().contains(searchTerm) ||
              request.notes.toLowerCase().contains(searchTerm);
        } else if (request is SalesRequest) {
          return request.requestNumber.toLowerCase().contains(searchTerm) ||
              request.client.name.toLowerCase().contains(searchTerm) ||
              request.notes.toLowerCase().contains(searchTerm);
        }
        return false;
      }).toList();
    }

    return filtered;
  }

  // الحصول على عدد الطلبات حسب النوع
  int getRequestsCountByType(RequestType type) {
    return _allRequests.where((request) {
      if (type == RequestType.load) {
        return request is LoadRequest;
      } else {
        return request is SalesRequest;
      }
    }).length;
  }

  // الحصول على عدد الطلبات حسب الحالة
  int getRequestsCountByStatus(RequestStatus status) {
    return _allRequests.where((request) {
      if (request is LoadRequest) {
        return request.status == status;
      } else if (request is SalesRequest) {
        return request.status == status;
      }
      return false;
    }).length;
  }

  // إعادة تحميل البيانات مع معالجة الأخطاء
  Future<void> retryLoading() async {
    await _loadInitialData();
  }

  // معلومات إضافية للـ debugging
  bool get isDataLoaded => _allRequests.isNotEmpty;
  int get totalRequestsCount => _allRequests.length;
  int get loadRequestsCount => getRequestsCountByType(RequestType.load);
  int get salesRequestsCount => getRequestsCountByType(RequestType.sales);
  int get pendingRequestsCount =>
      getRequestsCountByStatus(RequestStatus.pending);
  int get approvedRequestsCount =>
      getRequestsCountByStatus(RequestStatus.approved);

  // Helper methods for UI
  bool get hasActiveFilters =>
      _selectedFilter != null ||
      _selectedStatus != null ||
      _searchQuery.isNotEmpty;
  String get activeFiltersDescription {
    final filters = <String>[];
    if (_selectedFilter != null) {
      final typeNames = {
        RequestType.load: 'طلبات التحميل',
        RequestType.sales: 'طلبات المبيعات',
      };
      filters.add(typeNames[_selectedFilter]!);
    }
    if (_selectedStatus != null) {
      filters.add(_selectedStatus!.displayName);
    }
    if (_searchQuery.isNotEmpty) {
      filters.add('البحث: "$_searchQuery"');
    }
    return filters.join(' • ');
  }

  @override
  Future<void> close() {
    _logger.info('RequestsCubit closed');
    searchController.dispose();
    return super.close();
  }
}
