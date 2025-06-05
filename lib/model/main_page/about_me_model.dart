import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me_model.freezed.dart';

@freezed
class AboutMeModel with _$AboutMeModel {
  const factory AboutMeModel({@Default(false) bool isContentActive}) =
      _AboutMeModel;
}
