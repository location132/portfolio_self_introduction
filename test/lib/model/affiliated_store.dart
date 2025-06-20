import 'package:freezed_annotation/freezed_annotation.dart';

part 'affiliated_store.freezed.dart';

@freezed
class AffiliatedStoreModel with _$AffiliatedStoreModel {
  const factory AffiliatedStoreModel({
    required int marketId,
    required String mainCategory,
    required double locationX,
    required double locationY,
    required String marketImage,
    required String marketName,
    required String marketDescription,
    required String detailAddress,
    String? eventMessage,
    required String openTime,
    required String closeTime,
    required String closedDays,
    required double averageReviewScore,
    required int reviewCount,
    required int maxDiscountRate,
  }) = _AffiliatedStoreModel;
}
