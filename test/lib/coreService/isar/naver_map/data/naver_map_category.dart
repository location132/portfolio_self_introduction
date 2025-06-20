import 'package:isar/isar.dart';

part 'naver_map_category.g.dart';

@collection
class NaverMapCategory {
  Id id = Isar.autoIncrement;

  List<NaverMapCategoryContent>? categories;

  NaverMapCategory({this.categories});
}

@embedded
class NaverMapCategoryContent {
  String? category;

  NaverMapCategoryContent({this.category});
}
