import 'package:freezed_annotation/freezed_annotation.dart';
part 'price.freezed.dart';
part 'price.g.dart';

@freezed
class Price with _$Price {
  const factory Price({
    required String value,
    required String currency,
    required String formatted,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}
