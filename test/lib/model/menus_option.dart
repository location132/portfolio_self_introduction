import 'package:freezed_annotation/freezed_annotation.dart';

part 'menus_option.freezed.dart';

@freezed
class MenuOptionsModel with _$MenuOptionsModel {
  const factory MenuOptionsModel({
    required List<MenuOptionCategory> categories,
  }) = _MenuOptionsModel;
}

@freezed
class MenuOptionCategory with _$MenuOptionCategory {
  const factory MenuOptionCategory({
    required String classification,
    required List<MenuOption> options,
    required bool multipleSelection,
  }) = _MenuOptionCategory;
}

@freezed
class MenuOption with _$MenuOption {
  const factory MenuOption({
    required int menuOptionId,
    required String description,
    required int optionPrice,
    required bool defaultOption,
    required bool adultMenu,
  }) = _MenuOption;
}
