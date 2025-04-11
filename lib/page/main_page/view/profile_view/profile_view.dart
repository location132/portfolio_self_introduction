import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/animated_slide_in_widget.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/about_section.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/my_story.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_card.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class ProfileView extends StatefulWidget {
  final MainPageState state;
  const ProfileView({super.key, required this.state});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Map<String, bool> _profileViewState = {
    'ProfileCard': false,
    'Education': false,
    'Experience': false,
    'Projects': false,
    'Final': false,
  };

  @override
  void didUpdateWidget(covariant ProfileView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.scrollModel.profileViewState == ProfileViewState.active &&
        _profileViewState['Final'] == false) {
      _updateProfileViewState();
    }
  }

  void _updateProfileViewState() async {
    setState(() {
      _profileViewState['ProfileCard'] = true;
    });
    await Future.delayed(const Duration(milliseconds: 320));
    setState(() {
      _profileViewState['Education'] = true;
    });
    await Future.delayed(const Duration(milliseconds: 220));
    setState(() {
      _profileViewState['Experience'] = true;
    });
    await Future.delayed(const Duration(milliseconds: 120));
    setState(() {
      _profileViewState['Projects'] = true;
      _profileViewState['Final'] = true;
    });
  }

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
                isVisible: _profileViewState['ProfileCard']!,
                child: const ProfileCard(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 140.sw, top: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            opacity: _profileViewState['Education']! ? 1 : 0,
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
                            opacity: _profileViewState['Experience']! ? 1 : 0,
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
                            opacity: _profileViewState['Projects']! ? 1 : 0,
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
                    const SizedBox(height: 50),
                    const MyStory(),
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
