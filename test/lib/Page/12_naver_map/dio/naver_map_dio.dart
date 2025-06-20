import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/repository/naver_map_api/nver_map_response.dart';

@singleton
class NaverMapDio {
  late final Dio dio;
  var cookieJar = CookieJar();
  late final String baseUrl;

  NaverMapDio() {
    baseUrl = dotenv.env['API_URL']!;
    _initDio();
  }

  Future<void> _initDio() async {
    dio = Dio();
  }

  Future<NaverMapResponse> getNaverMapData({
    required int page,
    required int size,
  }) async {
    try {
      Map<String, dynamic> requestData = {
        'page': page,
        'size': size,
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
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data.toString().contains('errorCode: -35')) {
          await dioCore(response.data);
          return await getNaverMapData(
            page: page,
            size: size,
          );
        }
        return NaverMapResponse.fromJson(response.data);
      }
      return const NaverMapResponse(markets: []);
    } catch (e) {
      print('Naver Map API Error: $e');
      return const NaverMapResponse(markets: []);
    }
  }
}
