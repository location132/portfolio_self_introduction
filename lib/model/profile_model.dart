import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileViewModel with _$ProfileViewModel {
  const factory ProfileViewModel({
    @Default(ProfileViewStatus.init) ProfileViewStatus status,
    @Default(false) bool isProfileCard,
    @Default(false) bool animationStart,
    @Default(false) bool aboutSection1,
    @Default(false) bool aboutSection2,
    @Default(false) bool aboutSection3,
  }) = _ProfileViewModel;
}

enum ProfileViewStatus { init, end }
