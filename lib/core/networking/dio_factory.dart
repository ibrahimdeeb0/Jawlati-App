import 'package:dio/dio.dart';

// import '../constants/shared_pref_keys.dart';
// import '../helpers/shared_pref_helper.dart';

class DioFactory {
  /// Private constructor to prevent direct instantiation
  DioFactory._();

  static Dio? _dio;

  static Dio getDio(String baseUrl) {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
        ),
      );

      _addDioHeaders();
    }

    return _dio!;
  }

  static void _addDioHeaders() async {
    _dio?.options.headers = {
      'Accept': 'application/json',
      // 'Authorization':
      //     'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
    };
  }

  /// Update headers dynamically after login
  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }
}
