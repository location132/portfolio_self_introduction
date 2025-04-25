import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/%08right_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/my_story.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/page/page_1.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/page/page_0.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_title.dart';
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          ProfileTitle(state: widget.state),
          Page0(pageStart: widget.state.profileModel.scrollCount == 0),
          Page1(
            pageStart: widget.state.profileModel.scrollCount == 1,
            state: widget.state,
          ),
          MyStory(isThirdPageInit: widget.state.profileModel.scrollCount == 3),
        ],
      ),
    );
  }
}
