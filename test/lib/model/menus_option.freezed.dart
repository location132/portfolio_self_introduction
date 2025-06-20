// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menus_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuOptionsModel {
  List<MenuOptionCategory> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuOptionsModelCopyWith<MenuOptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionsModelCopyWith<$Res> {
  factory $MenuOptionsModelCopyWith(
          MenuOptionsModel value, $Res Function(MenuOptionsModel) then) =
      _$MenuOptionsModelCopyWithImpl<$Res, MenuOptionsModel>;
  @useResult
  $Res call({List<MenuOptionCategory> categories});
}

/// @nodoc
class _$MenuOptionsModelCopyWithImpl<$Res, $Val extends MenuOptionsModel>
    implements $MenuOptionsModelCopyWith<$Res> {
  _$MenuOptionsModelCopyWithImpl(this._value, this._then);

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
              as List<MenuOptionCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuOptionsModelImplCopyWith<$Res>
    implements $MenuOptionsModelCopyWith<$Res> {
  factory _$$MenuOptionsModelImplCopyWith(_$MenuOptionsModelImpl value,
          $Res Function(_$MenuOptionsModelImpl) then) =
      __$$MenuOptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuOptionCategory> categories});
}

/// @nodoc
class __$$MenuOptionsModelImplCopyWithImpl<$Res>
    extends _$MenuOptionsModelCopyWithImpl<$Res, _$MenuOptionsModelImpl>
    implements _$$MenuOptionsModelImplCopyWith<$Res> {
  __$$MenuOptionsModelImplCopyWithImpl(_$MenuOptionsModelImpl _value,
      $Res Function(_$MenuOptionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$MenuOptionsModelImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuOptionCategory>,
    ));
  }
}

/// @nodoc

class _$MenuOptionsModelImpl implements _MenuOptionsModel {
  const _$MenuOptionsModelImpl(
      {required final List<MenuOptionCategory> categories})
      : _categories = categories;

  final List<MenuOptionCategory> _categories;
  @override
  List<MenuOptionCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MenuOptionsModel(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionsModelImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionsModelImplCopyWith<_$MenuOptionsModelImpl> get copyWith =>
      __$$MenuOptionsModelImplCopyWithImpl<_$MenuOptionsModelImpl>(
          this, _$identity);
}

abstract class _MenuOptionsModel implements MenuOptionsModel {
  const factory _MenuOptionsModel(
          {required final List<MenuOptionCategory> categories}) =
      _$MenuOptionsModelImpl;

  @override
  List<MenuOptionCategory> get categories;
  @override
  @JsonKey(ignore: true)
  _$$MenuOptionsModelImplCopyWith<_$MenuOptionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenuOptionCategory {
  String get classification => throw _privateConstructorUsedError;
  List<MenuOption> get options => throw _privateConstructorUsedError;
  bool get multipleSelection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuOptionCategoryCopyWith<MenuOptionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionCategoryCopyWith<$Res> {
  factory $MenuOptionCategoryCopyWith(
          MenuOptionCategory value, $Res Function(MenuOptionCategory) then) =
      _$MenuOptionCategoryCopyWithImpl<$Res, MenuOptionCategory>;
  @useResult
  $Res call(
      {String classification,
      List<MenuOption> options,
      bool multipleSelection});
}

/// @nodoc
class _$MenuOptionCategoryCopyWithImpl<$Res, $Val extends MenuOptionCategory>
    implements $MenuOptionCategoryCopyWith<$Res> {
  _$MenuOptionCategoryCopyWithImpl(this._value, this._then);

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
              as List<MenuOption>,
      multipleSelection: null == multipleSelection
          ? _value.multipleSelection
          : multipleSelection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuOptionCategoryImplCopyWith<$Res>
    implements $MenuOptionCategoryCopyWith<$Res> {
  factory _$$MenuOptionCategoryImplCopyWith(_$MenuOptionCategoryImpl value,
          $Res Function(_$MenuOptionCategoryImpl) then) =
      __$$MenuOptionCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String classification,
      List<MenuOption> options,
      bool multipleSelection});
}

/// @nodoc
class __$$MenuOptionCategoryImplCopyWithImpl<$Res>
    extends _$MenuOptionCategoryCopyWithImpl<$Res, _$MenuOptionCategoryImpl>
    implements _$$MenuOptionCategoryImplCopyWith<$Res> {
  __$$MenuOptionCategoryImplCopyWithImpl(_$MenuOptionCategoryImpl _value,
      $Res Function(_$MenuOptionCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classification = null,
    Object? options = null,
    Object? multipleSelection = null,
  }) {
    return _then(_$MenuOptionCategoryImpl(
      classification: null == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<MenuOption>,
      multipleSelection: null == multipleSelection
          ? _value.multipleSelection
          : multipleSelection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MenuOptionCategoryImpl implements _MenuOptionCategory {
  const _$MenuOptionCategoryImpl(
      {required this.classification,
      required final List<MenuOption> options,
      required this.multipleSelection})
      : _options = options;

  @override
  final String classification;
  final List<MenuOption> _options;
  @override
  List<MenuOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final bool multipleSelection;

  @override
  String toString() {
    return 'MenuOptionCategory(classification: $classification, options: $options, multipleSelection: $multipleSelection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionCategoryImpl &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.multipleSelection, multipleSelection) ||
                other.multipleSelection == multipleSelection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, classification,
      const DeepCollectionEquality().hash(_options), multipleSelection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionCategoryImplCopyWith<_$MenuOptionCategoryImpl> get copyWith =>
      __$$MenuOptionCategoryImplCopyWithImpl<_$MenuOptionCategoryImpl>(
          this, _$identity);
}

abstract class _MenuOptionCategory implements MenuOptionCategory {
  const factory _MenuOptionCategory(
      {required final String classification,
      required final List<MenuOption> options,
      required final bool multipleSelection}) = _$MenuOptionCategoryImpl;

  @override
  String get classification;
  @override
  List<MenuOption> get options;
  @override
  bool get multipleSelection;
  @override
  @JsonKey(ignore: true)
  _$$MenuOptionCategoryImplCopyWith<_$MenuOptionCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenuOption {
  int get menuOptionId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get optionPrice => throw _privateConstructorUsedError;
  bool get defaultOption => throw _privateConstructorUsedError;
  bool get adultMenu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuOptionCopyWith<MenuOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionCopyWith<$Res> {
  factory $MenuOptionCopyWith(
          MenuOption value, $Res Function(MenuOption) then) =
      _$MenuOptionCopyWithImpl<$Res, MenuOption>;
  @useResult
  $Res call(
      {int menuOptionId,
      String description,
      int optionPrice,
      bool defaultOption,
      bool adultMenu});
}

/// @nodoc
class _$MenuOptionCopyWithImpl<$Res, $Val extends MenuOption>
    implements $MenuOptionCopyWith<$Res> {
  _$MenuOptionCopyWithImpl(this._value, this._then);

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
abstract class _$$MenuOptionImplCopyWith<$Res>
    implements $MenuOptionCopyWith<$Res> {
  factory _$$MenuOptionImplCopyWith(
          _$MenuOptionImpl value, $Res Function(_$MenuOptionImpl) then) =
      __$$MenuOptionImplCopyWithImpl<$Res>;
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
class __$$MenuOptionImplCopyWithImpl<$Res>
    extends _$MenuOptionCopyWithImpl<$Res, _$MenuOptionImpl>
    implements _$$MenuOptionImplCopyWith<$Res> {
  __$$MenuOptionImplCopyWithImpl(
      _$MenuOptionImpl _value, $Res Function(_$MenuOptionImpl) _then)
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
    return _then(_$MenuOptionImpl(
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

class _$MenuOptionImpl implements _MenuOption {
  const _$MenuOptionImpl(
      {required this.menuOptionId,
      required this.description,
      required this.optionPrice,
      required this.defaultOption,
      required this.adultMenu});

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
    return 'MenuOption(menuOptionId: $menuOptionId, description: $description, optionPrice: $optionPrice, defaultOption: $defaultOption, adultMenu: $adultMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, menuOptionId, description,
      optionPrice, defaultOption, adultMenu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionImplCopyWith<_$MenuOptionImpl> get copyWith =>
      __$$MenuOptionImplCopyWithImpl<_$MenuOptionImpl>(this, _$identity);
}

abstract class _MenuOption implements MenuOption {
  const factory _MenuOption(
      {required final int menuOptionId,
      required final String description,
      required final int optionPrice,
      required final bool defaultOption,
      required final bool adultMenu}) = _$MenuOptionImpl;

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
  _$$MenuOptionImplCopyWith<_$MenuOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
