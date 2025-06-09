import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';

class BannerView extends StatefulWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;

  const BannerView({
    super.key,
    required this.state,
    required this.desktopCubit,
  });

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.sh),
        TitleText(
          title: TitleTextConstants.title1,
          subTitle: TitleTextConstants.subTitle1,
          description: TitleTextConstants.description1,
          titleFontSize: 35,
          color: Colors.black,
          isOneLine: false,
          isVisible: true,
        ),
        SizedBox(height: 10.sh),
        //배너
        SizedBox(
          height: 400,
          child: Visibility(
            visible: widget.state.bannerModel.isRiveVisible,
            child: AnimatedOpacity(
              opacity: widget.state.bannerModel.riveOpacity,
              duration: const Duration(milliseconds: 600),
              child: BannerRive(
                isStartAni:
                    widget.state.scrollModel.bannerState ==
                        BannerState.activated &&
                    !widget.state.bannerModel.isTitleChanging,
              ),
            ),
          ),
        ),
        SizedBox(height: 80.sh),
        Player(
          isPlayerAniOpacity: widget.state.bannerModel.isPlayerActive,
          isPlayerText: '마우스를 올리면 자세히 살펴볼 수 있어요!',
          duration: const Duration(milliseconds: 800),
          fontSize: 14,
          onTap: () {
            widget.desktopCubit.playerActive('banner', isActive: false);
          },
        ),
      ],
    );
  }
}
