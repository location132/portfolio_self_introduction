// 사용자 검색기록 추가
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:team_between_leaf/core_services/authentication_dio.dart';

Future<void> saveHistory(String history, {int retry = 0}) async {
  Dio dio = Dio();
  String url = '${dotenv.env['API_URL']}/history';

  Map<String, dynamic> data = {"content": history};

  try {
    var respons = await dio.post(url,
        data: data,
        options: Options(headers: {
          "Authorization": await storage.read(key: 'accessToken')
        }));
    if (respons.statusCode == 200) {
    } else {}
  } catch (e) {
    print(e);
    if (retry < 1) {
      bool result = await sendrefreshToken();
      if (result) {
        return saveHistory(history, retry: 1);
      }
    } else {}
  }
}

//검색기록 모두 삭제
Future<void> sendremoveAllHistory({int retry = 0}) async {
  Dio dio = Dio();
  String url = '${dotenv.env['API_URL']}/history';

  try {
    var respons = await dio.delete(url,
        options: Options(headers: {
          "Authorization": await storage.read(key: 'accessToken')
        }));
    if (respons.statusCode == 200) {
      print('서버에 기록 삭제 요청 완료');
    } else {
      print('서버에 기록 삭제 요청 실패');
    }
  } catch (e) {
    if (retry < 1) {
      bool result = await sendrefreshToken();
      if (result) {
        return sendremoveAllHistory(retry: 1);
      }
    } else {}
  }
}

// 검색기록 하나 삭제
Future<void> sendremoveHistory(int historyId, {int retry = 0}) async {
  Dio dio = Dio();
  String url = '${dotenv.env['API_URL']}/history/$historyId';

  try {
    var respponse = await dio.delete(url,
        options: Options(headers: {
          "Authorization": await storage.read(key: 'accessToken')
        }));
    if (respponse.statusCode == 200) {
      print('검색기록 하나 삭제 성공');
    } else {}
  } catch (e) {
    if (retry < 1) {
      bool result = await sendrefreshToken();
      if (result) {
        return sendremoveHistory(historyId, retry: 1);
      }
    } else {}
  }
}

// 연관 검색어
Future<List<String>> sendRelatedSearch(String search, {int retry = 0}) async {
  Dio dio = Dio();

  String url = '${dotenv.env['API_URL']}/auto-complete';

  try {
    var response = await dio.get(url, queryParameters: {'word': search});
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data['result'];
      List<Map<String, dynamic>> result =
          responseData.map((item) => {"relatedSearch": item}).toList();

      result.sort((a, b) => b['relatedSearch']['frequency']
          .compareTo(a['relatedSearch']['frequency']));

      List<String> relatedSearch = result
          .map((item) => item['relatedSearch']['word'] as String)
          .toList();
      print(relatedSearch);
      return relatedSearch;
    } else {
      return [];
    }
  } catch (e) {
    if (retry < 1) {
      bool result = await sendrefreshToken();
      if (result) {
        return await sendRelatedSearch(search, retry: 1);
      }
    }
    return [];
  }
}

// 검색 글자 추가
Future<void> sendSearchHistory(String userSearch, {int retry = 0}) async {
  Dio dio = Dio();
  String url = '${dotenv.env['API_URL']}/auto-complete';
  Map<String, dynamic> data = {
    "word": userSearch,
  };
  try {
    var response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
    } else {}
  } catch (e) {
    if (retry < 1) {
      bool result = await sendrefreshToken();
      if (result) {
        return await sendSearchHistory(userSearch, retry: 1);
      }
    }
  }
}

// 사용자 검색 기록 불러오기 api
Future<List<Map<String, dynamic>>> getHistory({int count = 0}) async {
  Dio dio = Dio();
  String url = '${dotenv.env['API_URL']}/history';

  try {
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          "Authorization": await storage.read(key: 'accessToken'),
        },
      ),
    );
    if (response.statusCode == 200) {
      var responseData = response.data;
      List<dynamic> result = responseData['result'];
      List<Map<String, dynamic>> history = result.map((item) {
        return {
          'content': item['content'].toString(),
          'historyId': item['historyId']
        };
      }).toList();
      return history;
    } else {
      return [];
    }
  } catch (e) {
    if (count < 1) {
      bool reToken = await sendrefreshToken();
      if (reToken) {
        return getHistory(count: 1);
      }
    }
    return [];
  }
}
