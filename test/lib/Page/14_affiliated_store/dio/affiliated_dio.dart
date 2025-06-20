import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/repository/affiliated_store_api/affiliated_store_remote_response.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';

@singleton
class AffiliatedDio {
  late final Dio dio;
  var cookieJar = CookieJar();
  late final String baseUrl;

  AffiliatedDio() {
    baseUrl = dotenv.env['API_URL']!;
    _initDio();
  }

  Future<void> _initDio() async {
    dio = await setupDio(0);
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<AffiliatedStoreResponse> getAffiliatedStoresWithDioRequest({
    int cacheMemory = 0,
    int page = 0,
  }) async {
    try {
      if (cacheMemory > 0) {
        dio = await setupDio(cacheMemory);
        dio.interceptors.add(CookieManager(cookieJar));
      }

      Map<String, dynamic> requestData = {
        'page': page,
        'size': 10,
      };

      String? token = await storage.read(key: 'accessToken');
      if (token != null) {
        List<Cookie> cookies = [Cookie('accessToken', token)];
        cookieJar.saveFromResponse(
            Uri.parse('$baseUrl/v1/markets/affiliate'), cookies);
      }

      final response = await dio.get(
        '$baseUrl/v1/markets/affiliate',
        queryParameters: requestData,
        options: Options(
          extra: {
            'dio_cache_interceptor': cacheMemory,
          },
        ),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        bool isFromCache = response.statusCode == 304 ||
            (response.extra['fromCache'] ?? false);
        print(
            isFromCache ? 'dio141 - 캐시에서 데이터 가져옴' : 'dio141 - 네트워크에서 데이터 가져옴');

        if (response.data.toString().contains('errorCode: -35')) {
          await dioCore(response.data);
          return await getAffiliatedStoresWithDioRequest(
            cacheMemory: 1,
            page: page,
          );
        }

        return AffiliatedStoreResponse.fromJson(response.data);
      }
      return const AffiliatedStoreResponse();
    } catch (e) {
      print('Affiliated Store API Error: $e');
      return const AffiliatedStoreResponse();
    }
  }
}
