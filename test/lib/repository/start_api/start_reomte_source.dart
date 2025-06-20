import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/core/dio/dio_core.dart';
import 'package:my_dream/model/ifsai.dart';

@singleton
class StartRemoteSource {
  // 서버 연결확인과 버전 체크(앱 버전, 네이버)
  Future<Ifsai> checkConnectionWithDio() async {
    var response = await connectionServer();

    return response.toModel();
  }
}
