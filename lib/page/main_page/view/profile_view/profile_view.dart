import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/animated_slide_in_widget.dart';
import 'package:self_introduction_flutter/components/widget/animation/text_fade_animaion.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/about_section.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_card.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class ProfileView extends StatelessWidget {
  final MainPageState state;
  const ProfileView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.sh),
        const TitleText(
          title: TitleTextConstants.title2,
          subTitle: TitleTextConstants.subTitle2,
          description: TitleTextConstants.description2,
        ),
        SizedBox(height: 80.sh),
        Padding(
          padding: EdgeInsets.only(left: 132.sw),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 카드
              AnimatedSlideInWidget(
                isVisible: state.scrollModel.profileViewState ==
                    ProfileViewState.active,
                child: const ProfileCard(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 140.sw, top: 60),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: state.scrollModel.profileViewState ==
                                    ProfileViewState.active
                                ? 1
                                : 0,
                            duration: const Duration(milliseconds: 720),
                            child: const AboutSection(
                              title: EducationTextConstants.educationTitle,
                              sectionInfo: [
                                EducationTextConstants.profileCardEducation1,
                                EducationTextConstants.profileCardEducation2,
                                EducationTextConstants.profileCardEducation5,
                              ],
                            ),
                          ),
                          const Spacer(),
                          AnimatedOpacity(
                            opacity: state.scrollModel.profileViewState ==
                                    ProfileViewState.active
                                ? 1
                                : 0,
                            duration: const Duration(milliseconds: 720),
                            child: const AboutSection(
                              title: ExperienceTextConstants.experienceTitle,
                              sectionInfo: [
                                ExperienceTextConstants.experience1,
                                ExperienceTextConstants.experience2,
                              ],
                            ),
                          ),
                          const Spacer(),
                          AnimatedOpacity(
                            opacity: state.scrollModel.profileViewState ==
                                    ProfileViewState.active
                                ? 1
                                : 0,
                            duration: const Duration(milliseconds: 720),
                            child: const AboutSection(
                              title: ProjectsTextConstants.projectsTitle,
                              sectionInfo: [
                                ProjectsTextConstants.projects1,
                                ProjectsTextConstants.projects2,
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(height: 70.sh),
                    state.scrollModel.profileViewState ==
                            ProfileViewState.active
                        ? Padding(
                            padding: EdgeInsets.only(left: 80.sw),
                            child: const TextFadeAnimation(
                                text: MyStoryTextConstants.myStory),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 120.sh),
      ],
    );
  }
}
