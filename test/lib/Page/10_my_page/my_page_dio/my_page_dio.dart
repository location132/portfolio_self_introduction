import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';

// [ 로그인 ] 사용자 마이페이지 정보 가져오기 ( 4 )
Future<Map<String, dynamic>> myPageData({int cacheMemory = 2}) async {
  Dio dio = await setupDio(cacheMemory);

  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/accounts/my-page';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.get(
      url,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );
    if (response.statusCode == 200 // 서버데이터
            ||
            response.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio4 - 캐시에서 데이터 가져옴' : 'dio4 - 네트워크에서 데이터 가져옴');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await myPageData(cacheMemory: 1);
      }
      return {'status': response.data};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 4 Error');
    print(e);
    return {};
  }
}

// 모든 공지사항 데이터 가져오기 ( 11 )
Future<Map<String, dynamic>> announces(bool type, {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var url = '${dotenv.env['API_URL']}/v1/announces';

  Map<String, dynamic> data = {
    "page": 0,
    "size": 0,
    "sort": ["string"],
    'isImportant': type
  };

  try {
    var response = await dio.get(
      url,
      queryParameters: data,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );
    if (response.statusCode == 200 // 서버데이터
            ||
            response.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(
          '${isFromCache ? 'dio11 - 캐시에서 데이터 가져옴' : 'dio11 - 네트워크에서 데이터 가져옴'}, ${type ? '중요' : '일반'} 공지사항 데이터 가져옴'); // 캐시 여부와 중요 공지사항 여부 출력
      return {'status': response.data};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 11 Error');
    print(e);
    return {};
  }
}

// 특정 공지사항 데이터 가져오기 ( 12 )
Future<Map<String, dynamic>> announcesDetail(int announceId,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var url = '${dotenv.env['API_URL']}/v1/announces/$announceId';

  try {
    var response = await dio.get(
      url,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );
    if (response.statusCode == 200 // 서버데이터
            ||
            response.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio12 - 캐시에서 데이터 가져옴' : 'dio12 - 네트워크에서 데이터 가져옴');
      return {'status': response.data};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 12 Error');
    print(e);
    return {};
  }
}

// [ 비 - 로그인 ] 이벤트 데이터 가져오기 ( 20 )
Future<Map<String, dynamic>> events(bool type) async {
  Dio dio = Dio();

  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/events';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> data = {
    "isParticipant": type,
    "lastIndex": 0,
    "size": 110,
  };

  try {
    var response = await dio.get(url, queryParameters: data);
    if (response.statusCode == 200) {
      print('dio20');
      return {'status': response.data, 'itemLength': response.data.length};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 20 Error');
    return {};
  }
}

// 내가 추가한 관심가게 조회[로그인] ( 44 )
Future<Map<String, dynamic>> getFavorite(int lastIndex, int size,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);

  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/markets/favorites';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> data = {
    'locationX': 0,
    'locationY': 0,
    'lastIndex': lastIndex,
    'size': size,
  };

  try {
    var response = await dio.get(
      url,
      queryParameters: data,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );

    if (response.statusCode == 200 // 서버데이터
            ||
            response.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio44 - 캐시에서 데이터 가져옴' : 'dio44 - 네트워크에서 데이터 가져옴');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await getFavorite(lastIndex, size, cacheMemory: 1);
      }
      return {'status': response.data};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 44 Error');
    print(e);
    return {};
  }
}

// [ 로그인 ] 내가 추가한 관심 가게 제거 ( 46 )
Future<bool> deleteAllMarketFavorites(List<int> ids) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/markets/favorites';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var response = await dio.delete(
      uri,
      queryParameters: {'marketId': ids},
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('dio46');
      if (response.data != null &&
          response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await deleteAllMarketFavorites(ids);
      }
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('dio 46 오류: $e');
    if (e is DioException) {}
    return false;
  }
}

// 특정 이벤트 상세 정보 가져오기 ( 21 )
Future<Map<String, dynamic>> getEventDetail(int eventId,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var url = '${dotenv.env['API_URL']}/v1/events/$eventId';

  try {
    var response = await dio.get(
      url,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );
    if (response.statusCode == 200 // 서버데이터
            ||
            response.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio21 - 캐시에서 데이터 가져옴' : 'dio21 - 네트워크에서 데이터 가져옴');
      return {'status': response.data};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 21 Error');
    print(e);
    return {};
  }
}

// [ 로그인 ] 다운로드한 쿠폰 조회 ( 116 )
Future<Map<String, dynamic>> myCoupons({int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var url = '${dotenv.env['API_URL']}/v1/markets/coupons/downloads';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.get(
      url,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );

    if (response.statusCode == 200 // 서버데이터
            ||
            response.statusCode == 304 // 캐시데이터
        ) {
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await myCoupons(cacheMemory: 1);
      }
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio116 - 캐시에서 데이터 가져옴' : 'dio116 - 네트워크에서 데이터 가져옴');
      return {'status': response.data};
    } else {
      return {'status': null};
    }
  } catch (e) {
    print('dio 116 Error');
    return {'status': null};
  }
}
