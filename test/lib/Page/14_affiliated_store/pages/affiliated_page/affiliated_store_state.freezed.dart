// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affiliated_store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AffiliatedStoreState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  int get selectedFilter => throw _privateConstructorUsedError;
  List<AffiliatedStoreModel> get stores => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AffiliatedStoreStateCopyWith<AffiliatedStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffiliatedStoreStateCopyWith<$Res> {
  factory $AffiliatedStoreStateCopyWith(AffiliatedStoreState value,
          $Res Function(AffiliatedStoreState) then) =
      _$AffiliatedStoreStateCopyWithImpl<$Res, AffiliatedStoreState>;
  @useResult
  $Res call(
      {ScreenState screenState,
      int selectedFilter,
      List<AffiliatedStoreModel> stores,
      int currentPage,
      bool hasMore,
      bool isLoadingMore});
}

/// @nodoc
class _$AffiliatedStoreStateCopyWithImpl<$Res,
        $Val extends AffiliatedStoreState>
    implements $AffiliatedStoreStateCopyWith<$Res> {
  _$AffiliatedStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? selectedFilter = null,
    Object? stores = null,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as int,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<AffiliatedStoreModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AffiliatedStoreStateImplCopyWith<$Res>
    implements $AffiliatedStoreStateCopyWith<$Res> {
  factory _$$AffiliatedStoreStateImplCopyWith(_$AffiliatedStoreStateImpl value,
          $Res Function(_$AffiliatedStoreStateImpl) then) =
      __$$AffiliatedStoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenState screenState,
      int selectedFilter,
      List<AffiliatedStoreModel> stores,
      int currentPage,
      bool hasMore,
      bool isLoadingMore});
}

/// @nodoc
class __$$AffiliatedStoreStateImplCopyWithImpl<$Res>
    extends _$AffiliatedStoreStateCopyWithImpl<$Res, _$AffiliatedStoreStateImpl>
    implements _$$AffiliatedStoreStateImplCopyWith<$Res> {
  __$$AffiliatedStoreStateImplCopyWithImpl(_$AffiliatedStoreStateImpl _value,
      $Res Function(_$AffiliatedStoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? selectedFilter = null,
    Object? stores = null,
    Object? currentPage = null,
    Object? hasMore = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$AffiliatedStoreStateImpl(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as int,
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<AffiliatedStoreModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AffiliatedStoreStateImpl implements _AffiliatedStoreState {
  const _$AffiliatedStoreStateImpl(
      {this.screenState = ScreenState.loading,
      this.selectedFilter = 1,
      final List<AffiliatedStoreModel> stores = const [],
      this.currentPage = 0,
      this.hasMore = true,
      this.isLoadingMore = false})
      : _stores = stores;

  @override
  @JsonKey()
  final ScreenState screenState;
  @override
  @JsonKey()
  final int selectedFilter;
  final List<AffiliatedStoreModel> _stores;
  @override
  @JsonKey()
  List<AffiliatedStoreModel> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'AffiliatedStoreState(screenState: $screenState, selectedFilter: $selectedFilter, stores: $stores, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffiliatedStoreStateImpl &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenState,
      selectedFilter,
      const DeepCollectionEquality().hash(_stores),
      currentPage,
      hasMore,
      isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AffiliatedStoreStateImplCopyWith<_$AffiliatedStoreStateImpl>
      get copyWith =>
          __$$AffiliatedStoreStateImplCopyWithImpl<_$AffiliatedStoreStateImpl>(
              this, _$identity);
}

abstract class _AffiliatedStoreState implements AffiliatedStoreState {
  const factory _AffiliatedStoreState(
      {final ScreenState screenState,
      final int selectedFilter,
      final List<AffiliatedStoreModel> stores,
      final int currentPage,
      final bool hasMore,
      final bool isLoadingMore}) = _$AffiliatedStoreStateImpl;

  @override
  ScreenState get screenState;
  @override
  int get selectedFilter;
  @override
  List<AffiliatedStoreModel> get stores;
  @override
  int get currentPage;
  @override
  bool get hasMore;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$AffiliatedStoreStateImplCopyWith<_$AffiliatedStoreStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
