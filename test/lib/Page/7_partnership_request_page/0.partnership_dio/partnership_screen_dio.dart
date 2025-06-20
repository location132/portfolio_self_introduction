import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';

// [ 비 - 로그인 ] 요청된 모든 파트너십 데이터 가져오기 ( 81 )
Future<List<Map<String, dynamic>>> partnershipData(int size,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/partners/requests';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> requestData = {'page': 0, 'size': size};

  try {
    var serverResult = await dio.get(
      url,
      queryParameters: requestData,
      options: Options(
        extra: {
          'dio_cache_interceptor': true,
        },
      ),
    );

    if (serverResult.statusCode == 200 // 서버데이터
            ||
            serverResult.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache = serverResult.statusCode == 304 ||
          (serverResult.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio81 - 캐시에서 데이터 가져옴' : 'dio81 - 네트워크에서 데이터 가져옴');

      if (serverResult.data.toString().contains('errorCode: -35')) {
        await dioCore(serverResult.data);
        return await partnershiHotData(size, cacheMemory: 1);
      }

      if (serverResult.data is List) {
        List<dynamic> partners = serverResult.data;
        return partners
            .map((partner) => {
                  'partnerRequestId': partner['partnerRequestId'],
                  'marketName': partner['title'],
                  'description': partner['description'],
                  'writeTime': partner['writeTime'],
                  'recommendCount': partner['recommendCount'],
                  'commentCount': partner['commentCount'],
                  'recommendation': partner['recommendation']
                })
            .toList();
      } else if (isFromCache && serverResult.data == null) {
        // 캐시에서 가져왔지만 데이터가 없는 경우, 네트워크에서 다시 요청
        print('캐시 데이터가 없어 네트워크에서 다시 요청합니다.');
        return await partnershipData(size);
      } else {
        //예상치 못한 데이터 형식을 받았을 때
        print('Unexpected data format: ${serverResult.data}');
        return [];
      }
    } else {
      // 상태 코드가 200이나 304가 아닐 경우
      print('Server returned status code: ${serverResult.statusCode}');
      return [];
    }
  } catch (e) {
    print('dio 81 Error: $e');
    return [];
  }
}

// [ 비 - 로그인 ] 가장 인기있는 파트너십 데이터 가져오기 ( 83 )
Future<List<Map<String, dynamic>>> partnershiHotData(int size,
    {int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/partners/requests/bests';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> requestData = {
    'size': size,
  };

  try {
    var serverResult = await dio.get(
      url,
      queryParameters: requestData,
      options: Options(
        extra: {
          'dio_cache_interceptor': true,
        },
      ),
    );

    if (serverResult.statusCode == 200 // 서버데이터
            ||
            serverResult.statusCode == 304 // 캐시데이터
        ) {
      bool isFromCache = serverResult.statusCode == 304 ||
          (serverResult.extra['fromCache'] ?? false);
      print(isFromCache ? 'dio83 - 캐시에서 데이터 가져옴' : 'dio83 - 네트워크에서 데이터 가져옴');

      if (serverResult.data.toString().contains('errorCode: -35')) {
        await dioCore(serverResult.data);
        return await partnershiHotData(size, cacheMemory: 1);
      }

      if (serverResult.data is List) {
        List<dynamic> partners = serverResult.data;
        return partners
            .map((partner) => {
                  'partnerRequestId': partner['partnerRequestId'],
                  'marketName': partner['title'],
                  'description': partner['description'],
                  'writeTime': partner['writeTime'],
                  'recommendCount': partner['recommendCount'],
                  'commentCount': partner['commentCount'],
                  'recommendation': partner['recommendation']
                })
            .toList();
      } else if (isFromCache && serverResult.data == null) {
        print('캐시 데이터가 없어 네트워크에서 다시 요청합니다.');
        return await partnershiHotData(size, cacheMemory: 1);
      } else {
        print('Unexpected data format: ${serverResult.data}');
        return [];
      }
    } else {
      print('Server returned status code: ${serverResult.statusCode}');
      return [];
    }
  } catch (e) {
    print('dio 83 Error: $e');
    return [];
  }
}

// [ 비 - 로그인 ] 파트너십 상세 데이터 가져오기 ( 82 )
Future<Map<String, dynamic>> partnershipGetDetailData(int partnershipId) async {
  Map<String, dynamic> extractedData = {};

  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/partners/requests/$partnershipId';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var serverResult = await dio.get(url);

    if (serverResult.statusCode == 200) {
      print('dio82');
      if (serverResult.data.toString().contains('errorCode: -35')) {
        await dioCore(serverResult.data);
        return await partnershipGetDetailData(partnershipId);
      }
      Map<String, dynamic> partner = serverResult.data;
      Map<String, dynamic> data = {
        'partnerRequestId': partner['partnerRequestId'],
        'marketName': partner['requestMarketName'],
        'title': partner['title'],
        'marketAddress': partner['marketAddress'],
        'marketDetailAddress': partner['marketDetailAddress'],
        'marketPhone': partner['marketPhone'],
        'description': partner['description'],
        'requestUserId': partner['requestUserId'],
        'requestUserEmail': partner['requestUserEmail'],
        'requestUserImageUrl': partner['requestUserImageUrl'],
        'writeTime': partner['writeTime'],
        'locationX': partner['locationX'],
        'locationY': partner['locationY'],
        'recommendation': partner['recommendation']
      };
      extractedData = data;

      return extractedData;
    } else {
      return {};
    }
  } catch (e) {
    print('dio 82 Error');
    print(e);
    return {};
  }
}

// [ 로그인 ] 파트너쉽 삭제 API ( 88 )
Future<Map<String, dynamic>> partnershipGetDetailDataDelete(
    int partnershipId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/partners/requests/$partnershipId';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.delete(url);
    if (response.statusCode == 204) {
      print('dio88');
      return {'status': 'true'};
    } else {
      print('Error: ${response.statusCode}');
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 88 Error');
    if (e is DioException && e.response?.statusCode == 400) {
      var responseData = e.response?.data;
      print(responseData);
      return {'status': responseData['responseCode']};
    } else {
      print(e);
      return {'status': 'false'};
    }
  }
}

// 해당 파트너쉽에 관련된 데이터 가져오기 ( 79 )
Future<List<Map<String, dynamic>>> partnershipGetCommentData(
    int partnershipId) async {
  List<Map<String, dynamic>> extractedData = [];

  Dio dio = Dio();

  var url =
      '${dotenv.env['API_URL']}/v1/partners/requests/$partnershipId/comments';

  Map<String, dynamic> data = {"lastIndex": 0, "size": 10};

  try {
    var serverResult = await dio.get(url, queryParameters: data);

    if (serverResult.statusCode == 200) {
      print('dio79');

      if (serverResult.data.toString().contains('errorCode: -35')) {
        await dioCore(serverResult.data);
        return await partnershipGetCommentData(partnershipId);
      }

      List<dynamic> partner = serverResult.data;

      for (var partner in partner) {
        Map<String, dynamic> data = {
          'commntId': partner['commentId'],
          'message': partner['message'],
          'imageUrl': partner['imageUrl'],
          'writeTime': partner['writeTime'],
          'writer': partner['writer'],
        };

        extractedData.add(data);
      }
      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 79 Error');
    print(e);
    return [];
  }
}

// [ 로그인 ] 파트너쉽 추천 API ( 85 )
Future<Map<String, dynamic>> partnershipRecommendation(
    int partnershipId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url =
      '${dotenv.env['API_URL']}/v1/partners/requests/$partnershipId/recommendation';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.post(url);
    if (response.statusCode == 200) {
      print('dio85');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await partnershipRecommendation(partnershipId);
      }
      return {'status': 'success'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 85 Error');
    if (e is DioException && e.response?.statusCode == 400) {
      return {'status': 'requestAgain'};
    } else {
      print(e);
      return {'status': 'false'};
    }
  }
}

// [ 로그인 ] 파트너쉽 추천 취소 API ( 86 )
Future<void> partnershipRecommendationDelete(int partnershipId) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url =
      '${dotenv.env['API_URL']}/v1/partners/requests/$partnershipId/recommendation';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.delete(url);
    if (response.statusCode == 200) {
      print('dio86');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await partnershipRecommendationDelete(partnershipId);
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('dio 86 Error');
    print(e);
  }
}

// [ 로그인 ] 파트너 십 요청에 대한 댓글 남기기 ( 77 )
Future<void> partnershipComment(int partnershipId, String message) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url =
      '${dotenv.env['API_URL']}/v1/partners/requests/$partnershipId/comments';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.post(
      url,
      data: {'message': message},
    );
    if (response.statusCode == 201) {
      print('dio77');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await partnershipComment(partnershipId, message);
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('dio 77 Error');
    print(e);
  }
}

// 전체 파트너십 데이터 갯수 가져오기 ( 84 )
Future<int> partnershipTotal({int cacheMemory = 0}) async {
  Dio dio = await setupDio(cacheMemory);

  var url = '${dotenv.env['API_URL']}/v1/partners/requests/totals';

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
      print(isFromCache ? 'dio84 - 캐시에서 데이터 가져옴' : 'dio84 - 네트워크에서 데이터 가져옴');
      return response.data;
    } else {
      return 0;
    }
  } catch (e) {
    print('dio 84 Error');
    return 0;
  }
}

// [ 로그인 ] 새로운 파트너십 요청 API ( 80 )
Future<Map<String, String>> partnershipRequest(
    String title,
    String name,
    String address,
    String detailAddress,
    String description,
    String phone,
    double latitude,
    double longitude) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Map<String, dynamic> data;

  var url = '${dotenv.env['API_URL']}/v1/partners/requests';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  data = {
    "requestMarketName": name,
    "marketAddress": address,
    "detailAddress": detailAddress,
    "phoneNumber": phone,
    "title": title,
    "description": description,
    "locationX": longitude,
    "locationY": latitude
  };

  try {
    var response = await dio.post(
      url,
      data: data,
    );
    if (response.statusCode == 201) {
      print('dio80');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await partnershipRequest(title, name, address, detailAddress,
            description, phone, latitude, longitude);
      }
      return {'status': 'true'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 80 Error');
    print(e);
    return {'status': 'error'};
  }
}

// [ 로그 ] 파트너쉽 수정 API ( 87 )
Future<Map<String, String>> partnershipRequestChange(
    int partnerRequestId,
    String title,
    String name,
    String address,
    String detailAddress,
    String description,
    String phone,
    double latitude,
    double longitude) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Map<String, dynamic> data;

  var url = '${dotenv.env['API_URL']}/v1/partners/requests/$partnerRequestId';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  data = {
    "requestMarketName": name,
    "marketAddress": address,
    "detailAddress": detailAddress,
    "phoneNumber": phone,
    "title": title,
    "description": description,
    "locationX": longitude,
    "locationY": latitude
  };

  try {
    var response = await dio.put(
      url,
      data: data,
    );
    if (response.statusCode == 200) {
      print('dio87');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await partnershipRequestChange(partnerRequestId, title, name,
            address, detailAddress, description, phone, latitude, longitude);
      }

      return {'status': 'true'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 87 Error');
    print(e);
    return {'status': 'error'};
  }
}
