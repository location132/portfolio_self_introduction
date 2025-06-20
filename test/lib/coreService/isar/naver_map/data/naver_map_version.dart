// 네이버 맵 버전
import 'package:isar/isar.dart';

part 'naver_map_version.g.dart';

@collection
@Name("NaverMapVersion")
class NaverMapVersion {
  Id id = Isar.autoIncrement;

  String? ifsaiVersion; // 현재 유저 버전
  String? ifsaiServerMapVersion; //서버 버전

  NaverMapVersion({
    this.ifsaiVersion,
    this.ifsaiServerMapVersion,
  });
}
