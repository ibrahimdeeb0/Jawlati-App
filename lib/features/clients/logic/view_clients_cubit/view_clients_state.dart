import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/client_model.dart';

part 'view_clients_state.freezed.dart';

@freezed
class ViewClientsState with _$ViewClientsState {
  const factory ViewClientsState.initial() = _Initial;
  const factory ViewClientsState.loading() = Loading;
  const factory ViewClientsState.loaded({
    required List<Client> clients,
    required List<Client> filteredClients,
    String? searchQuery,
  }) = Loaded;
  const factory ViewClientsState.error({
    required String message,
  }) = Error;
}