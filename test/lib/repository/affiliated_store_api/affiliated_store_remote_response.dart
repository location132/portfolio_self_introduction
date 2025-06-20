import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/affiliated_store.dart';

part 'affiliated_store_remote_response.freezed.dart';
part 'affiliated_store_remote_response.g.dart';

@freezed
class AffiliatedStoreResponse with _$AffiliatedStoreResponse {
  const AffiliatedStoreResponse._();

  const factory AffiliatedStoreResponse({
    @Default([]) List<Store> affiliatedStores,
  }) = _AffiliatedStoreResponse;

  static AffiliatedStoreResponse fromJson(dynamic json) {
    if (json is List) {
      return AffiliatedStoreResponse(
        affiliatedStores: json
            .map((item) => Store.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    }
    return AffiliatedStoreResponse(
      affiliatedStores:
          (json as Map<String, dynamic>)['affiliatedStores'] != null
              ? List<Store>.from(
                  (json['affiliatedStores'] as List)
                      .map((x) => Store.fromJson(x as Map<String, dynamic>)),
                )
              : [],
    );
  }

  List<AffiliatedStoreModel> toModel() {
    return affiliatedStores.map((store) => store.toModel()).toList();
  }
}

@freezed
class Store with _$Store {
  const Store._();
  const factory Store({
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
    String? closedDays,
    required double averageReviewScore,
    required int reviewCount,
    required int maxDiscountRate,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  AffiliatedStoreModel toModel() {
    return AffiliatedStoreModel(
      marketId: marketId,
      mainCategory: mainCategory,
      locationX: locationX,
      locationY: locationY,
      marketImage: marketImage,
      marketName: marketName,
      marketDescription: marketDescription,
      detailAddress: detailAddress,
      eventMessage: eventMessage ?? '',
      openTime: openTime,
      closeTime: closeTime,
      closedDays: closedDays ?? '휴무일 없음',
      averageReviewScore: averageReviewScore,
      reviewCount: reviewCount,
      maxDiscountRate: maxDiscountRate,
    );
  }
}
