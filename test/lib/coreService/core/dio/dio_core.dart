import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/repository/start_api/start_remote_response.dart';

// 토큰 재발급 (에러코드 -35)
Future<void> dioCore(var message) async {
  print('토큰 재발급 에러코드 -35');
  await storage.write(
    key: 'accessToken',
    value: message['data']['accessToken'],
  );
}

// 알수 없는 예외 (에러코드 -1) 사용자를 찾을 수 없습니다.
Future<void> dioCoreTokenDelete() async {
  print('토큰 삭제 에러코드 -1');
  await storage.delete(
    key: 'accessToken',
  );
}

// 알수 없는 예외 (에러코드 -1) 사용자를 찾을 수 없습니다. +로그아웃
Future<void> dioCoreTokenDelete2() async {
  print('토큰 삭제 에러코드 -31');
  await storage.delete(
    key: 'accessToken',
  );
}

// 서버와 연결 여부 확인 API [ 서버 점검 여부 ] ( 101 )
Future<StartIfsaiResponse> connectionServer() async {
  Dio dio = Dio();
  var uri = '${dotenv.env['API_URL']}/v1/security/is-connect';
  try {
    print('check ==> uri : $uri');
    var response = await dio.get(uri);

    if (response.statusCode == 200) {
      print('dio101');
      return StartIfsaiResponse(
        isServerConnected: true,
        appVersion: response.data['appVersion'],
        marketDataVersion: response.data['marketDataVersion'],
      );
    } else {
      return const StartIfsaiResponse(
        isServerConnected: false,
        appVersion: null,
        marketDataVersion: null,
      );
    }
  } catch (e) {
    print(e);
    print('dio 101 Error');
    return const StartIfsaiResponse(
      isServerConnected: false,
      appVersion: null,
      marketDataVersion: null,
    );
  }
}
