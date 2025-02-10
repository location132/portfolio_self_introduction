import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

import 'package:self_introduction_flutter/page/main_page/main_state.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(const MainPageState());

  @postConstruct
  void init() async {
    //TODO: 데이터 rive 파일 로드 => with saver
    emit(state.copyWith(status: MainPageStatus.loading));
    emit(state.copyWith(status: MainPageStatus.loaded));
  }

  void onStateChange(String stateName) {
    switch (stateName) {
      case BannerConstants.banner_1:
        emit(state.copyWith(
            stateNameIndex: 0,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
      case BannerConstants.banner_2:
        emit(state.copyWith(
            stateNameIndex: 1,
            stateBannerText: BannerTextConstants.bannerText1));
        break;
      case BannerConstants.banner_3:
        emit(state.copyWith(
            stateNameIndex: 2,
            stateBannerText: BannerTextConstants.bannerText2));
        break;
      case BannerConstants.banner_4:
        emit(state.copyWith(
            stateNameIndex: 3,
            stateBannerText: BannerTextConstants.bannerText3));
        break;
      case BannerConstants.banner_5:
        emit(state.copyWith(
            stateNameIndex: 4,
            stateBannerText: BannerTextConstants.bannerText4));
        break;
      case BannerConstants.banner_6:
        emit(state.copyWith(
            stateNameIndex: 5,
            stateBannerText: BannerTextConstants.bannerText5));
        break;
      case BannerConstants.banner_7:
        emit(state.copyWith(
            stateNameIndex: 6,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
      case BannerConstants.banner_8:
        emit(state.copyWith(
            stateNameIndex: 7,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
      case BannerConstants.banner_9:
        emit(state.copyWith(
            stateNameIndex: 8,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
      case BannerConstants.banner_10:
        emit(state.copyWith(
            stateNameIndex: 9,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
      case BannerConstants.banner_11:
        emit(state.copyWith(
            stateNameIndex: 10,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
      default:
        emit(state.copyWith(
            stateNameIndex: -1,
            stateBannerText: BannerTextConstants.bannerText0));
        break;
    }
  }
}
