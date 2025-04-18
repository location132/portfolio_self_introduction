import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
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
  //TODO: 리펙터링 진행 해야함
  double _lastScrollPosition = 0;

  @override
  void initState() {
    super.initState();
    widget.state.scrollModel.subScrollController
        ?.addListener(_profileScrollListener);
  }

  @override
  void dispose() {
    widget.state.scrollModel.subScrollController
        ?.removeListener(_profileScrollListener);
    super.dispose();
  }

  void _profileScrollListener() {
    final controller = widget.state.scrollModel.subScrollController;
    if (controller == null) return;

    double currentPosition = controller.position.pixels;
    double maxScroll = controller.position.maxScrollExtent;

    if (currentPosition > _lastScrollPosition) {
      if (currentPosition.toStringAsFixed(2) == maxScroll.toStringAsFixed(2)) {
        widget.onScroll('profile_isBottom');
      }
    } else if (currentPosition < _lastScrollPosition) {
      if (currentPosition.toStringAsFixed(2) == '0.00') {
        widget.onScroll('profile_isTop');
      }
    }

    _lastScrollPosition = currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          title: TitleTextConstants.title2,
          subTitle: TitleTextConstants.subTitle2,
          description: '  ${TitleTextConstants.description2}',
          color: Colors.grey,
        ),
        const SizedBox(height: 30),
        Container(
          height: MediaQuery.of(context).size.height * 0.8 - 119.54 - 30,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: ProfileConditions.isProfileViewScrollInactive(widget.state)
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            controller: widget.state.scrollModel.subScrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Text('프로필 뷰'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Text('프로필 뷰'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Text('프로필 뷰'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
