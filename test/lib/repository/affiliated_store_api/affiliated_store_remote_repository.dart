import 'package:injectable/injectable.dart';
import 'package:my_dream/model/affiliated_store.dart';
import 'package:my_dream/repository/affiliated_store_api/affiliated_store_remote_source.dart';

@singleton
class AffiliatedStoreRemoteRepository {
  final AffiliatedStoreRemoteSource _affiliatedStoreRemoteSource;

  AffiliatedStoreRemoteRepository(this._affiliatedStoreRemoteSource);

  // 제휴 매장 조회
  Future<List<AffiliatedStoreModel>> getAffiliatedStores({
    int cacheMemory = 0,
    int page = 0,
  }) async {
    return await _affiliatedStoreRemoteSource.getAffiliatedStores(
      cacheMemory: cacheMemory,
      page: page,
    );
  }
}
