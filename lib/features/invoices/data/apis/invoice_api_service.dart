import 'package:dio/dio.dart';
import 'package:jawlati/core/models/customer_model.dart';
import 'package:jawlati/core/networking/api_constants.dart';
import 'package:jawlati/features/invoices/data/apis/invoice_api_constants.dart';

abstract class InvoiceApiService {
  factory InvoiceApiService(Dio dio) = _InvoiceApiServiceImpl;

  Future<List<CustomerModel>> getCustomers({
    required String userName,
    required String userId,
  });
}

class _InvoiceApiServiceImpl implements InvoiceApiService {
  final Dio dio;

  _InvoiceApiServiceImpl(this.dio);

  @override
  Future<List<CustomerModel>> getCustomers({
    required String userName,
    required String userId,
  }) async {
    try {
      final response = await dio.get(
        '${ApiConstants.apiBaseUrl}${InvoiceApiConstants.getCustomers}/$userName/$userId',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CustomerModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load customers');
      }
    } catch (e) {
      throw Exception('Failed to load customers: $e');
    }
  }
}
