import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';

// 모든 Market 정보 가져오기 [ distance 는 sort가 DISTANCE일때만 넣어주세요. ] ( 69 )
Future<List<Map<String, dynamic>>> mainScreenNewStore() async {
  List<Map<String, dynamic>> extractedData = [];

  Dio dio = Dio();

  var url = '${dotenv.env['API_URL']}/v1/markets';

  Map<String, dynamic> requestData = {
    'sort': 'HIGHEST_DISCOUNT',
    "locationX": 0,
    "locationY": 0,
    'page': 0
  };

  try {
    var response = await dio.get(url, queryParameters: requestData);

    if (response.statusCode == 200) {
      print('dio69');

      List<dynamic> market = response.data;

      for (var market in market) {
        Map<String, dynamic> data = {
          'marketId': market['marketId'],
          'locationX': market['locationX'],
          'locationY': market['locationY'],
          'marketImage': market['marketImage'],
          'marketName': market['marketName'],
          'marketDescription': market['marketDescription'], // 오픈 시간
          'detailAddress': market['detailAddress'], // 마감 시간
          'eventMessage': market['eventMessage'], // 거리
          'openTime': market['openTime'], // 거리
          'closeTime': market['closeTime'], // 거리
          'closedDays': market['closedDays'], // 거리
          'averageReviewScore': market['averageReviewScore'], // 거리
          'reviewCount': market['reviewCount'], // 거리
          'maxDiscountRate': market['maxDiscountRate'], // 거리
        };

        extractedData.add(data);
      }
      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 69 Error');
    print(e);
    return [];
  }
}

// Market 추천 알고리즘으로 추천 받기 ( 68 )
Future<List<Map<String, dynamic>>> mainScreenTop12() async {
  Dio dio = Dio();

  var url = '${dotenv.env['API_URL']}/v1/markets/recommendation';

  List<Map<String, dynamic>> extractedData = [];

  Map<String, dynamic> data = {
    'marketCount': 12,
  };

  try {
    var response = await dio.get(url, queryParameters: data);

    if (response.statusCode == 200) {
      print('dio68');
      List<dynamic> market = response.data;
      for (var market in market) {
        Map<String, dynamic> data = {
          'market0': market['marketImage'],
          'market1': market['marketName'],
          'market2': market['marketDescription'],
          'market3': market['averageReviewScore'],
          'market4': market['reviewCount'],
          'marketId': market['marketId']
        };
        extractedData.add(data);
      }

      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 68 Error');
    print(e);
    return [];
  }
}

// [ 비 - 로그인 ] BEST 리뷰 가져오기 ( 55 )
Future<List<Map<String, dynamic>>> mainScreenBestReviews() async {
  Dio dio = Dio();
  List<Map<String, dynamic>> extractedData = [];

  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/markets/reviews/top';
  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  Map<String, dynamic> data = {
    'page': 0,
    'size': 3,
    'sort': ['writeDate,desc'] // 수정된 정렬 파라미터
  };

  try {
    var serverResult = await dio.get(url, queryParameters: data);

    if (serverResult.statusCode == 200) {
      print('dio55');
      if (serverResult.data.toString().contains('errorCode: -35')) {
        await dioCore(serverResult.data);
        return await mainScreenBestReviews();
      }
      List<dynamic> reviewsData = serverResult.data;
      for (var reviewsData in reviewsData) {
        // 변수 이름 변경
        Map<String, dynamic> reviewMap = {
          'market0': reviewsData['writeDate'], // 글 쓴 시간
          'market1': reviewsData['reviewContent'], // 리뷰 내용
          'market2': reviewsData['images'][0]['image'], // 리뷰 이미지
          'market3': reviewsData['reviewerEmail'], // 리뷰 작성자
          'market4': reviewsData['recommendCount'], // 리뷰 추천수
          'market5': reviewsData['recommendation'], // 좋아요 했는지 안했는지
          'market6': reviewsData['reviewerImage'], // 작성자 프로필 이미지
          'market7': reviewsData['reviewId'], // 리뷰id
          'market8': reviewsData['marketId'], // 마켓id
        };
        extractedData.add(reviewMap);
      }

      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 55 Error');
    print('Error: $e');
    return [];
  }
}

// 특정 위치의 홍보 데이터 조회 [ MAIN : 메인 , ATTRACTION : 관광 조회 페이지 ] ( 91 )
// 특정 위치의 홍보 데이터 조회 (loaction = MAIN) ( 91_1 )
Future<List<Map<String, dynamic>>> mainScreenTourism(int size) async {
  Dio dio = Dio();
  var url = '${dotenv.env['API_URL']}/v1/MAIN/promotions';
  List<Map<String, dynamic>> extractedData = [];

  Map<String, dynamic> data = {
    'page': 0,
    'size': size,
    'sort': ['String']
  };

  try {
    var serverResult = await dio.get(url, queryParameters: data);

    if (serverResult.statusCode == 200) {
      print('dio91_1');
      List<dynamic> place = serverResult.data;

      for (var place in place) {
        Map<String, dynamic> data = {
          'market0': place['imageUrl'],
          'market1': place['tags'],
          'market2': place['introduce'],
        };

        extractedData.add(data);
      }

      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 91_1 Error');
    print(e);
    return [];
  }
}

// 특정 위치의 홍보 데이터 조회 (location=ATTRACTION) ( 91_2 )
Future<List<Map<String, dynamic>>> detailScreenTourism(int size) async {
  Dio dio = Dio();
  var url = '${dotenv.env['API_URL']}/v1/ATTRACTION/promotions';
  List<Map<String, dynamic>> extractedData = [];

  Map<String, dynamic> data = {
    'page': 0,
    'size': size,
    'sort': ['String']
  };

  try {
    var serverResult = await dio.get(url, queryParameters: data);

    if (serverResult.statusCode == 200) {
      print('dio91_2');
      List<dynamic> place = serverResult.data;

      for (var place in place) {
        Map<String, dynamic> data = {
          'market0': place['imageUrl'],
          'market1': place['tags'],
          'market2': place['introduce'],
        };

        extractedData.add(data);
      }

      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 91_2 Error');
    print(e);
    return [];
  }
}

// [ 로그인 ] 미션 데이터 목록 가져오기 ( 92 )
Future<List<Map<String, dynamic>>> mainScreenQuest() async {
  List<Map<String, dynamic>> extractedData = [];

  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/missions';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      print('dio92');
      List<dynamic> market = response.data;
      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await mainScreenQuest();
      }

      for (var market in market) {
        Map<String, dynamic> data = {
          'level': market['level'], // 현재 레벨
          // 'initWeight': market['initWeight'], // 초기 가중치
          'expValue': market['expValue'], // 내 진행도
          'weight_previousLevel': market['weight_previousLevel'], // 이전 레벨의 가중치
          'weight_currentLevel': market['weight_currentLevel'], // 현재 레벨의 가중치
          'weight_nextLevel': market['weight_nextLevel'], // 다음 레벨의 가증치
          'gainExp_previousLevel':
              market['gainExp_previousLevel'], // 이전 레벨에서 주는 경험치
          'gainExp_currentLevel':
              market['gainExp_currentLevel'], // 현재 레벨에서 주는 경험치
          'gainExp_nextLevel': market['gainExp_nextLevel'], // 다음 레벨에서 주는 경험치
          'message': market['message'], // 미션 내용
        };
        extractedData.add(data);
      }
      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 92 Error');
    return [];
  }
}

// [ 로그인 ] 미션 수행으로 인한 레벨 가져오기 ( 93 )
Future<Map<String, dynamic>> totalQuestLevel() async {
  Map<String, dynamic> serverData = {};
  Dio dio = Dio();

  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/missions/level';

  String? token = await storage.read(key: 'accessToken');

  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      print('dio93');
      serverData = response.data;
      return serverData;
    } else {
      print('dio93 Error');
      return {};
    }
  } catch (e) {
    print('dio93 Error');
    return {};
  }
}

// 모든 관광명소 데이터 가져오기 ( 17 )
Future<List<Map<String, dynamic>>> totalAttractions() async {
  List<Map<String, dynamic>> serverData = [];
  Dio dio = Dio();

  var url = '${dotenv.env['API_URL']}/v1/attractions';

  Map<String, dynamic> data = {
    'pageable': {"page": 0, "size": 10},
    'sort': 'RECENTLY_UPLOAD'
  };

  try {
    var response = await dio.get(url, queryParameters: data);

    if (response.statusCode == 200) {
      print('dio17');
      List<dynamic> place = [];
      place = response.data;

      for (var place in place) {
        Map<String, dynamic> data = {
          'attractionId': place['attractionId'],
          'attractionName': place['attractionName'],
          'attractionDescription': place['attractionDescription'],
          'imageUrl': place['imageUrl'],
          'openTime': place['openTime'],
          'closeTime': place['closeTime'],
          'eventMessage': place['eventMessage'],
          'locationX': place['locationX'],
          'locationY': place['locationY'],
        };

        serverData.add(data);
      }
      return serverData;
    } else {
      print('dio17 Error');
      return [];
    }
  } catch (e) {
    print(e);
    print('dio17 Error');
    return [];
  }
}
