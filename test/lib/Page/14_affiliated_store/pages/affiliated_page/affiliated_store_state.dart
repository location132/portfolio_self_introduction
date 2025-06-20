import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/affiliated_store.dart';

part 'affiliated_store_state.freezed.dart';

@freezed
class AffiliatedStoreState with _$AffiliatedStoreState {
  const factory AffiliatedStoreState({
    @Default(ScreenState.loading) ScreenState screenState,
    @Default(1) int selectedFilter,
    @Default([]) List<AffiliatedStoreModel> stores,
    @Default(0) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _AffiliatedStoreState;
}

enum ScreenState {
  initial,
  loading,
  loaded,
  error,
}
