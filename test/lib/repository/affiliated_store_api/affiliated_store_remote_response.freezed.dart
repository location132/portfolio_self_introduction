// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affiliated_store_remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AffiliatedStoreResponse {
  List<Store> get affiliatedStores => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AffiliatedStoreResponseCopyWith<AffiliatedStoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffiliatedStoreResponseCopyWith<$Res> {
  factory $AffiliatedStoreResponseCopyWith(AffiliatedStoreResponse value,
          $Res Function(AffiliatedStoreResponse) then) =
      _$AffiliatedStoreResponseCopyWithImpl<$Res, AffiliatedStoreResponse>;
  @useResult
  $Res call({List<Store> affiliatedStores});
}

/// @nodoc
class _$AffiliatedStoreResponseCopyWithImpl<$Res,
        $Val extends AffiliatedStoreResponse>
    implements $AffiliatedStoreResponseCopyWith<$Res> {
  _$AffiliatedStoreResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affiliatedStores = null,
  }) {
    return _then(_value.copyWith(
      affiliatedStores: null == affiliatedStores
          ? _value.affiliatedStores
          : affiliatedStores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AffiliatedStoreResponseImplCopyWith<$Res>
    implements $AffiliatedStoreResponseCopyWith<$Res> {
  factory _$$AffiliatedStoreResponseImplCopyWith(
          _$AffiliatedStoreResponseImpl value,
          $Res Function(_$AffiliatedStoreResponseImpl) then) =
      __$$AffiliatedStoreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Store> affiliatedStores});
}

/// @nodoc
class __$$AffiliatedStoreResponseImplCopyWithImpl<$Res>
    extends _$AffiliatedStoreResponseCopyWithImpl<$Res,
        _$AffiliatedStoreResponseImpl>
    implements _$$AffiliatedStoreResponseImplCopyWith<$Res> {
  __$$AffiliatedStoreResponseImplCopyWithImpl(
      _$AffiliatedStoreResponseImpl _value,
      $Res Function(_$AffiliatedStoreResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affiliatedStores = null,
  }) {
    return _then(_$AffiliatedStoreResponseImpl(
      affiliatedStores: null == affiliatedStores
          ? _value._affiliatedStores
          : affiliatedStores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
    ));
  }
}

/// @nodoc

class _$AffiliatedStoreResponseImpl extends _AffiliatedStoreResponse {
  const _$AffiliatedStoreResponseImpl(
      {final List<Store> affiliatedStores = const []})
      : _affiliatedStores = affiliatedStores,
        super._();

  final List<Store> _affiliatedStores;
  @override
  @JsonKey()
  List<Store> get affiliatedStores {
    if (_affiliatedStores is EqualUnmodifiableListView)
      return _affiliatedStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affiliatedStores);
  }

  @override
  String toString() {
    return 'AffiliatedStoreResponse(affiliatedStores: $affiliatedStores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffiliatedStoreResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._affiliatedStores, _affiliatedStores));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_affiliatedStores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AffiliatedStoreResponseImplCopyWith<_$AffiliatedStoreResponseImpl>
      get copyWith => __$$AffiliatedStoreResponseImplCopyWithImpl<
          _$AffiliatedStoreResponseImpl>(this, _$identity);
}

abstract class _AffiliatedStoreResponse extends AffiliatedStoreResponse {
  const factory _AffiliatedStoreResponse({final List<Store> affiliatedStores}) =
      _$AffiliatedStoreResponseImpl;
  const _AffiliatedStoreResponse._() : super._();

  @override
  List<Store> get affiliatedStores;
  @override
  @JsonKey(ignore: true)
  _$$AffiliatedStoreResponseImplCopyWith<_$AffiliatedStoreResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  int get marketId => throw _privateConstructorUsedError;
  String get mainCategory => throw _privateConstructorUsedError;
  double get locationX => throw _privateConstructorUsedError;
  double get locationY => throw _privateConstructorUsedError;
  String get marketImage => throw _privateConstructorUsedError;
  String get marketName => throw _privateConstructorUsedError;
  String get marketDescription => throw _privateConstructorUsedError;
  String get detailAddress => throw _privateConstructorUsedError;
  String? get eventMessage => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;
  String get closeTime => throw _privateConstructorUsedError;
  String? get closedDays => throw _privateConstructorUsedError;
  double get averageReviewScore => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  int get maxDiscountRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {int marketId,
      String mainCategory,
      double locationX,
      double locationY,
      String marketImage,
      String marketName,
      String marketDescription,
      String detailAddress,
      String? eventMessage,
      String openTime,
      String closeTime,
      String? closedDays,
      double averageReviewScore,
      int reviewCount,
      int maxDiscountRate});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketId = null,
    Object? mainCategory = null,
    Object? locationX = null,
    Object? locationY = null,
    Object? marketImage = null,
    Object? marketName = null,
    Object? marketDescription = null,
    Object? detailAddress = null,
    Object? eventMessage = freezed,
    Object? openTime = null,
    Object? closeTime = null,
    Object? closedDays = freezed,
    Object? averageReviewScore = null,
    Object? reviewCount = null,
    Object? maxDiscountRate = null,
  }) {
    return _then(_value.copyWith(
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int,
      mainCategory: null == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as String,
      locationX: null == locationX
          ? _value.locationX
          : locationX // ignore: cast_nullable_to_non_nullable
              as double,
      locationY: null == locationY
          ? _value.locationY
          : locationY // ignore: cast_nullable_to_non_nullable
              as double,
      marketImage: null == marketImage
          ? _value.marketImage
          : marketImage // ignore: cast_nullable_to_non_nullable
              as String,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      marketDescription: null == marketDescription
          ? _value.marketDescription
          : marketDescription // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      eventMessage: freezed == eventMessage
          ? _value.eventMessage
          : eventMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      closedDays: freezed == closedDays
          ? _value.closedDays
          : closedDays // ignore: cast_nullable_to_non_nullable
              as String?,
      averageReviewScore: null == averageReviewScore
          ? _value.averageReviewScore
          : averageReviewScore // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxDiscountRate: null == maxDiscountRate
          ? _value.maxDiscountRate
          : maxDiscountRate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int marketId,
      String mainCategory,
      double locationX,
      double locationY,
      String marketImage,
      String marketName,
      String marketDescription,
      String detailAddress,
      String? eventMessage,
      String openTime,
      String closeTime,
      String? closedDays,
      double averageReviewScore,
      int reviewCount,
      int maxDiscountRate});
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketId = null,
    Object? mainCategory = null,
    Object? locationX = null,
    Object? locationY = null,
    Object? marketImage = null,
    Object? marketName = null,
    Object? marketDescription = null,
    Object? detailAddress = null,
    Object? eventMessage = freezed,
    Object? openTime = null,
    Object? closeTime = null,
    Object? closedDays = freezed,
    Object? averageReviewScore = null,
    Object? reviewCount = null,
    Object? maxDiscountRate = null,
  }) {
    return _then(_$StoreImpl(
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int,
      mainCategory: null == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as String,
      locationX: null == locationX
          ? _value.locationX
          : locationX // ignore: cast_nullable_to_non_nullable
              as double,
      locationY: null == locationY
          ? _value.locationY
          : locationY // ignore: cast_nullable_to_non_nullable
              as double,
      marketImage: null == marketImage
          ? _value.marketImage
          : marketImage // ignore: cast_nullable_to_non_nullable
              as String,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      marketDescription: null == marketDescription
          ? _value.marketDescription
          : marketDescription // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      eventMessage: freezed == eventMessage
          ? _value.eventMessage
          : eventMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      closedDays: freezed == closedDays
          ? _value.closedDays
          : closedDays // ignore: cast_nullable_to_non_nullable
              as String?,
      averageReviewScore: null == averageReviewScore
          ? _value.averageReviewScore
          : averageReviewScore // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxDiscountRate: null == maxDiscountRate
          ? _value.maxDiscountRate
          : maxDiscountRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl extends _Store {
  const _$StoreImpl(
      {required this.marketId,
      required this.mainCategory,
      required this.locationX,
      required this.locationY,
      required this.marketImage,
      required this.marketName,
      required this.marketDescription,
      required this.detailAddress,
      this.eventMessage,
      required this.openTime,
      required this.closeTime,
      this.closedDays,
      required this.averageReviewScore,
      required this.reviewCount,
      required this.maxDiscountRate})
      : super._();

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final int marketId;
  @override
  final String mainCategory;
  @override
  final double locationX;
  @override
  final double locationY;
  @override
  final String marketImage;
  @override
  final String marketName;
  @override
  final String marketDescription;
  @override
  final String detailAddress;
  @override
  final String? eventMessage;
  @override
  final String openTime;
  @override
  final String closeTime;
  @override
  final String? closedDays;
  @override
  final double averageReviewScore;
  @override
  final int reviewCount;
  @override
  final int maxDiscountRate;

  @override
  String toString() {
    return 'Store(marketId: $marketId, mainCategory: $mainCategory, locationX: $locationX, locationY: $locationY, marketImage: $marketImage, marketName: $marketName, marketDescription: $marketDescription, detailAddress: $detailAddress, eventMessage: $eventMessage, openTime: $openTime, closeTime: $closeTime, closedDays: $closedDays, averageReviewScore: $averageReviewScore, reviewCount: $reviewCount, maxDiscountRate: $maxDiscountRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId) &&
            (identical(other.mainCategory, mainCategory) ||
                other.mainCategory == mainCategory) &&
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
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store extends Store {
  const factory _Store(
      {required final int marketId,
      required final String mainCategory,
      required final double locationX,
      required final double locationY,
      required final String marketImage,
      required final String marketName,
      required final String marketDescription,
      required final String detailAddress,
      final String? eventMessage,
      required final String openTime,
      required final String closeTime,
      final String? closedDays,
      required final double averageReviewScore,
      required final int reviewCount,
      required final int maxDiscountRate}) = _$StoreImpl;
  const _Store._() : super._();

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  int get marketId;
  @override
  String get mainCategory;
  @override
  double get locationX;
  @override
  double get locationY;
  @override
  String get marketImage;
  @override
  String get marketName;
  @override
  String get marketDescription;
  @override
  String get detailAddress;
  @override
  String? get eventMessage;
  @override
  String get openTime;
  @override
  String get closeTime;
  @override
  String? get closedDays;
  @override
  double get averageReviewScore;
  @override
  int get reviewCount;
  @override
  int get maxDiscountRate;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
