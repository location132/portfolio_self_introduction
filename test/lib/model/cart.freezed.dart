// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartModel {
  int? get basketId => throw _privateConstructorUsedError;
  int get marketId => throw _privateConstructorUsedError;
  String get marketName => throw _privateConstructorUsedError;
  List<Menu> get menu => throw _privateConstructorUsedError;
  int? get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call(
      {int? basketId,
      int marketId,
      String marketName,
      List<Menu> menu,
      int? totalPrice});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketId = freezed,
    Object? marketId = null,
    Object? marketName = null,
    Object? menu = null,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      basketId: freezed == basketId
          ? _value.basketId
          : basketId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as List<Menu>,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? basketId,
      int marketId,
      String marketName,
      List<Menu> menu,
      int? totalPrice});
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basketId = freezed,
    Object? marketId = null,
    Object? marketName = null,
    Object? menu = null,
    Object? totalPrice = freezed,
  }) {
    return _then(_$CartModelImpl(
      basketId: freezed == basketId
          ? _value.basketId
          : basketId // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as List<Menu>,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CartModelImpl implements _CartModel {
  const _$CartModelImpl(
      {this.basketId,
      required this.marketId,
      required this.marketName,
      required final List<Menu> menu,
      this.totalPrice})
      : _menu = menu;

  @override
  final int? basketId;
  @override
  final int marketId;
  @override
  final String marketName;
  final List<Menu> _menu;
  @override
  List<Menu> get menu {
    if (_menu is EqualUnmodifiableListView) return _menu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu);
  }

  @override
  final int? totalPrice;

  @override
  String toString() {
    return 'CartModel(basketId: $basketId, marketId: $marketId, marketName: $marketName, menu: $menu, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, basketId, marketId, marketName,
      const DeepCollectionEquality().hash(_menu), totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);
}

abstract class _CartModel implements CartModel {
  const factory _CartModel(
      {final int? basketId,
      required final int marketId,
      required final String marketName,
      required final List<Menu> menu,
      final int? totalPrice}) = _$CartModelImpl;

  @override
  int? get basketId;
  @override
  int get marketId;
  @override
  String get marketName;
  @override
  List<Menu> get menu;
  @override
  int? get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Menu {
  int get basketMenuId => throw _privateConstructorUsedError;
  int get menuId => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  String get menuImageUrl => throw _privateConstructorUsedError;
  int get menuPrice => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get optionTotalPrice => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  List<Option> get options => throw _privateConstructorUsedError;
  int get discountAmount => throw _privateConstructorUsedError;
  int get discountRate => throw _privateConstructorUsedError;
  bool get discountAvailability => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
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
      List<Option> options,
      int discountAmount,
      int discountRate,
      bool discountAvailability});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

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
              as List<Option>,
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
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
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
      List<Option> options,
      int discountAmount,
      int discountRate,
      bool discountAvailability});
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
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
    return _then(_$MenuImpl(
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
              as List<Option>,
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

class _$MenuImpl implements _Menu {
  const _$MenuImpl(
      {required this.basketMenuId,
      required this.menuId,
      required this.menuName,
      required this.menuImageUrl,
      required this.menuPrice,
      required this.amount,
      required this.optionTotalPrice,
      required this.totalPrice,
      required final List<Option> options,
      required this.discountAmount,
      required this.discountRate,
      required this.discountAvailability})
      : _options = options;

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
  final List<Option> _options;
  @override
  List<Option> get options {
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
    return 'Menu(basketMenuId: $basketMenuId, menuId: $menuId, menuName: $menuName, menuImageUrl: $menuImageUrl, menuPrice: $menuPrice, amount: $amount, optionTotalPrice: $optionTotalPrice, totalPrice: $totalPrice, options: $options, discountAmount: $discountAmount, discountRate: $discountRate, discountAvailability: $discountAvailability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
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
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);
}

abstract class _Menu implements Menu {
  const factory _Menu(
      {required final int basketMenuId,
      required final int menuId,
      required final String menuName,
      required final String menuImageUrl,
      required final int menuPrice,
      required final int amount,
      required final int optionTotalPrice,
      required final int totalPrice,
      required final List<Option> options,
      required final int discountAmount,
      required final int discountRate,
      required final bool discountAvailability}) = _$MenuImpl;

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
  List<Option> get options;
  @override
  int get discountAmount;
  @override
  int get discountRate;
  @override
  bool get discountAvailability;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Option {
  String get optionDescription => throw _privateConstructorUsedError;
  int get optionPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({String optionDescription, int optionPrice});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

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
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
          _$OptionImpl value, $Res Function(_$OptionImpl) then) =
      __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String optionDescription, int optionPrice});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
      _$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionDescription = null,
    Object? optionPrice = null,
  }) {
    return _then(_$OptionImpl(
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

class _$OptionImpl implements _Option {
  const _$OptionImpl(
      {required this.optionDescription, required this.optionPrice});

  @override
  final String optionDescription;
  @override
  final int optionPrice;

  @override
  String toString() {
    return 'Option(optionDescription: $optionDescription, optionPrice: $optionPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.optionDescription, optionDescription) ||
                other.optionDescription == optionDescription) &&
            (identical(other.optionPrice, optionPrice) ||
                other.optionPrice == optionPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, optionDescription, optionPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);
}

abstract class _Option implements Option {
  const factory _Option(
      {required final String optionDescription,
      required final int optionPrice}) = _$OptionImpl;

  @override
  String get optionDescription;
  @override
  int get optionPrice;
  @override
  @JsonKey(ignore: true)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SideMenuModel {
  int get menuId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  bool get bestMenu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SideMenuModelCopyWith<SideMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideMenuModelCopyWith<$Res> {
  factory $SideMenuModelCopyWith(
          SideMenuModel value, $Res Function(SideMenuModel) then) =
      _$SideMenuModelCopyWithImpl<$Res, SideMenuModel>;
  @useResult
  $Res call(
      {int menuId, int price, String imageUrl, String menuName, bool bestMenu});
}

/// @nodoc
class _$SideMenuModelCopyWithImpl<$Res, $Val extends SideMenuModel>
    implements $SideMenuModelCopyWith<$Res> {
  _$SideMenuModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SideMenuModelImplCopyWith<$Res>
    implements $SideMenuModelCopyWith<$Res> {
  factory _$$SideMenuModelImplCopyWith(
          _$SideMenuModelImpl value, $Res Function(_$SideMenuModelImpl) then) =
      __$$SideMenuModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int menuId, int price, String imageUrl, String menuName, bool bestMenu});
}

/// @nodoc
class __$$SideMenuModelImplCopyWithImpl<$Res>
    extends _$SideMenuModelCopyWithImpl<$Res, _$SideMenuModelImpl>
    implements _$$SideMenuModelImplCopyWith<$Res> {
  __$$SideMenuModelImplCopyWithImpl(
      _$SideMenuModelImpl _value, $Res Function(_$SideMenuModelImpl) _then)
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
    return _then(_$SideMenuModelImpl(
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

class _$SideMenuModelImpl implements _SideMenuModel {
  const _$SideMenuModelImpl(
      {required this.menuId,
      required this.price,
      required this.imageUrl,
      required this.menuName,
      required this.bestMenu});

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
    return 'SideMenuModel(menuId: $menuId, price: $price, imageUrl: $imageUrl, menuName: $menuName, bestMenu: $bestMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideMenuModelImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.bestMenu, bestMenu) ||
                other.bestMenu == bestMenu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, menuId, price, imageUrl, menuName, bestMenu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SideMenuModelImplCopyWith<_$SideMenuModelImpl> get copyWith =>
      __$$SideMenuModelImplCopyWithImpl<_$SideMenuModelImpl>(this, _$identity);
}

abstract class _SideMenuModel implements SideMenuModel {
  const factory _SideMenuModel(
      {required final int menuId,
      required final int price,
      required final String imageUrl,
      required final String menuName,
      required final bool bestMenu}) = _$SideMenuModelImpl;

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
  _$$SideMenuModelImplCopyWith<_$SideMenuModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
