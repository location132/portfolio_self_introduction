import 'package:freezed_annotation/freezed_annotation.dart';

part 'tech_preview_model.freezed.dart';

@freezed
class TechPreviewModel with _$TechPreviewModel {
  const factory TechPreviewModel({
    required String title,
    required String imagePath,
    required String keyValue,
  }) = _TechPreviewModel;
}
