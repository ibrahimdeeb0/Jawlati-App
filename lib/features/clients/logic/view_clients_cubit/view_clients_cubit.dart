import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/models/client_model.dart';
import '../../data/repo/client_repository.dart';
import 'view_clients_state.dart';

class ViewClientsCubit extends Cubit<ViewClientsState> {
  final ClientRepository _repository;
  final AppLogger _logger = AppLogger();

  ViewClientsCubit(this._repository) : super(const ViewClientsState.initial()) {
    loadClients();
  }

  List<Client> _allClients = [];

  Future<void> loadClients() async {
    emit(const ViewClientsState.loading());
    _logger.info('Loading clients...');

    try {
      _allClients = await _repository.getAllClients();

      emit(ViewClientsState.loaded(
        clients: _allClients,
        filteredClients: _allClients,
        searchQuery: null,
      ));

      _logger.info('Loaded ${_allClients.length} clients');
    } catch (e) {
      _logger.error('Failed to load clients: $e');
      emit(ViewClientsState.error(
          message: 'فشل في تحميل العملاء: ${e.toString()}'));
    }
  }

  Future<void> refreshClients() async {
    await loadClients();
  }

  void searchClients(String query) {
    if (state is! Loaded) {
      return;
    }

    if (query.isEmpty) {
      emit(ViewClientsState.loaded(
        clients: _allClients,
        filteredClients: _allClients,
        searchQuery: null,
      ));
      return;
    }

    final filteredClients = _allClients.where((client) {
      return client.name.toLowerCase().contains(query.toLowerCase()) ||
          client.phone.contains(query) ||
          (client.email?.toLowerCase().contains(query.toLowerCase()) ??
              false) ||
          (client.address?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();

    emit(ViewClientsState.loaded(
      clients: _allClients,
      filteredClients: filteredClients,
      searchQuery: query,
    ));

    _logger
        .info('Filtered ${filteredClients.length} clients for query: "$query"');
  }

  Future<void> deleteClient(String clientId) async {
    try {
      await _repository.deleteClient(clientId);

      // Remove from local list
      _allClients.removeWhere((client) => client.id == clientId);

      // Update state
      if (state is Loaded) {
        final currentState = state as Loaded;
        final updatedFilteredClients = currentState.filteredClients
            .where((client) => client.id != clientId)
            .toList();

        emit(ViewClientsState.loaded(
          clients: _allClients,
          filteredClients: updatedFilteredClients,
          searchQuery: currentState.searchQuery,
        ));
      }

      _logger.info('Deleted client with ID: $clientId');
    } catch (e) {
      _logger.error('Failed to delete client: $e');
      emit(ViewClientsState.error(
          message: 'فشل في حذف العميل: ${e.toString()}'));

      // Return to previous state after showing error
      Future.delayed(const Duration(seconds: 2), () {
        if (!isClosed) {
          loadClients();
        }
      });
    }
  }

  void filterByType(ClientType? type) {
    if (state is! Loaded) {
      return;
    }

    List<Client> filteredClients;

    if (type == null) {
      filteredClients = _allClients;
    } else {
      filteredClients =
          _allClients.where((client) => client.type == type).toList();
    }

    emit(ViewClientsState.loaded(
      clients: _allClients,
      filteredClients: filteredClients,
      searchQuery: null,
    ));

    _logger.info('Filtered ${filteredClients.length} clients by type: $type');
  }

  void sortClients(SortBy sortBy) {
    if (state is! Loaded) {
      return;
    }

    final currentState = state as Loaded;
    final sortedClients = List<Client>.from(currentState.filteredClients);

    switch (sortBy) {
      case SortBy.nameAsc:
        sortedClients.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortBy.nameDesc:
        sortedClients.sort((a, b) => b.name.compareTo(a.name));
        break;
      case SortBy.dateAsc:
        sortedClients.sort((a, b) => (a.createdAt ?? DateTime.now())
            .compareTo(b.createdAt ?? DateTime.now()));
        break;
      case SortBy.dateDesc:
        sortedClients.sort((a, b) => (b.createdAt ?? DateTime.now())
            .compareTo(a.createdAt ?? DateTime.now()));
        break;
    }

    emit(ViewClientsState.loaded(
      clients: _allClients,
      filteredClients: sortedClients,
      searchQuery: currentState.searchQuery,
    ));

    _logger.info('Sorted clients by: $sortBy');
  }
}

enum SortBy {
  nameAsc,
  nameDesc,
  dateAsc,
  dateDesc,
}
