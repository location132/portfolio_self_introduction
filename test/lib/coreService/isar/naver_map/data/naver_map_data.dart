import 'package:isar/isar.dart';

part 'naver_map_data.g.dart';

@collection
@Name("NaverMapData")
class NaverMapData {
  Id id = Isar.autoIncrement;

  List<NaverMapDataContent>? naverMapData;

  NaverMapData({this.naverMapData});
}

@embedded
class NaverMapDataContent {
  int? marketId;

  String? mainCategory;
  String? majorCategory;

  double? locationX;
  double? locationY;

  String? marketImage;
  String? marketName;
  String? marketDescription;
  String? detailAddress;
  String? eventMessage;

  String? openTime;
  String? closeTime;
  String? closedDays;

  double? averageReviewScore;
  int? reviewCount;
  int? maxDiscountRate;

  NaverMapDataContent({
    this.marketId,
    this.mainCategory,
    this.majorCategory,
    this.locationX,
    this.locationY,
    this.marketImage,
    this.marketName,
    this.marketDescription,
    this.detailAddress,
    this.eventMessage,
    this.openTime,
    this.closeTime,
    this.closedDays,
    this.averageReviewScore,
    this.reviewCount,
    this.maxDiscountRate,
  });

  // toJson 메서드 추가
  Map<String, dynamic> toJson() {
    return {
      'marketId': marketId,
      'mainCategory': mainCategory,
      'majorCategory': majorCategory,
      'locationX': locationX,
      'locationY': locationY,
      'marketImage': marketImage,
      'marketName': marketName,
      'marketDescription': marketDescription,
      'detailAddress': detailAddress,
      'eventMessage': eventMessage,
      'openTime': openTime,
      'closeTime': closeTime,
      'closedDays': closedDays,
      'averageReviewScore': averageReviewScore,
      'reviewCount': reviewCount,
      'maxDiscountRate': maxDiscountRate,
    };
  }
}
