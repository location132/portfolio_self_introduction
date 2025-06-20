// [ 로그인 ] 내가 추가한 관심 가게 제거 ( 46 )
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_response.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_response.dart';

// [ 로그인 ] 장바구니에 추가 API ( 29 )
Future<bool> addToCart(
    int marketId, int menuId, Map<String, dynamic> data, int amount) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/markets/$marketId/baskets';

  // 토큰 가져오기
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  // 서버로 보낼 데이터 구조
  Map<String, dynamic> postData = {
    'menuId': menuId,
    'menuOptionIds': data['menuOptionIds'],
    'amount': amount,
  };

  try {
    // POST 요청 보내기
    print('dio 29');
    var response = await dio.post(uri, data: postData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data != null &&
          response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await addToCart(marketId, menuId, data, amount); // 재시도
      }
      return true; // 성공
    } else {
      print(response.statusCode);
      return false; // 실패
    }
  } catch (e) {
    print('장바구니 추가 오류: $e');
    if (e is DioException) {
      print(e);
    }
    return false; // 오류 처리
  }
}

// [ 로그인 ] 장바구니 옵션 수정 ( 30 )
Future<bool> putMyCartOptionWithDio(
    int basketMenuId, Map<String, dynamic> data, int amount) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/markets/baskets/$basketMenuId';

  // 토큰 가져오기
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  Map<String, dynamic> postData = {
    'menuOptionIds': data['menuOptionIds'],
    'amount': amount,
  };

  try {
    var response = await dio.put(uri, data: postData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('dio 30');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await putMyCartOptionWithDio(basketMenuId, data, amount);
      }
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    print('장바구니 옵션 수정 오류 dio 30: $e');
    if (e is DioException) {
      print(e);
    }
    return false;
  }
}

// [ 로그인 ] 장바구니에서 모두 가져오기 ( 32 )
Future<CartResponse> getMyCartWithDioRequest({int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/markets/baskets/all';

  // 토큰 가져오기
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  // 서버로 보낼 데이터 구조
  Map<String, dynamic> postData = {'lastIndex': 0, 'size': 10};

  try {
    var response = await dio.get(uri, queryParameters: postData);

    if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio32 - 캐시에서 데이터 가져옴' : 'dio32 - 네트워크에서 데이터 가져옴');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await getMyCartWithDioRequest(cacheMemory: 1);
      }
      return CartResponse.fromJson({'carts': response.data});
    } else {
      print(response.statusCode);
      return CartResponse.fromJson({});
    }
  } catch (e) {
    print('장바구니 가져오기 오류 dio 32: $e');
    if (e is DioException) {
      print(e);
    }
    return CartResponse.fromJson({});
  }
}

// [ 로그인 ] 사이드 메뉴 추천 ( 125 )
Future<RecommendedSideMenuResponse> getRecommendedSideMenuRequest(int marketId,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri =
      '${dotenv.env['API_URL']}/v1/markets/$marketId/menus/side-recommendation';

  try {
    final response = await dio.get(uri);

    if (response.statusCode == 200 || response.statusCode == 304) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio125 - 캐시에서 데이터 가져옴' : 'dio125 - 네트워크에서 데이터 가져옴');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await getRecommendedSideMenuRequest(marketId, cacheMemory: 1);
      }
      return RecommendedSideMenuResponse.fromJson({'sideMenus': response.data});
    }
    return const RecommendedSideMenuResponse(sideMenus: []);
  } catch (e) {
    print('사이드 메뉴 추천 요청 실패: $e');
    return const RecommendedSideMenuResponse(sideMenus: []);
  }
}

// [ 로그인 ] 장바구니 삭제 ( 33 )
Future<bool> deleteShoppingCart(List<int> basketMenuIds) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/markets/baskets/menus';

  // 토큰 가져오기
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var response =
        await dio.delete(uri, queryParameters: {'basketMenuId': basketMenuIds});
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      print('dio 33');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await deleteShoppingCart(basketMenuIds);
      }
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  } catch (e) {
    print('장바구니 삭제 오류 dio 33: $e');
    if (e is DioException) {
      print(e);
    }
    return false;
  }
}

// 해당 Market의 메뉴 옵션 정보 가져오기 ( 67 )
Future<MenuOptionsResponse> getmenusOptionsWithDio(int menuID,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  //수정
  var url = '${dotenv.env['API_URL']}/v1/markets/menus/$menuID/options';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }
  try {
    var response = await dio.get(url);
    if (response.statusCode == 200 || response.statusCode == 304) {
      bool isFromCache =
          response.statusCode == 304 || (response.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio67 - 캐시에서 데이터 가져옴' : 'dio67 - 네트워크에서 데이터 가져옴');
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await getmenusOptionsWithDio(menuID, cacheMemory: 1);
      } else {
        return MenuOptionsResponse.fromJson(response.data);
      }
    } else {
      return const MenuOptionsResponse(categories: []);
    }
  } catch (e) {
    print('dio 67 Error');
    return const MenuOptionsResponse(categories: []);
  }
}
