import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_version.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_dream/coreService/isar/app_version/data/version.dart';

@singleton
class IsarInitService {
  late final Future<Isar> isar;
  IsarInitService() {
    isar = openDB();
  }
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        AppVersionSchema,
        NaverMapVersionSchema,
        NaverMapDataSchema,
        NaverMapCategorySchema,
      ],
      directory: dir.path,
      name: 'ifsai_db',
    );
  }
}
