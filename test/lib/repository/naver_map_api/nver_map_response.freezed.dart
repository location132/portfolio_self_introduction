// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nver_map_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NaverMapResponse _$NaverMapResponseFromJson(Map<String, dynamic> json) {
  return _NaverMapResponse.fromJson(json);
}

/// @nodoc
mixin _$NaverMapResponse {
  List<NaverMapMarketModelResponse> get markets =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NaverMapResponseCopyWith<NaverMapResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverMapResponseCopyWith<$Res> {
  factory $NaverMapResponseCopyWith(
          NaverMapResponse value, $Res Function(NaverMapResponse) then) =
      _$NaverMapResponseCopyWithImpl<$Res, NaverMapResponse>;
  @useResult
  $Res call({List<NaverMapMarketModelResponse> markets});
}

/// @nodoc
class _$NaverMapResponseCopyWithImpl<$Res, $Val extends NaverMapResponse>
    implements $NaverMapResponseCopyWith<$Res> {
  _$NaverMapResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markets = null,
  }) {
    return _then(_value.copyWith(
      markets: null == markets
          ? _value.markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<NaverMapMarketModelResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaverMapResponseImplCopyWith<$Res>
    implements $NaverMapResponseCopyWith<$Res> {
  factory _$$NaverMapResponseImplCopyWith(_$NaverMapResponseImpl value,
          $Res Function(_$NaverMapResponseImpl) then) =
      __$$NaverMapResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NaverMapMarketModelResponse> markets});
}

/// @nodoc
class __$$NaverMapResponseImplCopyWithImpl<$Res>
    extends _$NaverMapResponseCopyWithImpl<$Res, _$NaverMapResponseImpl>
    implements _$$NaverMapResponseImplCopyWith<$Res> {
  __$$NaverMapResponseImplCopyWithImpl(_$NaverMapResponseImpl _value,
      $Res Function(_$NaverMapResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markets = null,
  }) {
    return _then(_$NaverMapResponseImpl(
      markets: null == markets
          ? _value._markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<NaverMapMarketModelResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaverMapResponseImpl extends _NaverMapResponse {
  const _$NaverMapResponseImpl(
      {required final List<NaverMapMarketModelResponse> markets})
      : _markets = markets,
        super._();

  factory _$NaverMapResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NaverMapResponseImplFromJson(json);

  final List<NaverMapMarketModelResponse> _markets;
  @override
  List<NaverMapMarketModelResponse> get markets {
    if (_markets is EqualUnmodifiableListView) return _markets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markets);
  }

  @override
  String toString() {
    return 'NaverMapResponse(markets: $markets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverMapResponseImpl &&
            const DeepCollectionEquality().equals(other._markets, _markets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverMapResponseImplCopyWith<_$NaverMapResponseImpl> get copyWith =>
      __$$NaverMapResponseImplCopyWithImpl<_$NaverMapResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaverMapResponseImplToJson(
      this,
    );
  }
}

abstract class _NaverMapResponse extends NaverMapResponse {
  const factory _NaverMapResponse(
          {required final List<NaverMapMarketModelResponse> markets}) =
      _$NaverMapResponseImpl;
  const _NaverMapResponse._() : super._();

  factory _NaverMapResponse.fromJson(Map<String, dynamic> json) =
      _$NaverMapResponseImpl.fromJson;

  @override
  List<NaverMapMarketModelResponse> get markets;
  @override
  @JsonKey(ignore: true)
  _$$NaverMapResponseImplCopyWith<_$NaverMapResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NaverMapMarketModelResponse _$NaverMapMarketModelResponseFromJson(
    Map<String, dynamic> json) {
  return _NaverMapMarketModelResponse.fromJson(json);
}

/// @nodoc
mixin _$NaverMapMarketModelResponse {
  int? get marketId => throw _privateConstructorUsedError;
  String? get mainCategory => throw _privateConstructorUsedError;
  String? get majorCategory => throw _privateConstructorUsedError;
  double? get locationX => throw _privateConstructorUsedError;
  double? get locationY => throw _privateConstructorUsedError;
  String? get marketImage => throw _privateConstructorUsedError;
  String? get marketName => throw _privateConstructorUsedError;
  String? get marketDescription => throw _privateConstructorUsedError;
  String? get detailAddress => throw _privateConstructorUsedError;
  String? get eventMessage => throw _privateConstructorUsedError;
  String? get openTime => throw _privateConstructorUsedError;
  String? get closeTime => throw _privateConstructorUsedError;
  String? get closedDays => throw _privateConstructorUsedError;
  double? get averageReviewScore => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  int? get maxDiscountRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NaverMapMarketModelResponseCopyWith<NaverMapMarketModelResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverMapMarketModelResponseCopyWith<$Res> {
  factory $NaverMapMarketModelResponseCopyWith(
          NaverMapMarketModelResponse value,
          $Res Function(NaverMapMarketModelResponse) then) =
      _$NaverMapMarketModelResponseCopyWithImpl<$Res,
          NaverMapMarketModelResponse>;
  @useResult
  $Res call(
      {int? marketId,
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
      int? maxDiscountRate});
}

/// @nodoc
class _$NaverMapMarketModelResponseCopyWithImpl<$Res,
        $Val extends NaverMapMarketModelResponse>
    implements $NaverMapMarketModelResponseCopyWith<$Res> {
  _$NaverMapMarketModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketId = freezed,
    Object? mainCategory = freezed,
    Object? majorCategory = freezed,
    Object? locationX = freezed,
    Object? locationY = freezed,
    Object? marketImage = freezed,
    Object? marketName = freezed,
    Object? marketDescription = freezed,
    Object? detailAddress = freezed,
    Object? eventMessage = freezed,
    Object? openTime = freezed,
    Object? closeTime = freezed,
    Object? closedDays = freezed,
    Object? averageReviewScore = freezed,
    Object? reviewCount = freezed,
    Object? maxDiscountRate = freezed,
  }) {
    return _then(_value.copyWith(
      marketId: freezed == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int?,
      mainCategory: freezed == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      majorCategory: freezed == majorCategory
          ? _value.majorCategory
          : majorCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      locationX: freezed == locationX
          ? _value.locationX
          : locationX // ignore: cast_nullable_to_non_nullable
              as double?,
      locationY: freezed == locationY
          ? _value.locationY
          : locationY // ignore: cast_nullable_to_non_nullable
              as double?,
      marketImage: freezed == marketImage
          ? _value.marketImage
          : marketImage // ignore: cast_nullable_to_non_nullable
              as String?,
      marketName: freezed == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String?,
      marketDescription: freezed == marketDescription
          ? _value.marketDescription
          : marketDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      detailAddress: freezed == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      eventMessage: freezed == eventMessage
          ? _value.eventMessage
          : eventMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      openTime: freezed == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closeTime: freezed == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closedDays: freezed == closedDays
          ? _value.closedDays
          : closedDays // ignore: cast_nullable_to_non_nullable
              as String?,
      averageReviewScore: freezed == averageReviewScore
          ? _value.averageReviewScore
          : averageReviewScore // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxDiscountRate: freezed == maxDiscountRate
          ? _value.maxDiscountRate
          : maxDiscountRate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NaverMapMarketModelResponseImplCopyWith<$Res>
    implements $NaverMapMarketModelResponseCopyWith<$Res> {
  factory _$$NaverMapMarketModelResponseImplCopyWith(
          _$NaverMapMarketModelResponseImpl value,
          $Res Function(_$NaverMapMarketModelResponseImpl) then) =
      __$$NaverMapMarketModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? marketId,
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
      int? maxDiscountRate});
}

/// @nodoc
class __$$NaverMapMarketModelResponseImplCopyWithImpl<$Res>
    extends _$NaverMapMarketModelResponseCopyWithImpl<$Res,
        _$NaverMapMarketModelResponseImpl>
    implements _$$NaverMapMarketModelResponseImplCopyWith<$Res> {
  __$$NaverMapMarketModelResponseImplCopyWithImpl(
      _$NaverMapMarketModelResponseImpl _value,
      $Res Function(_$NaverMapMarketModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketId = freezed,
    Object? mainCategory = freezed,
    Object? majorCategory = freezed,
    Object? locationX = freezed,
    Object? locationY = freezed,
    Object? marketImage = freezed,
    Object? marketName = freezed,
    Object? marketDescription = freezed,
    Object? detailAddress = freezed,
    Object? eventMessage = freezed,
    Object? openTime = freezed,
    Object? closeTime = freezed,
    Object? closedDays = freezed,
    Object? averageReviewScore = freezed,
    Object? reviewCount = freezed,
    Object? maxDiscountRate = freezed,
  }) {
    return _then(_$NaverMapMarketModelResponseImpl(
      marketId: freezed == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int?,
      mainCategory: freezed == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      majorCategory: freezed == majorCategory
          ? _value.majorCategory
          : majorCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      locationX: freezed == locationX
          ? _value.locationX
          : locationX // ignore: cast_nullable_to_non_nullable
              as double?,
      locationY: freezed == locationY
          ? _value.locationY
          : locationY // ignore: cast_nullable_to_non_nullable
              as double?,
      marketImage: freezed == marketImage
          ? _value.marketImage
          : marketImage // ignore: cast_nullable_to_non_nullable
              as String?,
      marketName: freezed == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String?,
      marketDescription: freezed == marketDescription
          ? _value.marketDescription
          : marketDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      detailAddress: freezed == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      eventMessage: freezed == eventMessage
          ? _value.eventMessage
          : eventMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      openTime: freezed == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closeTime: freezed == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closedDays: freezed == closedDays
          ? _value.closedDays
          : closedDays // ignore: cast_nullable_to_non_nullable
              as String?,
      averageReviewScore: freezed == averageReviewScore
          ? _value.averageReviewScore
          : averageReviewScore // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      maxDiscountRate: freezed == maxDiscountRate
          ? _value.maxDiscountRate
          : maxDiscountRate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NaverMapMarketModelResponseImpl extends _NaverMapMarketModelResponse {
  const _$NaverMapMarketModelResponseImpl(
      {this.marketId,
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
      this.maxDiscountRate})
      : super._();

  factory _$NaverMapMarketModelResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NaverMapMarketModelResponseImplFromJson(json);

  @override
  final int? marketId;
  @override
  final String? mainCategory;
  @override
  final String? majorCategory;
  @override
  final double? locationX;
  @override
  final double? locationY;
  @override
  final String? marketImage;
  @override
  final String? marketName;
  @override
  final String? marketDescription;
  @override
  final String? detailAddress;
  @override
  final String? eventMessage;
  @override
  final String? openTime;
  @override
  final String? closeTime;
  @override
  final String? closedDays;
  @override
  final double? averageReviewScore;
  @override
  final int? reviewCount;
  @override
  final int? maxDiscountRate;

  @override
  String toString() {
    return 'NaverMapMarketModelResponse(marketId: $marketId, mainCategory: $mainCategory, majorCategory: $majorCategory, locationX: $locationX, locationY: $locationY, marketImage: $marketImage, marketName: $marketName, marketDescription: $marketDescription, detailAddress: $detailAddress, eventMessage: $eventMessage, openTime: $openTime, closeTime: $closeTime, closedDays: $closedDays, averageReviewScore: $averageReviewScore, reviewCount: $reviewCount, maxDiscountRate: $maxDiscountRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverMapMarketModelResponseImpl &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId) &&
            (identical(other.mainCategory, mainCategory) ||
                other.mainCategory == mainCategory) &&
            (identical(other.majorCategory, majorCategory) ||
                other.majorCategory == majorCategory) &&
            (identical(other.locationX, locationX) ||
                other.locationX == locationX) &&
            (identical(other.locationY, locationY) ||
                other.locationY == locationY) &&
            (identical(other.marketImage, marketImage) ||
                other.marketImage == marketImage) &&
            (identical(other.marketName, marketName) ||
                other.marketName == marketName) &&
            (identical(other.marketDescription, marketDescription) ||
                other.marketDescription == marketDescription) &&
            (identical(other.detailAddress, detailAddress) ||
                other.detailAddress == detailAddress) &&
            (identical(other.eventMessage, eventMessage) ||
                other.eventMessage == eventMessage) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.closedDays, closedDays) ||
                other.closedDays == closedDays) &&
            (identical(other.averageReviewScore, averageReviewScore) ||
                other.averageReviewScore == averageReviewScore) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.maxDiscountRate, maxDiscountRate) ||
                other.maxDiscountRate == maxDiscountRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      marketId,
      mainCategory,
      majorCategory,
      locationX,
      locationY,
      marketImage,
      marketName,
      marketDescription,
      detailAddress,
      eventMessage,
      openTime,
      closeTime,
      closedDays,
      averageReviewScore,
      reviewCount,
      maxDiscountRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverMapMarketModelResponseImplCopyWith<_$NaverMapMarketModelResponseImpl>
      get copyWith => __$$NaverMapMarketModelResponseImplCopyWithImpl<
          _$NaverMapMarketModelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NaverMapMarketModelResponseImplToJson(
      this,
    );
  }
}

abstract class _NaverMapMarketModelResponse
    extends NaverMapMarketModelResponse {
  const factory _NaverMapMarketModelResponse(
      {final int? marketId,
      final String? mainCategory,
      final String? majorCategory,
      final double? locationX,
      final double? locationY,
      final String? marketImage,
      final String? marketName,
      final String? marketDescription,
      final String? detailAddress,
      final String? eventMessage,
      final String? openTime,
      final String? closeTime,
      final String? closedDays,
      final double? averageReviewScore,
      final int? reviewCount,
      final int? maxDiscountRate}) = _$NaverMapMarketModelResponseImpl;
  const _NaverMapMarketModelResponse._() : super._();

  factory _NaverMapMarketModelResponse.fromJson(Map<String, dynamic> json) =
      _$NaverMapMarketModelResponseImpl.fromJson;

  @override
  int? get marketId;
  @override
  String? get mainCategory;
  @override
  String? get majorCategory;
  @override
  double? get locationX;
  @override
  double? get locationY;
  @override
  String? get marketImage;
  @override
  String? get marketName;
  @override
  String? get marketDescription;
  @override
  String? get detailAddress;
  @override
  String? get eventMessage;
  @override
  String? get openTime;
  @override
  String? get closeTime;
  @override
  String? get closedDays;
  @override
  double? get averageReviewScore;
  @override
  int? get reviewCount;
  @override
  int? get maxDiscountRate;
  @override
  @JsonKey(ignore: true)
  _$$NaverMapMarketModelResponseImplCopyWith<_$NaverMapMarketModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
