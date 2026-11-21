import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

enum ClientType { individual, company }

enum OrderType { retail, wholesale, mall }

@freezed
abstract class Client with _$Client {
  const Client._();
  
  const factory Client({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? address,
    String? taxNumber,
    ClientType? type,
    String? managerName,
    String? commercialRegistryImagePath,
    String? residenceImagePath,
    @Default(OrderType.retail) OrderType selectedOrderType,
    @Default(0.0) double balance,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => 
      _$ClientFromJson(json);
      
  List<OrderType> get calculatedAvailableOrderTypes {
    if (type == ClientType.individual) {
      return [OrderType.retail];
    } else {
      return [OrderType.retail, OrderType.wholesale, OrderType.mall];
    }
  }
}