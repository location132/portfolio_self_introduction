import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/widgets/banner_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/description_view/banner_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';

class BannerView extends StatefulWidget {
  final Function(bool) isActive;
  final DesktopState state;
  final DesktopCubit desktopCubit;

  const BannerView({
    super.key,
    required this.state,
    required this.isActive,
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
        BannerTitle(
          isBannerActive: widget.state.bannerModel.isBannerActive,
          currentTitleIndex: widget.state.bannerModel.currentTitleIndex,
          isButtonVisible: widget.state.bannerModel.isButtonVisible,
          onPrevious: () => widget.desktopCubit.bannerTitlePrevious(),
          onNext: () => widget.desktopCubit.bannerTitleNext(),
        ),
        SizedBox(height: 10.sh),
        //배너
        SectionDescription(state: widget.state, isActive: widget.isActive),
        IgnorePointer(
          ignoring:
              widget.state.descriptionModel.bannerDescriptionState ==
              BannerDescriptionState.active,
          child: SizedBox(
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
        ),
        SizedBox(height: 80.sh),
        Visibility(
          visible:
              widget.state.descriptionModel.bannerDescriptionState !=
              BannerDescriptionState.active,
          child: Player(
            isPlayerAniOpacity: widget.state.bannerModel.isPlayerActive,
            isPlayerText: 'About Me 조금 더 궁금하다면 Click!',
            duration: const Duration(milliseconds: 800),
            fontSize: 14,
            onTap: () {
              widget.desktopCubit.playerActive('banner', isActive: false);
              widget.isActive(true);
            },
          ),
        ),
      ],
    );
  }
}
