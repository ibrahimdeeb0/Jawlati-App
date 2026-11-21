import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/client_model.dart';

part 'add_client_state.freezed.dart';

@freezed
class AddClientState with _$AddClientState {
  const factory AddClientState.initial() = _Initial;
  const factory AddClientState.loading() = Loading;
  const factory AddClientState.success({
    required String message,
    required ClientType selectedClientType,
  }) = Success;
  const factory AddClientState.error({
    required String message,
  }) = Error;
}
