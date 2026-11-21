import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/auth_response.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  ///? .small-Latter this is will used in Cubit
  ///? capital-Latter this is will used in UI (refer it in buildWhen, ListenWhen)
  const factory LoginState.initial() = _Initial;

  // * Login
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(AuthResponseModel loginResponse) =
      LoginSuccess;
  const factory LoginState.loginError(ApiErrorModel apiErrorModel) = LoginError;
}
