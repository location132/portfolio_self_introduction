import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class KakaoApiService {
  Future<List<dynamic>> searchBusinesses(String query) async {
    final String apiKey = dotenv.env['KAKAO_REST_API_KEY']!;

    Dio dio = Dio();
    final url = '${dotenv.env['KAKAO_API_URL']}?query=$query';
    final response = await dio.get(url,
        options: Options(
          headers: {'Authorization': 'KakaoAK $apiKey'},
        ));

    if (response.statusCode == 200) {
      final data = response.data;
      return data['documents'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
