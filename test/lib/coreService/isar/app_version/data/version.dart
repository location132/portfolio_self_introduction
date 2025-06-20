/*
앱 업데이트 시마다 버전 수정 필요
매우 중요
*/

import 'package:isar/isar.dart';

part 'version.g.dart';

// 앱 버전
@collection
@Name("AppVersion")
class AppVersion {
  Id id = Isar.autoIncrement;

  late String version;

  AppVersion({
    required this.version,
  });
}
