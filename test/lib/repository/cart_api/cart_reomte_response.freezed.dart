// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_reomte_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  List<Cart>? get carts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
          CartResponse value, $Res Function(CartResponse) then) =
      _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call({List<Cart>? carts});
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = freezed,
  }) {
    return _then(_value.copyWith(
      carts: freezed == carts
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartResponseImplCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$CartResponseImplCopyWith(
          _$CartResponseImpl value, $Res Function(_$CartResponseImpl) then) =
      __$$CartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cart>? carts});
}

/// @nodoc
class __$$CartResponseImplCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$CartResponseImpl>
    implements _$$CartResponseImplCopyWith<$Res> {
  __$$CartResponseImplCopyWithImpl(
      _$CartResponseImpl _value, $Res Function(_$CartResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = freezed,
  }) {
    return _then(_$CartResponseImpl(
      carts: freezed == carts
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartResponseImpl extends _CartResponse {
  const _$CartResponseImpl({final List<Cart>? carts = const []})
      : _carts = carts,
        super._();

  factory _$CartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartResponseImplFromJson(json);

  final List<Cart>? _carts;
  @override
  @JsonKey()
  List<Cart>? get carts {
    final value = _carts;
    if (value == null) return null;
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CartResponse(carts: $carts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResponseImpl &&
            const DeepCollectionEquality().equals(other._carts, _carts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_carts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      __$$CartResponseImplCopyWithImpl<_$CartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResponseImplToJson(
      this,
    );
  }
}

abstract class _CartResponse extends CartResponse {
  const factory _CartResponse({final List<Cart>? carts}) = _$CartResponseImpl;
  const _CartResponse._() : super._();

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$CartResponseImpl.fromJson;

  @override
  List<Cart>? get carts;
  @override
  @JsonKey(ignore: true)
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  int get basketId => throw _privateConstructorUsedError;
  int get marketId => throw _privateConstructorUsedError;
  String get marketName => throw _privateConstructorUsedError;
  List<MenuResponse> get menu => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {int basketId,
      int marketId,
      String marketName,
      List<MenuResponse> menu,
      int totalPrice});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketId = null,
    Object? marketId = null,
    Object? marketName = null,
    Object? menu = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      basketId: null == basketId
          ? _value.basketId
          : basketId // ignore: cast_nullable_to_non_nullable
              as int,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as List<MenuResponse>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int basketId,
      int marketId,
      String marketName,
      List<MenuResponse> menu,
      int totalPrice});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketId = null,
    Object? marketId = null,
    Object? marketName = null,
    Object? menu = null,
    Object? totalPrice = null,
  }) {
    return _then(_$CartImpl(
      basketId: null == basketId
          ? _value.basketId
          : basketId // ignore: cast_nullable_to_non_nullable
              as int,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      menu: null == menu
          ? _value._menu
          : menu // ignore: cast_nullable_to_non_nullable
              as List<MenuResponse>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {required this.basketId,
      required this.marketId,
      required this.marketName,
      required final List<MenuResponse> menu,
      required this.totalPrice})
      : _menu = menu;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final int basketId;
  @override
  final int marketId;
  @override
  final String marketName;
  final List<MenuResponse> _menu;
  @override
  List<MenuResponse> get menu {
    if (_menu is EqualUnmodifiableListView) return _menu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu);
  }

  @override
  final int totalPrice;

  @override
  String toString() {
    return 'Cart(basketId: $basketId, marketId: $marketId, marketName: $marketName, menu: $menu, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.basketId, basketId) ||
                other.basketId == basketId) &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId) &&
            (identical(other.marketName, marketName) ||
                other.marketName == marketName) &&
            const DeepCollectionEquality().equals(other._menu, _menu) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, basketId, marketId, marketName,
      const DeepCollectionEquality().hash(_menu), totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {required final int basketId,
      required final int marketId,
      required final String marketName,
      required final List<MenuResponse> menu,
      required final int totalPrice}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  int get basketId;
  @override
  int get marketId;
  @override
  String get marketName;
  @override
  List<MenuResponse> get menu;
  @override
  int get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuResponse {
  int get basketMenuId => throw _privateConstructorUsedError;
  int get menuId => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  String get menuImageUrl => throw _privateConstructorUsedError;
  int get menuPrice => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get optionTotalPrice => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  List<OptionResponse> get options => throw _privateConstructorUsedError;
  int get discountAmount => throw _privateConstructorUsedError;
  int get discountRate => throw _privateConstructorUsedError;
  bool get discountAvailability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res, MenuResponse>;
  @useResult
  $Res call(
      {int basketMenuId,
      int menuId,
      String menuName,
      String menuImageUrl,
      int menuPrice,
      int amount,
      int optionTotalPrice,
      int totalPrice,
      List<OptionResponse> options,
      int discountAmount,
      int discountRate,
      bool discountAvailability});
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res, $Val extends MenuResponse>
    implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketMenuId = null,
    Object? menuId = null,
    Object? menuName = null,
    Object? menuImageUrl = null,
    Object? menuPrice = null,
    Object? amount = null,
    Object? optionTotalPrice = null,
    Object? totalPrice = null,
    Object? options = null,
    Object? discountAmount = null,
    Object? discountRate = null,
    Object? discountAvailability = null,
  }) {
    return _then(_value.copyWith(
      basketMenuId: null == basketMenuId
          ? _value.basketMenuId
          : basketMenuId // ignore: cast_nullable_to_non_nullable
              as int,
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      menuImageUrl: null == menuImageUrl
          ? _value.menuImageUrl
          : menuImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      menuPrice: null == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      optionTotalPrice: null == optionTotalPrice
          ? _value.optionTotalPrice
          : optionTotalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionResponse>,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
      discountAvailability: null == discountAvailability
          ? _value.discountAvailability
          : discountAvailability // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuResponseImplCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$$MenuResponseImplCopyWith(
          _$MenuResponseImpl value, $Res Function(_$MenuResponseImpl) then) =
      __$$MenuResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int basketMenuId,
      int menuId,
      String menuName,
      String menuImageUrl,
      int menuPrice,
      int amount,
      int optionTotalPrice,
      int totalPrice,
      List<OptionResponse> options,
      int discountAmount,
      int discountRate,
      bool discountAvailability});
}

/// @nodoc
class __$$MenuResponseImplCopyWithImpl<$Res>
    extends _$MenuResponseCopyWithImpl<$Res, _$MenuResponseImpl>
    implements _$$MenuResponseImplCopyWith<$Res> {
  __$$MenuResponseImplCopyWithImpl(
      _$MenuResponseImpl _value, $Res Function(_$MenuResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketMenuId = null,
    Object? menuId = null,
    Object? menuName = null,
    Object? menuImageUrl = null,
    Object? menuPrice = null,
    Object? amount = null,
    Object? optionTotalPrice = null,
    Object? totalPrice = null,
    Object? options = null,
    Object? discountAmount = null,
    Object? discountRate = null,
    Object? discountAvailability = null,
  }) {
    return _then(_$MenuResponseImpl(
      basketMenuId: null == basketMenuId
          ? _value.basketMenuId
          : basketMenuId // ignore: cast_nullable_to_non_nullable
              as int,
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      menuImageUrl: null == menuImageUrl
          ? _value.menuImageUrl
          : menuImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      menuPrice: null == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      optionTotalPrice: null == optionTotalPrice
          ? _value.optionTotalPrice
          : optionTotalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionResponse>,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
      discountAvailability: null == discountAvailability
          ? _value.discountAvailability
          : discountAvailability // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuResponseImpl implements _MenuResponse {
  const _$MenuResponseImpl(
      {required this.basketMenuId,
      required this.menuId,
      required this.menuName,
      required this.menuImageUrl,
      required this.menuPrice,
      required this.amount,
      required this.optionTotalPrice,
      required this.totalPrice,
      required final List<OptionResponse> options,
      required this.discountAmount,
      required this.discountRate,
      required this.discountAvailability})
      : _options = options;

  factory _$MenuResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuResponseImplFromJson(json);

  @override
  final int basketMenuId;
  @override
  final int menuId;
  @override
  final String menuName;
  @override
  final String menuImageUrl;
  @override
  final int menuPrice;
  @override
  final int amount;
  @override
  final int optionTotalPrice;
  @override
  final int totalPrice;
  final List<OptionResponse> _options;
  @override
  List<OptionResponse> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int discountAmount;
  @override
  final int discountRate;
  @override
  final bool discountAvailability;

  @override
  String toString() {
    return 'MenuResponse(basketMenuId: $basketMenuId, menuId: $menuId, menuName: $menuName, menuImageUrl: $menuImageUrl, menuPrice: $menuPrice, amount: $amount, optionTotalPrice: $optionTotalPrice, totalPrice: $totalPrice, options: $options, discountAmount: $discountAmount, discountRate: $discountRate, discountAvailability: $discountAvailability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuResponseImpl &&
            (identical(other.basketMenuId, basketMenuId) ||
                other.basketMenuId == basketMenuId) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.menuImageUrl, menuImageUrl) ||
                other.menuImageUrl == menuImageUrl) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.optionTotalPrice, optionTotalPrice) ||
                other.optionTotalPrice == optionTotalPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate) &&
            (identical(other.discountAvailability, discountAvailability) ||
                other.discountAvailability == discountAvailability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      basketMenuId,
      menuId,
      menuName,
      menuImageUrl,
      menuPrice,
      amount,
      optionTotalPrice,
      totalPrice,
      const DeepCollectionEquality().hash(_options),
      discountAmount,
      discountRate,
      discountAvailability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuResponseImplCopyWith<_$MenuResponseImpl> get copyWith =>
      __$$MenuResponseImplCopyWithImpl<_$MenuResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuResponseImplToJson(
      this,
    );
  }
}

abstract class _MenuResponse implements MenuResponse {
  const factory _MenuResponse(
      {required final int basketMenuId,
      required final int menuId,
      required final String menuName,
      required final String menuImageUrl,
      required final int menuPrice,
      required final int amount,
      required final int optionTotalPrice,
      required final int totalPrice,
      required final List<OptionResponse> options,
      required final int discountAmount,
      required final int discountRate,
      required final bool discountAvailability}) = _$MenuResponseImpl;

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$MenuResponseImpl.fromJson;

  @override
  int get basketMenuId;
  @override
  int get menuId;
  @override
  String get menuName;
  @override
  String get menuImageUrl;
  @override
  int get menuPrice;
  @override
  int get amount;
  @override
  int get optionTotalPrice;
  @override
  int get totalPrice;
  @override
  List<OptionResponse> get options;
  @override
  int get discountAmount;
  @override
  int get discountRate;
  @override
  bool get discountAvailability;
  @override
  @JsonKey(ignore: true)
  _$$MenuResponseImplCopyWith<_$MenuResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptionResponse _$OptionResponseFromJson(Map<String, dynamic> json) {
  return _OptionResponse.fromJson(json);
}

/// @nodoc
mixin _$OptionResponse {
  String get optionDescription => throw _privateConstructorUsedError;
  int get optionPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionResponseCopyWith<OptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionResponseCopyWith<$Res> {
  factory $OptionResponseCopyWith(
          OptionResponse value, $Res Function(OptionResponse) then) =
      _$OptionResponseCopyWithImpl<$Res, OptionResponse>;
  @useResult
  $Res call({String optionDescription, int optionPrice});
}

/// @nodoc
class _$OptionResponseCopyWithImpl<$Res, $Val extends OptionResponse>
    implements $OptionResponseCopyWith<$Res> {
  _$OptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionDescription = null,
    Object? optionPrice = null,
  }) {
    return _then(_value.copyWith(
      optionDescription: null == optionDescription
          ? _value.optionDescription
          : optionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      optionPrice: null == optionPrice
          ? _value.optionPrice
          : optionPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionResponseImplCopyWith<$Res>
    implements $OptionResponseCopyWith<$Res> {
  factory _$$OptionResponseImplCopyWith(_$OptionResponseImpl value,
          $Res Function(_$OptionResponseImpl) then) =
      __$$OptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String optionDescription, int optionPrice});
}

/// @nodoc
class __$$OptionResponseImplCopyWithImpl<$Res>
    extends _$OptionResponseCopyWithImpl<$Res, _$OptionResponseImpl>
    implements _$$OptionResponseImplCopyWith<$Res> {
  __$$OptionResponseImplCopyWithImpl(
      _$OptionResponseImpl _value, $Res Function(_$OptionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionDescription = null,
    Object? optionPrice = null,
  }) {
    return _then(_$OptionResponseImpl(
      optionDescription: null == optionDescription
          ? _value.optionDescription
          : optionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      optionPrice: null == optionPrice
          ? _value.optionPrice
          : optionPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionResponseImpl implements _OptionResponse {
  const _$OptionResponseImpl(
      {required this.optionDescription, required this.optionPrice});

  factory _$OptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionResponseImplFromJson(json);

  @override
  final String optionDescription;
  @override
  final int optionPrice;

  @override
  String toString() {
    return 'OptionResponse(optionDescription: $optionDescription, optionPrice: $optionPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionResponseImpl &&
            (identical(other.optionDescription, optionDescription) ||
                other.optionDescription == optionDescription) &&
            (identical(other.optionPrice, optionPrice) ||
                other.optionPrice == optionPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, optionDescription, optionPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionResponseImplCopyWith<_$OptionResponseImpl> get copyWith =>
      __$$OptionResponseImplCopyWithImpl<_$OptionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionResponseImplToJson(
      this,
    );
  }
}

abstract class _OptionResponse implements OptionResponse {
  const factory _OptionResponse(
      {required final String optionDescription,
      required final int optionPrice}) = _$OptionResponseImpl;

  factory _OptionResponse.fromJson(Map<String, dynamic> json) =
      _$OptionResponseImpl.fromJson;

  @override
  String get optionDescription;
  @override
  int get optionPrice;
  @override
  @JsonKey(ignore: true)
  _$$OptionResponseImplCopyWith<_$OptionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecommendedSideMenuResponse _$RecommendedSideMenuResponseFromJson(
    Map<String, dynamic> json) {
  return _RecommendedSideMenuResponse.fromJson(json);
}

/// @nodoc
mixin _$RecommendedSideMenuResponse {
  List<SideMenu> get sideMenus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendedSideMenuResponseCopyWith<RecommendedSideMenuResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedSideMenuResponseCopyWith<$Res> {
  factory $RecommendedSideMenuResponseCopyWith(
          RecommendedSideMenuResponse value,
          $Res Function(RecommendedSideMenuResponse) then) =
      _$RecommendedSideMenuResponseCopyWithImpl<$Res,
          RecommendedSideMenuResponse>;
  @useResult
  $Res call({List<SideMenu> sideMenus});
}

/// @nodoc
class _$RecommendedSideMenuResponseCopyWithImpl<$Res,
        $Val extends RecommendedSideMenuResponse>
    implements $RecommendedSideMenuResponseCopyWith<$Res> {
  _$RecommendedSideMenuResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sideMenus = null,
  }) {
    return _then(_value.copyWith(
      sideMenus: null == sideMenus
          ? _value.sideMenus
          : sideMenus // ignore: cast_nullable_to_non_nullable
              as List<SideMenu>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendedSideMenuResponseImplCopyWith<$Res>
    implements $RecommendedSideMenuResponseCopyWith<$Res> {
  factory _$$RecommendedSideMenuResponseImplCopyWith(
          _$RecommendedSideMenuResponseImpl value,
          $Res Function(_$RecommendedSideMenuResponseImpl) then) =
      __$$RecommendedSideMenuResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SideMenu> sideMenus});
}

/// @nodoc
class __$$RecommendedSideMenuResponseImplCopyWithImpl<$Res>
    extends _$RecommendedSideMenuResponseCopyWithImpl<$Res,
        _$RecommendedSideMenuResponseImpl>
    implements _$$RecommendedSideMenuResponseImplCopyWith<$Res> {
  __$$RecommendedSideMenuResponseImplCopyWithImpl(
      _$RecommendedSideMenuResponseImpl _value,
      $Res Function(_$RecommendedSideMenuResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sideMenus = null,
  }) {
    return _then(_$RecommendedSideMenuResponseImpl(
      sideMenus: null == sideMenus
          ? _value._sideMenus
          : sideMenus // ignore: cast_nullable_to_non_nullable
              as List<SideMenu>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedSideMenuResponseImpl extends _RecommendedSideMenuResponse {
  const _$RecommendedSideMenuResponseImpl(
      {final List<SideMenu> sideMenus = const []})
      : _sideMenus = sideMenus,
        super._();

  factory _$RecommendedSideMenuResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RecommendedSideMenuResponseImplFromJson(json);

  final List<SideMenu> _sideMenus;
  @override
  @JsonKey()
  List<SideMenu> get sideMenus {
    if (_sideMenus is EqualUnmodifiableListView) return _sideMenus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sideMenus);
  }

  @override
  String toString() {
    return 'RecommendedSideMenuResponse(sideMenus: $sideMenus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedSideMenuResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._sideMenus, _sideMenus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sideMenus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedSideMenuResponseImplCopyWith<_$RecommendedSideMenuResponseImpl>
      get copyWith => __$$RecommendedSideMenuResponseImplCopyWithImpl<
          _$RecommendedSideMenuResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedSideMenuResponseImplToJson(
      this,
    );
  }
}

abstract class _RecommendedSideMenuResponse
    extends RecommendedSideMenuResponse {
  const factory _RecommendedSideMenuResponse({final List<SideMenu> sideMenus}) =
      _$RecommendedSideMenuResponseImpl;
  const _RecommendedSideMenuResponse._() : super._();

  factory _RecommendedSideMenuResponse.fromJson(Map<String, dynamic> json) =
      _$RecommendedSideMenuResponseImpl.fromJson;

  @override
  List<SideMenu> get sideMenus;
  @override
  @JsonKey(ignore: true)
  _$$RecommendedSideMenuResponseImplCopyWith<_$RecommendedSideMenuResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SideMenu _$SideMenuFromJson(Map<String, dynamic> json) {
  return _SideMenu.fromJson(json);
}

/// @nodoc
mixin _$SideMenu {
  int get menuId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  bool get bestMenu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SideMenuCopyWith<SideMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideMenuCopyWith<$Res> {
  factory $SideMenuCopyWith(SideMenu value, $Res Function(SideMenu) then) =
      _$SideMenuCopyWithImpl<$Res, SideMenu>;
  @useResult
  $Res call(
      {int menuId, int price, String imageUrl, String menuName, bool bestMenu});
}

/// @nodoc
class _$SideMenuCopyWithImpl<$Res, $Val extends SideMenu>
    implements $SideMenuCopyWith<$Res> {
  _$SideMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? menuName = null,
    Object? bestMenu = null,
  }) {
    return _then(_value.copyWith(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      bestMenu: null == bestMenu
          ? _value.bestMenu
          : bestMenu // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SideMenuImplCopyWith<$Res>
    implements $SideMenuCopyWith<$Res> {
  factory _$$SideMenuImplCopyWith(
          _$SideMenuImpl value, $Res Function(_$SideMenuImpl) then) =
      __$$SideMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int menuId, int price, String imageUrl, String menuName, bool bestMenu});
}

/// @nodoc
class __$$SideMenuImplCopyWithImpl<$Res>
    extends _$SideMenuCopyWithImpl<$Res, _$SideMenuImpl>
    implements _$$SideMenuImplCopyWith<$Res> {
  __$$SideMenuImplCopyWithImpl(
      _$SideMenuImpl _value, $Res Function(_$SideMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? menuName = null,
    Object? bestMenu = null,
  }) {
    return _then(_$SideMenuImpl(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      bestMenu: null == bestMenu
          ? _value.bestMenu
          : bestMenu // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SideMenuImpl implements _SideMenu {
  const _$SideMenuImpl(
      {required this.menuId,
      required this.price,
      required this.imageUrl,
      required this.menuName,
      required this.bestMenu});

  factory _$SideMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$SideMenuImplFromJson(json);

  @override
  final int menuId;
  @override
  final int price;
  @override
  final String imageUrl;
  @override
  final String menuName;
  @override
  final bool bestMenu;

  @override
  String toString() {
    return 'SideMenu(menuId: $menuId, price: $price, imageUrl: $imageUrl, menuName: $menuName, bestMenu: $bestMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideMenuImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.bestMenu, bestMenu) ||
                other.bestMenu == bestMenu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, menuId, price, imageUrl, menuName, bestMenu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SideMenuImplCopyWith<_$SideMenuImpl> get copyWith =>
      __$$SideMenuImplCopyWithImpl<_$SideMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SideMenuImplToJson(
      this,
    );
  }
}

abstract class _SideMenu implements SideMenu {
  const factory _SideMenu(
      {required final int menuId,
      required final int price,
      required final String imageUrl,
      required final String menuName,
      required final bool bestMenu}) = _$SideMenuImpl;

  factory _SideMenu.fromJson(Map<String, dynamic> json) =
      _$SideMenuImpl.fromJson;

  @override
  int get menuId;
  @override
  int get price;
  @override
  String get imageUrl;
  @override
  String get menuName;
  @override
  bool get bestMenu;
  @override
  @JsonKey(ignore: true)
  _$$SideMenuImplCopyWith<_$SideMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
