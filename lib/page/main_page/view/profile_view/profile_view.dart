import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/%08right_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/my_story.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/seminar_image.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class ProfileView extends StatefulWidget {
  final MainPageState state;
  final Function(String) onScroll;
  const ProfileView({super.key, required this.state, required this.onScroll});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(
                  title: TitleTextConstants.title2,
                  subTitle: TitleTextConstants.subTitle2,
                  description: '  ${TitleTextConstants.description2}',
                  color: Colors.white,
                ),
                const Spacer(),
                // 1번 페이지
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 130.sw, right: 130.sw, bottom: 200.sh),
                      child: SeminarImage(
                        pageStart: widget.state.profileModel.scrollCount == 1,
                      ),
                    ),
                    //-------------------------------
                    Padding(
                      padding: EdgeInsets.only(
                          left: 130.sw, right: 130.sw, bottom: 70.sh),
                    ),
                    //-------------------------------
                    Padding(
                        padding: EdgeInsets.only(
                            left: 130.sw, right: 130.sw, bottom: 70.sh),
                        child: MyStory(
                            isThirdPageInit:
                                widget.state.profileModel.scrollCount == 3)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          RightTitle(state: widget.state),
        ],
      ),
    );
  }
}
