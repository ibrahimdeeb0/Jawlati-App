import 'package:freezed_annotation/freezed_annotation.dart';

// part 'item_model.freezed.dart';
part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    required String id,
    required String name,
    required String barcode,
    required String unit,
    required double price,
    required int stockQuantity,
    String? description,
    String? category,
    double? cost,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
}
