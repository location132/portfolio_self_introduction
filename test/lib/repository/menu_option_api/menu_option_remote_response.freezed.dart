// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_option_remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuOptionsResponse _$MenuOptionsResponseFromJson(Map<String, dynamic> json) {
  return _MenuOptionsResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuOptionsResponse {
  List<MenuOptionCategoryResponse> get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuOptionsResponseCopyWith<MenuOptionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionsResponseCopyWith<$Res> {
  factory $MenuOptionsResponseCopyWith(
          MenuOptionsResponse value, $Res Function(MenuOptionsResponse) then) =
      _$MenuOptionsResponseCopyWithImpl<$Res, MenuOptionsResponse>;
  @useResult
  $Res call({List<MenuOptionCategoryResponse> categories});
}

/// @nodoc
class _$MenuOptionsResponseCopyWithImpl<$Res, $Val extends MenuOptionsResponse>
    implements $MenuOptionsResponseCopyWith<$Res> {
  _$MenuOptionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuOptionCategoryResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuOptionsResponseImplCopyWith<$Res>
    implements $MenuOptionsResponseCopyWith<$Res> {
  factory _$$MenuOptionsResponseImplCopyWith(_$MenuOptionsResponseImpl value,
          $Res Function(_$MenuOptionsResponseImpl) then) =
      __$$MenuOptionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuOptionCategoryResponse> categories});
}

/// @nodoc
class __$$MenuOptionsResponseImplCopyWithImpl<$Res>
    extends _$MenuOptionsResponseCopyWithImpl<$Res, _$MenuOptionsResponseImpl>
    implements _$$MenuOptionsResponseImplCopyWith<$Res> {
  __$$MenuOptionsResponseImplCopyWithImpl(_$MenuOptionsResponseImpl _value,
      $Res Function(_$MenuOptionsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$MenuOptionsResponseImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuOptionCategoryResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuOptionsResponseImpl extends _MenuOptionsResponse {
  const _$MenuOptionsResponseImpl(
      {final List<MenuOptionCategoryResponse> categories = const []})
      : _categories = categories,
        super._();

  factory _$MenuOptionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuOptionsResponseImplFromJson(json);

  final List<MenuOptionCategoryResponse> _categories;
  @override
  @JsonKey()
  List<MenuOptionCategoryResponse> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MenuOptionsResponse(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionsResponseImplCopyWith<_$MenuOptionsResponseImpl> get copyWith =>
      __$$MenuOptionsResponseImplCopyWithImpl<_$MenuOptionsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuOptionsResponseImplToJson(
      this,
    );
  }
}

abstract class _MenuOptionsResponse extends MenuOptionsResponse {
  const factory _MenuOptionsResponse(
          {final List<MenuOptionCategoryResponse> categories}) =
      _$MenuOptionsResponseImpl;
  const _MenuOptionsResponse._() : super._();

  factory _MenuOptionsResponse.fromJson(Map<String, dynamic> json) =
      _$MenuOptionsResponseImpl.fromJson;

  @override
  List<MenuOptionCategoryResponse> get categories;
  @override
  @JsonKey(ignore: true)
  _$$MenuOptionsResponseImplCopyWith<_$MenuOptionsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuOptionCategoryResponse _$MenuOptionCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _MenuOptionCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuOptionCategoryResponse {
  String get classification => throw _privateConstructorUsedError;
  List<MenuOptionResponse> get options => throw _privateConstructorUsedError;
  bool get multipleSelection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuOptionCategoryResponseCopyWith<MenuOptionCategoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionCategoryResponseCopyWith<$Res> {
  factory $MenuOptionCategoryResponseCopyWith(MenuOptionCategoryResponse value,
          $Res Function(MenuOptionCategoryResponse) then) =
      _$MenuOptionCategoryResponseCopyWithImpl<$Res,
          MenuOptionCategoryResponse>;
  @useResult
  $Res call(
      {String classification,
      List<MenuOptionResponse> options,
      bool multipleSelection});
}

/// @nodoc
class _$MenuOptionCategoryResponseCopyWithImpl<$Res,
        $Val extends MenuOptionCategoryResponse>
    implements $MenuOptionCategoryResponseCopyWith<$Res> {
  _$MenuOptionCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? options = null,
    Object? multipleSelection = null,
  }) {
    return _then(_value.copyWith(
      classification: null == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<MenuOptionResponse>,
      multipleSelection: null == multipleSelection
          ? _value.multipleSelection
          : multipleSelection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuOptionCategoryResponseImplCopyWith<$Res>
    implements $MenuOptionCategoryResponseCopyWith<$Res> {
  factory _$$MenuOptionCategoryResponseImplCopyWith(
          _$MenuOptionCategoryResponseImpl value,
          $Res Function(_$MenuOptionCategoryResponseImpl) then) =
      __$$MenuOptionCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String classification,
      List<MenuOptionResponse> options,
      bool multipleSelection});
}

/// @nodoc
class __$$MenuOptionCategoryResponseImplCopyWithImpl<$Res>
    extends _$MenuOptionCategoryResponseCopyWithImpl<$Res,
        _$MenuOptionCategoryResponseImpl>
    implements _$$MenuOptionCategoryResponseImplCopyWith<$Res> {
  __$$MenuOptionCategoryResponseImplCopyWithImpl(
      _$MenuOptionCategoryResponseImpl _value,
      $Res Function(_$MenuOptionCategoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? options = null,
    Object? multipleSelection = null,
  }) {
    return _then(_$MenuOptionCategoryResponseImpl(
      classification: null == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<MenuOptionResponse>,
      multipleSelection: null == multipleSelection
          ? _value.multipleSelection
          : multipleSelection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuOptionCategoryResponseImpl implements _MenuOptionCategoryResponse {
  const _$MenuOptionCategoryResponseImpl(
      {required this.classification,
      required final List<MenuOptionResponse> options,
      required this.multipleSelection})
      : _options = options;

  factory _$MenuOptionCategoryResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MenuOptionCategoryResponseImplFromJson(json);

  @override
  final String classification;
  final List<MenuOptionResponse> _options;
  @override
  List<MenuOptionResponse> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final bool multipleSelection;

  @override
  String toString() {
    return 'MenuOptionCategoryResponse(classification: $classification, options: $options, multipleSelection: $multipleSelection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionCategoryResponseImpl &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.multipleSelection, multipleSelection) ||
                other.multipleSelection == multipleSelection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, classification,
      const DeepCollectionEquality().hash(_options), multipleSelection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionCategoryResponseImplCopyWith<_$MenuOptionCategoryResponseImpl>
      get copyWith => __$$MenuOptionCategoryResponseImplCopyWithImpl<
          _$MenuOptionCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuOptionCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _MenuOptionCategoryResponse
    implements MenuOptionCategoryResponse {
  const factory _MenuOptionCategoryResponse(
          {required final String classification,
          required final List<MenuOptionResponse> options,
          required final bool multipleSelection}) =
      _$MenuOptionCategoryResponseImpl;

  factory _MenuOptionCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$MenuOptionCategoryResponseImpl.fromJson;

  @override
  String get classification;
  @override
  List<MenuOptionResponse> get options;
  @override
  bool get multipleSelection;
  @override
  @JsonKey(ignore: true)
  _$$MenuOptionCategoryResponseImplCopyWith<_$MenuOptionCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MenuOptionResponse _$MenuOptionResponseFromJson(Map<String, dynamic> json) {
  return _MenuOptionResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuOptionResponse {
  int get menuOptionId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get optionPrice => throw _privateConstructorUsedError;
  bool get defaultOption => throw _privateConstructorUsedError;
  bool get adultMenu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuOptionResponseCopyWith<MenuOptionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionResponseCopyWith<$Res> {
  factory $MenuOptionResponseCopyWith(
          MenuOptionResponse value, $Res Function(MenuOptionResponse) then) =
      _$MenuOptionResponseCopyWithImpl<$Res, MenuOptionResponse>;
  @useResult
  $Res call(
      {int menuOptionId,
      String description,
      int optionPrice,
      bool defaultOption,
      bool adultMenu});
}

/// @nodoc
class _$MenuOptionResponseCopyWithImpl<$Res, $Val extends MenuOptionResponse>
    implements $MenuOptionResponseCopyWith<$Res> {
  _$MenuOptionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuOptionId = null,
    Object? description = null,
    Object? optionPrice = null,
    Object? defaultOption = null,
    Object? adultMenu = null,
  }) {
    return _then(_value.copyWith(
      menuOptionId: null == menuOptionId
          ? _value.menuOptionId
          : menuOptionId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      optionPrice: null == optionPrice
          ? _value.optionPrice
          : optionPrice // ignore: cast_nullable_to_non_nullable
              as int,
      defaultOption: null == defaultOption
          ? _value.defaultOption
          : defaultOption // ignore: cast_nullable_to_non_nullable
              as bool,
      adultMenu: null == adultMenu
          ? _value.adultMenu
          : adultMenu // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuOptionResponseImplCopyWith<$Res>
    implements $MenuOptionResponseCopyWith<$Res> {
  factory _$$MenuOptionResponseImplCopyWith(_$MenuOptionResponseImpl value,
          $Res Function(_$MenuOptionResponseImpl) then) =
      __$$MenuOptionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int menuOptionId,
      String description,
      int optionPrice,
      bool defaultOption,
      bool adultMenu});
}

/// @nodoc
class __$$MenuOptionResponseImplCopyWithImpl<$Res>
    extends _$MenuOptionResponseCopyWithImpl<$Res, _$MenuOptionResponseImpl>
    implements _$$MenuOptionResponseImplCopyWith<$Res> {
  __$$MenuOptionResponseImplCopyWithImpl(_$MenuOptionResponseImpl _value,
      $Res Function(_$MenuOptionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuOptionId = null,
    Object? description = null,
    Object? optionPrice = null,
    Object? defaultOption = null,
    Object? adultMenu = null,
  }) {
    return _then(_$MenuOptionResponseImpl(
      menuOptionId: null == menuOptionId
          ? _value.menuOptionId
          : menuOptionId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      optionPrice: null == optionPrice
          ? _value.optionPrice
          : optionPrice // ignore: cast_nullable_to_non_nullable
              as int,
      defaultOption: null == defaultOption
          ? _value.defaultOption
          : defaultOption // ignore: cast_nullable_to_non_nullable
              as bool,
      adultMenu: null == adultMenu
          ? _value.adultMenu
          : adultMenu // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuOptionResponseImpl implements _MenuOptionResponse {
  const _$MenuOptionResponseImpl(
      {required this.menuOptionId,
      required this.description,
      required this.optionPrice,
      required this.defaultOption,
      required this.adultMenu});

  factory _$MenuOptionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuOptionResponseImplFromJson(json);

  @override
  final int menuOptionId;
  @override
  final String description;
  @override
  final int optionPrice;
  @override
  final bool defaultOption;
  @override
  final bool adultMenu;

  @override
  String toString() {
    return 'MenuOptionResponse(menuOptionId: $menuOptionId, description: $description, optionPrice: $optionPrice, defaultOption: $defaultOption, adultMenu: $adultMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionResponseImpl &&
            (identical(other.menuOptionId, menuOptionId) ||
                other.menuOptionId == menuOptionId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.optionPrice, optionPrice) ||
                other.optionPrice == optionPrice) &&
            (identical(other.defaultOption, defaultOption) ||
                other.defaultOption == defaultOption) &&
            (identical(other.adultMenu, adultMenu) ||
                other.adultMenu == adultMenu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, menuOptionId, description,
      optionPrice, defaultOption, adultMenu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionResponseImplCopyWith<_$MenuOptionResponseImpl> get copyWith =>
      __$$MenuOptionResponseImplCopyWithImpl<_$MenuOptionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuOptionResponseImplToJson(
      this,
    );
  }
}

abstract class _MenuOptionResponse implements MenuOptionResponse {
  const factory _MenuOptionResponse(
      {required final int menuOptionId,
      required final String description,
      required final int optionPrice,
      required final bool defaultOption,
      required final bool adultMenu}) = _$MenuOptionResponseImpl;

  factory _MenuOptionResponse.fromJson(Map<String, dynamic> json) =
      _$MenuOptionResponseImpl.fromJson;

  @override
  int get menuOptionId;
  @override
  String get description;
  @override
  int get optionPrice;
  @override
  bool get defaultOption;
  @override
  bool get adultMenu;
  @override
  @JsonKey(ignore: true)
  _$$MenuOptionResponseImplCopyWith<_$MenuOptionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
