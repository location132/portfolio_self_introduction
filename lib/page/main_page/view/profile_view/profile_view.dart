import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: TitleTextConstants.title2,
          subTitle: TitleTextConstants.subTitle2,
          description: '  ${TitleTextConstants.description2}',
          color: Colors.white,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
