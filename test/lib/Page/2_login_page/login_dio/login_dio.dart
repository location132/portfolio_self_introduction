import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';

const storage = FlutterSecureStorage();
var cookieJar = CookieJar();

// OAuth 로그인 ( 75 )
Future<Map<String, dynamic>> snsLogin(String type, String accessToken) async {
  Dio dio = Dio();
  var url = '${dotenv.env['API_URL']}/v1/account/oauth/sign-in';
  Map<String, dynamic> data = {'type': type, 'accessToken': accessToken};

  try {
    var response = await dio.post(url, data: data);
    if (response.statusCode == 200) {
      print('dio75');
      await storage.write(
          key: 'accessToken', value: response.data['accessToken']);
      return {'status': 'success'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 75 Error');
    return {'status': 'false'};
  }
}

// [ 로그인 ] OAuth 새로운 계정 이전 ( 76 )
Future<bool> changeSNSLogin(String targetEmail) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/account/oauth/transfer';

  Map<String, dynamic> data = {
    "targetEmail": targetEmail,
  };

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var reponse = await dio.patch(url, data: data);
    if (reponse.statusCode == 200) {
      print('dio76');

      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('dio 76 Error');
    if (e is DioException) {}
    return false;
  }
}

// 로그아웃 함수
Future<void> ifsaiLogout() async {
  await storage.delete(key: 'accessToken');
}

// [ 로그인 ] 학생으로 권한 변경을 위한 메일 전송 API ( 9 )
Future<Map<String, dynamic>> sendStudentEmail(String email) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/accounts/certs/students/send-mail';

  Map<String, dynamic> data = {
    "schoolEmail": email,
  };

  // 쿠키 설정
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );
    if (response.statusCode == 200) {
      print('dio9');
      return {'status': 'true'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 9 Error');
    print(e);

    if (e is DioException) {
      var errorCode = {e.response?.data}.toString();
      print(errorCode);
      if (errorCode.contains('네이버')) {
        return {'status': '네이버'};
      } else if (errorCode.contains('kakao')) {
        return {'status': 'kakao'};
      } else if (errorCode.contains('구글')) {
        return {'status': '구글'};
      } else if (errorCode.contains('애플')) {
        return {'status': '애플'};
      }
    }
    return {'status': 'severError'};
  }
}

// [ 로그인 ] 학생으로 권한 변경을 위한 메일 확인 API ( 10 )
Future<Map<dynamic, String>> emailCode(
    String authenticationCode, String userEmail) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();

  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/accounts/certs/students/code-check';

  Map<String, dynamic> data = {
    "email": userEmail,
    "code": authenticationCode,
  };

  // 쿠키 설정
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.patch(url, data: data);

    if (response.statusCode == 200) {
      print('dio10');
      return {'status': 'success'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('dio 10 Error');
    if (e is DioException) {
      var errorCode = {e.response?.data}.toString();
      print(errorCode);
      if (errorCode.contains('errorCode: -5')) {
        return {'status': 'errorCode: -5'};
      } else if (errorCode.contains('errorCode: -21')) {
        String targetEmail =
            errorCode.split('data:').last.split('}}').first.trim();
        return {'status': 'errorCode: -21', 'targetEmail': targetEmail};
      }
      return {'status': 'unexpectedError', 'message': e.toString()};
    }
    return {'status': 'unexpectedError', 'message': e.toString()};
  }
}

// [ 로그인 ] 사용자 정보 가져오기 ( 3 )
Future<Map<String, dynamic>> patchRoleSendSever() async {
  Dio dio = Dio();
  var cookieJar = CookieJar();

  // Dio에 쿠키 매니저 추가
  dio.interceptors.add(CookieManager(cookieJar));

  var url = '${dotenv.env['API_URL']}/v1/accounts/profiles';

  // 쿠키 설정
  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    // URL을 기반으로 쿠키 설정
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(url), cookies);
  }

  try {
    var response = await dio.get(
      url,
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );

    if (response.statusCode == 200) {
      print('dio3');

      if (response.data.toString().contains('errorCode: -35')) {
        await dioCore(response.data);
        return await patchRoleSendSever();
      }
      var responseData = response.data;
      bool isStudents = responseData['role'].toString().toUpperCase() == '학생';
      if (isStudents) {
        return {
          'school': true,
          'image': responseData['profileImage'],
          'userEmail': responseData['email'],
          'basketCount': responseData['basketMenuCount']
        };
      } else {
        return {
          'school': false,
          'image': responseData['profileImage'],
          'userEmail': responseData['email'],
          'basketCount': 0
        };
      }
    } else {
      return {'status': 'is Sever Error'};
    }
  } catch (e) {
    print('dio 3 Error');
    return {'status': 'is Sever Error'};
  }
}

// [ 로그인 ] 토큰 재발급 API ( 2 )
Future<bool> acconutsTK() async {
  Dio dio = Dio();
  var cookieJar = CookieJar();

  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/accounts/tokens';

  String? token = await storage.read(key: 'accessToken');
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var result = await dio.post(uri);
    if (result.statusCode == 200) {
      print('dio2');
      storage.write(key: 'accessToken', value: result.data['accessToken']);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('dio 2 Error');
    if (e is DioException) {
      var errorCode = {e.response?.data}.toString();
      print(errorCode);
      // 알수 없는 예외 (에러코드 -1) 사용자를 찾을 수 없습니다.
      if (errorCode.toString().contains('errorCode: -1')) {
        await dioCoreTokenDelete();
        return false;
      } else if (errorCode.toString().contains('errorCode: -31')) {
        await dioCoreTokenDelete();
        return false;
      }
    }
    return false;
  }
}
