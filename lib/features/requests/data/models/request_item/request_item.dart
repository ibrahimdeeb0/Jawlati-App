import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_item.freezed.dart';
part 'request_item.g.dart';

@freezed
abstract class RequestItem with _$RequestItem {
  const factory RequestItem({
    required String id,
    required String itemId,
    required String name,
    required String barcode,
    required String unit,
    required double price,
    required int quantity,
    required int availableQuantity,
    @Default(0) double total,
    String? description,
    String? category,
    double? specialPrice,
  }) = _RequestItem;

  factory RequestItem.fromJson(Map<String, dynamic> json) =>
      _$RequestItemFromJson(json);
}
