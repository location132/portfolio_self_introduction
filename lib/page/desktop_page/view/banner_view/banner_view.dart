import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/components/widget/description_button.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/description_view/banner_description.dart';

class BannerView extends StatefulWidget {
  final Function(bool) isActive;
  final DesktopState state;

  const BannerView({super.key, required this.state, required this.isActive});

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
          isVisible: widget.state.scrollModel.isScrollEnabled,
        ),
        SizedBox(height: 10.sh),
        //배너
        Stack(
          children: [
            SectionDescription(state: widget.state, isActive: widget.isActive),
            Column(
              children: [
                IgnorePointer(
                  ignoring:
                      widget.state.descriptionModel.bannerDescriptionState ==
                      BannerDescriptionState.active,
                  child: SizedBox(
                    height: 400,
                    child: AnimatedOpacity(
                      opacity:
                          widget
                                      .state
                                      .descriptionModel
                                      .bannerDescriptionState ==
                                  BannerDescriptionState.active
                              ? 0
                              : 1,
                      duration: const Duration(milliseconds: 1200),
                      child: BannerRive(
                        isStartAni:
                            widget.state.scrollModel.bannerState ==
                            BannerState.activated,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.sh),
                DescriptionButton(
                  onTap: () {
                    widget.isActive(true);
                  },
                  state: widget.state,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
