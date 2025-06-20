import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/menus_option.dart';

part 'menu_option_remote_response.freezed.dart';
part 'menu_option_remote_response.g.dart';

//dio 67
@freezed
class MenuOptionsResponse with _$MenuOptionsResponse {
  const MenuOptionsResponse._();

  const factory MenuOptionsResponse({
    @Default([]) List<MenuOptionCategoryResponse> categories,
  }) = _MenuOptionsResponse;

  MenuOptionsModel toModel() {
    return MenuOptionsModel(
      categories: categories
          .map((category) => MenuOptionCategory(
                classification: category.classification,
                options: category.options
                    .map((option) => MenuOption(
                          menuOptionId: option.menuOptionId,
                          description: option.description,
                          optionPrice: option.optionPrice,
                          defaultOption: option.defaultOption,
                          adultMenu: option.adultMenu,
                        ))
                    .toList(),
                multipleSelection: category.multipleSelection,
              ))
          .toList(),
    );
  }

  factory MenuOptionsResponse.fromJson(List<dynamic> json) =>
      MenuOptionsResponse(
        categories:
            json.map((e) => MenuOptionCategoryResponse.fromJson(e)).toList(),
      );
}

@freezed
class MenuOptionCategoryResponse with _$MenuOptionCategoryResponse {
  const factory MenuOptionCategoryResponse({
    required String classification,
    required List<MenuOptionResponse> options,
    required bool multipleSelection,
  }) = _MenuOptionCategoryResponse;

  factory MenuOptionCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuOptionCategoryResponseFromJson(json);
}

@freezed
class MenuOptionResponse with _$MenuOptionResponse {
  const factory MenuOptionResponse({
    required int menuOptionId,
    required String description,
    required int optionPrice,
    required bool defaultOption,
    required bool adultMenu,
  }) = _MenuOptionResponse;

  factory MenuOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuOptionResponseFromJson(json);
}
