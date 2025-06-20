import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/14_affiliated_store/dio/affiliated_dio.dart';
import 'package:my_dream/model/affiliated_store.dart';

@singleton
class AffiliatedStoreRemoteSource {
  final AffiliatedDio affiliatedDio;

  AffiliatedStoreRemoteSource(this.affiliatedDio);

  Future<List<AffiliatedStoreModel>> getAffiliatedStores({
    int cacheMemory = 0,
    int page = 0,
  }) async {
    final response = await affiliatedDio.getAffiliatedStoresWithDioRequest(
      cacheMemory: cacheMemory,
      page: page,
    );

    return response.toModel();
  }
}
