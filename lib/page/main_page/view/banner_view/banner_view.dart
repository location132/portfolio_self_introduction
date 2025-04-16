import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/components/widget/description_button.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';
import 'package:self_introduction_flutter/page/main_page/view/banner_view/widgets/banner_description.dart';

class BannerView extends StatefulWidget {
  final Function(bool) isActive;
  final MainPageState state;

  const BannerView({
    super.key,
    required this.state,
    required this.isActive,
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
        const TitleText(
          title: TitleTextConstants.title1,
          subTitle: TitleTextConstants.subTitle1,
          description: TitleTextConstants.description1,
        ),
        SizedBox(height: 10.sh),
        //배너
        Stack(
          children: [
            SectionDescription(
              state: widget.state,
              isActive: widget.isActive,
            ),
            Column(
              children: [
                IgnorePointer(
                  ignoring:
                      widget.state.descriptionModel.bannerDescriptionState ==
                          BannerDescriptionState.active,
                  child: SizedBox(
                    height: 400,
                    child: AnimatedOpacity(
                      opacity: widget.state.descriptionModel
                                  .bannerDescriptionState ==
                              BannerDescriptionState.active
                          ? 0
                          : 1,
                      duration: const Duration(milliseconds: 1200),
                      child: BannerRive(state: widget.state),
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
