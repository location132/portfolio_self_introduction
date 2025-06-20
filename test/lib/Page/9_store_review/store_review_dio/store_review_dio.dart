import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';

// [ 비 - 로그인 ]마켓에 등록된 리뷰 가져오기 ( 51 )
Future<Map<String, dynamic>> storeReviewContentDio(
    int marketId, String sort) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/markets/$marketId/reviews';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> data = {'marketId': marketId, 'sort': sort};

  try {
    var response = await dio.get(url, queryParameters: data);
    if (response.statusCode == 200) {
      print('dio51');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await storeReviewContentDio(marketId, sort);
      }
      return {'reviews': response.data};
    } else {
      return {};
    }
  } catch (e) {
    print('dio 51 Error');
    print(e);
    return {};
  }
}

// // [ 비 - 로그인 ] BEST 리뷰 가져오기 ( 55 ) (marketId)
Future<Map<String, dynamic>> bestStoreReviewContentDio(int marketId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/markets/reviews/top';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> data = {
    'marketId': marketId,
    "page": 0,
    "size": 1,
    "sort": ["string"]
  };

  try {
    var response = await dio.get(url, queryParameters: data);
    if (response.statusCode == 200) {
      print('dio55');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await bestStoreReviewContentDio(marketId);
      }
      return {'reviews': response.data};
    } else {
      return {};
    }
  } catch (e) {
    print('dio 55 Error');
    print(e);
    return {};
  }
}

// 리뷰 전체 갯수, 총 평점 및 점수 별 갯수 통계 가져오기 ( 52 )
Future<Map<String, dynamic>> marketStatisticsDio(int marketId) async {
  Dio dio = Dio();
  var url = '${dotenv.env['API_URL']}/v1/markets/$marketId/statistics';
  try {
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      print('dio52');
      return {
        'statistics': response.data['reviewStatisticData'],
        'averageScore': response.data['averageScore'],
      };
    } else {
      return {};
    }
  } catch (e) {
    print('dio 52 Error');
    print(e);
    return {};
  }
}

// 포토리뷰 가져오기 ( 60 )
Future<Map<String, dynamic>> storeReviewImagesDio(int marketId) async {
  Dio dio = Dio();
  var url = '${dotenv.env['API_URL']}/v1/markets/$marketId/reviews/images';

  Map<String, dynamic> data = {'marketId': marketId, 'size': 5};

  try {
    var response = await dio.get(url, data: data);
    if (response.statusCode == 200) {
      print('dio60');
      return {'photoreviews': response.data};
    } else {
      return {};
    }
  } catch (e) {
    print('dio 60 Error');
    print(e);
    return {};
  }
}

// [ 로그인 ] 리뷰 추천하기 ( 56 )
Future<Map<String, dynamic>> recommendReviewDio(int reviewId) async {
  Dio dio = Dio();

  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var url =
      '${dotenv.env['API_URL']}/v1/markets/reviews/$reviewId/recommendation';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.post(url);
    if (response.statusCode == 200) {
      print('dio56');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await recommendReviewDio(reviewId);
      }
      return {'success': true};
    } else {
      return {'success': false};
    }
  } catch (e) {
    print('dio 56 Error');
    return {'success': false};
  }
}

// [ 비 - 로그인 ] 특정 ID의 리뷰 데이터 가져오기 ( 53 )
Future<Map<String, dynamic>> fetchReviewDio(int reviewId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/markets/reviews/$reviewId';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      print('dio53');
      return {'review': response.data, 'statusCode': true};
    } else {
      return {
        'statusCode': false,
      };
    }
  } catch (e) {
    print('dio 53 Error');
    return {
      'statusCode': false,
    };
  }
}
