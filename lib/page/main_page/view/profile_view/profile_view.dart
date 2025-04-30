import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_2/page_2.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_31/page_31.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/background/profile_background_effect.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/page_1.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_0/page_0.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_title.dart';

class ProfileView extends StatefulWidget {
  final MainPageState state;
  const ProfileView({super.key, required this.state});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _scrollCount = 0;
  bool _textAnimationOpacity = true;

  @override
  void didUpdateWidget(covariant ProfileView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.profileModel.scrollCount != _scrollCount) {
      _scrollCount = widget.state.profileModel.scrollCount;
      if (_scrollCount == 0) {
        textAnimationOpacity(true);
      } else {
        textAnimationOpacity(false);
      }
    }
  }

  void textAnimationOpacity(bool isActive) async {
    if (isActive) {
      await Future.delayed(const Duration(milliseconds: 720));
    }
    setState(() {
      _textAnimationOpacity = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ProfileBackgroundEffect(state: widget.state),

          Positioned(
            bottom: 0,
            left: 40,
            child: AnimatedOpacity(
              opacity: _textAnimationOpacity ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: const Text(
                ProfilePage1Constants.retrospect0,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //TODO: 삭제 (페이지 넘버)
          Positioned(
            bottom: 40,
            right: 40,
            child: Text(
              widget.state.profileModel.scrollCount.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          ProfileTitle(state: widget.state),
          Page0(state: widget.state),
          Page1(state: widget.state),
          Page2(state: widget.state),
          // Page31(state: widget.state),
        ],
      ),
    );
  }
}
