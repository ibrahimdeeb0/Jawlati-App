import 'package:dio/dio.dart';

abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiServiceImpl;
}

class _HomeApiServiceImpl implements HomeApiService {
  final Dio dio;

  _HomeApiServiceImpl(this.dio);
}
