import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_reference_model.freezed.dart';
part 'client_reference_model.g.dart';

@freezed
abstract class ClientReference with _$ClientReference {
  const factory ClientReference({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? address,
    @Default(0.0) double balance,
  }) = _ClientReference;

  factory ClientReference.fromJson(Map<String, dynamic> json) =>
      _$ClientReferenceFromJson(json);
}