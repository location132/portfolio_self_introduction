import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_model.freezed.dart';

@freezed
class DescriptionModel with _$DescriptionModel {
  const factory DescriptionModel({
    //--------------------------------
    @Default(IntroshowcaseState.inactive) IntroshowcaseState introshowcaseState,

    //--------------------------------
    @Default(BannerDescriptionState.inactive)
    BannerDescriptionState bannerDescriptionState,
    //--------------------------------
    @Default(ProfileDescriptionState.inactive)
    ProfileDescriptionState profileDescriptionState,
    //--------------------------------
    @Default(SkillDescriptionState.inactive)
    SkillDescriptionState skillDescriptionState,
  }) = _DescriptionModel;
}

enum IntroshowcaseState {
  inactive,
  active,
}

enum BannerDescriptionState {
  inactive,
  active,
}

enum ProfileDescriptionState {
  inactive,
  active,
}

enum SkillDescriptionState {
  inactive,
  active,
}
