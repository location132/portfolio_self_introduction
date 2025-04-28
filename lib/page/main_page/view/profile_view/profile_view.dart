import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_3/page_3.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/page_1.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_0/page_0.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_title.dart';

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
          Page0(state: widget.state),
          Stack(
            children: [
              Page1(state: widget.state),
            ],
          ),
          // Page3(state: widget.state),
        ],
      ),
    );
  }
}
