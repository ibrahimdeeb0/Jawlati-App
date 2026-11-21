import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jawlati/core/networking/api_error_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  // * Login
  const factory HomeState.loginLoading() = HomeLoading;
  const factory HomeState.loginSuccess() = HomeSuccess;
  const factory HomeState.loginError(ApiErrorModel apiErrorModel) = HomeError;
}
