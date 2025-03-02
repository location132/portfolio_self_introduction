import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class BannerSection extends StatefulWidget {
  final MainPageState state;
  const BannerSection({super.key, required this.state});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.sh, left: 16.0),
        child: SizedBox(
          height: 300.sh,
          child: BannerRive(state: widget.state),
        ),
      ),
    );
  }
}
