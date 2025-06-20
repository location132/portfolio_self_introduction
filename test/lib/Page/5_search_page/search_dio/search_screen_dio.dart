import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';

// [ 로그인 ] History 정보 가져오기 ( 25 )
Future<List<Map<String, dynamic>>> recentSearch({int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  List<Map<String, dynamic>> userRecentSearch = [];

  var uri = '${dotenv.env['API_URL']}/v1/histories';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var respons = await dio.get(uri);
    if (respons.statusCode == 200 || respons.statusCode == 304) {
      bool isFromCache =
          respons.statusCode == 304 || (respons.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio25 - 캐시에서 데이터 가져옴' : 'dio25 - 네트워크에서 데이터 가져옴');
      if (respons.data.toString().contains('errorCode: -35')) {
        await dioCore(respons.data);
        return await recentSearch();
      } else {
        List<dynamic> responsdata = respons.data;
        for (var reponsedata in responsdata) {
          Map<String, dynamic> data = {
            'content': reponsedata['content'],
            'historyId': reponsedata['historyId'],
          };
          userRecentSearch.add(data);
        }
        return userRecentSearch;
      }
    } else {
      return userRecentSearch;
    }
  } catch (e) {
    print('dio 25 Error');
    return [];
  }
}

// [ 로그인 ] History 데이터 추가 ( 26 )
Future<bool> userHistory(String value, {int retry = 0}) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/histories';

  Map<String, String> data = {"content": value};

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  if (retry <= 1) {
    try {
      var response = await dio.post(uri, data: data);
      if (response.statusCode == 201) {
        print('dio26');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('dio 26 Error');
      if (e is DioException) {
        //return userHistory(value, retry: retry + 1);
        return false;
      } else {
        return false;
      }
    }
  } else {
    return false;
  }
}

// 인기 검색어 조회 ( 98 )
Future<List<Map<String, dynamic>>> popularSearches(
    {int cacheMemory = 3}) async {
  Dio dio = await setupDio(cacheMemory);
  var uri = '${dotenv.env['API_URL']}/v1/popular-search-word';
  List<Map<String, dynamic>> popularSearchesValue = [];

  Map<String, dynamic> sendData = {'size': '10'};

  try {
    var response = await dio.get(uri, queryParameters: sendData);

    if (response.statusCode == 200 || response.statusCode == 304) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio98 - 캐시에서 데이터 가져옴' : 'dio98 - 네트워크에서 데이터 가져옴');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await popularSearches();
      } else {
        List<dynamic> data = response.data;
        for (var item in data) {
          Map<String, dynamic> value = {
            'value0': item['searchWord'],
            'value1': item['rankChangeValue'],
          };

          popularSearchesValue.add(value);
        }
        return popularSearchesValue;
      }
    } else {
      return [];
    }
  } catch (e) {
    print('dio 98 Error');
    return [];
  }
}

// [ 로그인 ] 인기 검색어 업데이트 및 등록 ( 99 )
Future<void> postPopularSearches(String value) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/popular-search-word';

  Map<String, dynamic> sendData = {'searchWord': value};
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var response = await dio.post(uri, data: sendData);

    if (response.statusCode == 200) {
      print('dio99');
      if (response.data.toString().contains('errorCode: -35')) {
        dioCore(response.data);
        return await postPopularSearches(value);
      }
    } else {}
  } catch (e) {
    print('dio 99 Error');
  }
}

// [ 로그인 ] 모든 History 제거 ( 27 )
Future<bool> deleteAllSearchHistory() async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/histories/all';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var response = await dio.delete(uri);
    print('dio27');
    return response.statusCode == 200;
  } catch (e) {
    print('dio 27 Error');
    return false;
  }
}

// [ 로그인 ] 특정 History 제거 ( 28 )
Future<bool> deleteSearchHistory(int historyId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/histories/$historyId';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    print('dio28');
    var response = await dio.delete(uri);
    return response.statusCode == 200;
  } catch (e) {
    print('dio 28 Error');
    return false;
  }
}

// 빈도수를 기반으로 자동 검색 탐색 ( 96 )
Future<List<String>> sendRelatedSearch(String value) async {
  Dio dio = Dio();
  var uri = '${dotenv.env['API_URL']}/v1/auto-complete';

  Map<String, dynamic> data = {'word': value};

  try {
    var response = await dio.get(uri, queryParameters: data);
    if (response.statusCode == 200) {
      print('dio96');
      List<dynamic> result = response.data;
      return result.map((item) => item['word'] as String).toList();
    } else {
      return [];
    }
  } catch (e) {
    print('dio 96 Error');
    return [];
  }
}
