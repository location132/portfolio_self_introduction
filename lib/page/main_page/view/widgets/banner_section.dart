import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 400,
        child: BannerRive(state: widget.state),
      ),
    );
  }
}
