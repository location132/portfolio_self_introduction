import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';

part 'nver_map_response.freezed.dart';
part 'nver_map_response.g.dart';

@freezed
class NaverMapResponse with _$NaverMapResponse {
  const NaverMapResponse._();

  const factory NaverMapResponse({
    required List<NaverMapMarketModelResponse> markets,
  }) = _NaverMapResponse;

  NaverMapData toNaverMapData() {
    return NaverMapData(
      naverMapData:
          markets.map((market) => market.toNaverMapDataContent()).toList(),
    );
  }

  factory NaverMapResponse.fromJson(List<dynamic> json) => NaverMapResponse(
        markets:
            json.map((e) => NaverMapMarketModelResponse.fromJson(e)).toList(),
      );
}

@freezed
class NaverMapMarketModelResponse with _$NaverMapMarketModelResponse {
  const NaverMapMarketModelResponse._();

  const factory NaverMapMarketModelResponse({
    int? marketId,
    String? mainCategory,
    String? majorCategory,
    double? locationX,
    double? locationY,
    String? marketImage,
    String? marketName,
    String? marketDescription,
    String? detailAddress,
    String? eventMessage,
    String? openTime,
    String? closeTime,
    String? closedDays,
    double? averageReviewScore,
    int? reviewCount,
    int? maxDiscountRate,
  }) = _NaverMapMarketModelResponse;

  NaverMapDataContent toNaverMapDataContent() {
    return NaverMapDataContent(
      marketId: marketId,
      mainCategory: mainCategory,
      majorCategory: majorCategory,
      locationX: locationX,
      locationY: locationY,
      marketImage: marketImage,
      marketName: marketName,
      marketDescription: marketDescription,
      detailAddress: detailAddress,
      eventMessage: eventMessage,
      openTime: openTime,
      closeTime: closeTime,
      closedDays: closedDays,
      averageReviewScore: averageReviewScore,
      reviewCount: reviewCount,
      maxDiscountRate: maxDiscountRate,
    );
  }

  factory NaverMapMarketModelResponse.fromJson(Map<String, dynamic> json) =>
      _$NaverMapMarketModelResponseFromJson(json);
}
