import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class ProfileView extends StatefulWidget {
  final MainPageState state;
  const ProfileView({super.key, required this.state});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void didUpdateWidget(covariant ProfileView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.scrollModel.bannerState !=
        oldWidget.state.scrollModel.bannerState) {
      print(widget.state.scrollModel.bannerState);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
