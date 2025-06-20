import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_state.dart';
import 'package:my_dream/model/affiliated_store.dart';
import 'package:my_dream/repository/affiliated_store_api/affiliated_store_remote_service.dart';

@injectable
class AffiliatedStoreCubit extends Cubit<AffiliatedStoreState> {
  final AffiliatedStoreRemoteService _affiliatedStoreRemoteService;

  AffiliatedStoreCubit(this._affiliatedStoreRemoteService)
      : super(const AffiliatedStoreState(screenState: ScreenState.loading));

  @postConstruct
  void init() {
    getAffiliatedStore();
  }

  // 제휴 매장 조회 (첫 페이지)
  Future<void> getAffiliatedStore() async {
    try {
      emit(state.copyWith(screenState: ScreenState.loading));

      final List<AffiliatedStoreModel> stores =
          await _affiliatedStoreRemoteService.getAffiliatedStores();

      emit(state.copyWith(
        screenState: ScreenState.loaded,
        stores: stores,
        currentPage: 0,
        hasMore: stores.length >= 10,
      ));
    } catch (e) {
      emit(state.copyWith(screenState: ScreenState.error));
    }
  }

  // 추가 페이지 로드
  Future<void> loadMoreStores() async {
    if (!state.hasMore || state.screenState == ScreenState.loading) return;

    try {
      emit(state.copyWith(isLoadingMore: true));
      final nextPage = state.currentPage + 1;

      final List<AffiliatedStoreModel> newStores =
          await _affiliatedStoreRemoteService.getAffiliatedStores(
        page: nextPage,
      );

      if (newStores.isEmpty) {
        emit(state.copyWith(
          hasMore: false,
          isLoadingMore: false,
        ));
        return;
      }

      emit(state.copyWith(
        stores: [...state.stores, ...newStores],
        currentPage: nextPage,
        hasMore: newStores.length >= 10,
        isLoadingMore: false,
      ));
    } catch (e) {
      // 추가 로드 실패 시에는 현재 상태 유지
      print('추가 데이터 로드 실패: $e');
      emit(state.copyWith(isLoadingMore: false));
    }
  }
}
