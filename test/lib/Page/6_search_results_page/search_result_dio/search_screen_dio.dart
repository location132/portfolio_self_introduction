import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// category 와 Market 이름 에 해당되는 모든 Market 정보 가져오기 [ distance 는 sort가 DISTANCE일때만 넣어주세요. ] ( 74 )
Future<List<Map<String, dynamic>>> searchResultData(String keyword) async {
  List<Map<String, dynamic>> extractedData = [];

  Dio dio = Dio();

  var url =
      '${dotenv.env['API_URL']}/v1/markets/$keyword/categories/RESTAURANT';

  Map<String, dynamic> requestData = {
    "sort": "RECENTLY_UPLOAD",
    "locationX": 0,
    "locationY": 0,
    "page": 0,
    "size": 10,
  };

  try {
    var response = await dio.get(url, queryParameters: requestData);

    if (response.statusCode == 200) {
      print('dio74');
      List<dynamic> market = response.data;

      for (var market in market) {
        Map<String, dynamic> data = {
          'marketId': market['marketId'],
          'image': market['marketImage'],
          'name': market['marketName'],
          'description': market['marketDescription'],
          'eventMessage': market['eventMessage'],
          'openTime': market['openTime'],
          'closeTime': market['closeTime'],
          'distance': market['distance'],
          'closeDays': market['closedDays'],
          'reviewScore': market['averageReviewScore'],
          'reviewCount': market['reviewCount']
        };
        extractedData.add(data);
      }
      return extractedData;
    } else {
      return [];
    }
  } catch (e) {
    print('dio 74 Error');
    return [];
  }
}
