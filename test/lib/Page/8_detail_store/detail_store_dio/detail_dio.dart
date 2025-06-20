import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';

// 해당 Market의 상세 정보 가져오기 ( 65 )[로그인 - 비로그인]
Future<Map<String, dynamic>> detailStoreDio(int severResult,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/markets/$severResult/details';

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
        return await detailStoreDio(severResult, cacheMemory: 1);
      }
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio65 - 캐시에서 데이터 가져옴' : 'dio65 - 네트워크에서 데이터 가져옴');
      return {
        'marketName': response.data['marketName'], // 매장 이름(ok)
        'marketImg': response.data['marketImage'], // 이미지(ok)
        'marketAddress': response.data['detailAddress'], // 장소
        'minimumOrderPrice': response.data['minimumOrderPrice'], // 최소 주문 금액
        'eventMessage': response.data['eventMessage'], // 이벤트 내용
        'openTime': response.data['openTime'], // 오픈 시간
        'closeTime': response.data['closeTime'], // 마감 시간
        'marketPhone': response.data['marketPhone'], // 매장 전화번호
        'reviewCount': response.data['reviewCount'], // 리뷰 갯수
        'averageReviewScore': response.data['averageReviewScore'], // 리뷰 점수
        'closeDays': response.data['closeDays'], // 휴업일
        'favorite': response.data['favorite'], // 좋아요 클릭 여부
      };
    } else {
      return {};
    }
  } catch (e) {
    print('dio 65 Error');
    print(e);
    return {};
  }
}

// 해당 Market의 메뉴 정보 가져오기 ( 66 )
Future<Map<String, dynamic>> detailStoreMenuDio(int severResult,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var url = '${dotenv.env['API_URL']}/v1/markets/$severResult/menus';

  try {
    var response = await dio.get(
      url,
      options: Options(
        extra: {
          'dio_cache_interceptor': cacheMemory,
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 304) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio66 - 캐시에서 데이터 가져옴' : 'dio66 - 네트워크에서 데이터 가져옴');

      List<dynamic> menuCategories = response.data;
      List<int> menuCounts = [];
      for (var category in menuCategories) {
        int count = category['menus'].length;
        menuCounts.add(count);
      }

      return {
        'titleCount': menuCategories.length.toString(),
        'menuCategories': menuCategories,
        'menuCounts': menuCounts,
      };
    } else {
      return {};
    }
  } catch (e) {
    print('dio 66 Error');
    print(e);
    return {};
  }
}

// [ 비-로그인 ] 해당 마켓에 다운로드 가능한 쿠폰 모두 조회 ( 115 )
Future<Map<String, dynamic>> loadCouponsData(int severResult,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var url = '${dotenv.env['API_URL']}/v1/markets/$severResult/coupons';
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

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

    if (response.statusCode == 200 || response.statusCode == 304) {
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await loadCouponsData(severResult, cacheMemory: 1);
      }
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio115 - 캐시에서 데이터 가져옴' : 'dio115 - 네트워크에서 데이터 가져옴');

      List<dynamic> coupon = response.data;
      return {'coupon': coupon, 'couponLength': coupon.length};
    } else {
      return {};
    }
  } catch (e) {
    print('dio 115 Error');
    if (e is DioException) {
      var responseData = e.response?.data;
      print(responseData);
    }
    return {};
  }
}

// [ 로그인 ] 쿠폰 다운로드 ( 119 )
Future<bool> downLoadCoupon(int couponId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var url = '${dotenv.env['API_URL']}/v1/markets/coupons/$couponId/downloads';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var responseData = await dio.post(url);
    if (responseData.statusCode == 200) {
      print('dio119');
      if (responseData.data.toString().contains('errorCode: -35')) {
        await dioCore(responseData.data);
        return await downLoadCoupon(couponId);
      }
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('dio 119 Error');
    if (e is DioException) {
      var errorCode = {e.response?.data}.toString();
      print(errorCode);
    }
    print(e);
    return false;
  }
}

// [ 로그인 ] 모든 쿠폰 다운로드 ( 120 )
Future<bool> downLoadCouponAll(int couponId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var url =
      '${dotenv.env['API_URL']}/v1/markets/$couponId/coupons/downloads/all';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var responseData = await dio.post(url);
    if (responseData.statusCode == 200) {
      print('dio120');
      if (responseData.data.toString().contains('errorCode: -35')) {
        await dioCore(responseData.data);
        return await downLoadCouponAll(couponId);
      }
      print('쿠폰 모두 받기 성공');
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('dio 120 Error');
    print(e);
    return false;
  }
}

// 해당 가게를 관심 목록 추가 [로그인] ( 43 )
Future<bool> addFavoriteStore(int marketId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var url = '${dotenv.env['API_URL']}/v1/markets/$marketId/favorites';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.post(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('dio 43 좋아요');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await addFavoriteStore(marketId);
      }
      return true;
    } else if (response.statusCode == 400) {
      print(response.data);
      return false;
    } else {
      return false;
    }
  } catch (e) {
    if (e is DioError) {
      // 400 상태 코드에 대한 처리 추가
      if (e.response?.statusCode == 400) {
        print('dio 43 좋아요 취소: ${e.response?.data}');
      }
    }
    return false;
  }
}
