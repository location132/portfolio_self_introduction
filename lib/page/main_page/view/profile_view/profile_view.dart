import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/profile_model.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_page/chapter_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/chapter_intro_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_1/chapter_1.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/chapter_2.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/background/profile_background_effect.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/init_page/init_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/retrospect_text.dart';

class ProfileView extends StatelessWidget {
  final ProfileModel profileModel;

  const ProfileView({
    super.key,
    required this.profileModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          ProfileBackgroundEffect(scrollCount: profileModel.scrollCount),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InitPageView(scrollCount: profileModel.scrollCount),
                    RetrospectTextView(scrollCount: profileModel.scrollCount),
                    ProfileTitleView(scrollCount: profileModel.scrollCount),
                    ChapterView(
                      profileModel: profileModel,
                    ),

                    // 세미나, 컨퍼런스 페이지
                    Page2(scrollCount: profileModel.scrollCount),
                    Chapter2(
                      profileModel: profileModel,
                    ),
                    // Page4(state: widget.state),
                    ChapterIntroView(
                      profileModel: profileModel,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child:
                    //TODO: 삭제 (페이지 넘버)
                    Center(
                  child: Text(
                    profileModel.scrollCount.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
