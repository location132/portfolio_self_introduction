import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/background/background_manager.dart';

class BgView extends StatefulWidget {
  final IfsaiState state;
  const BgView({super.key, required this.state});

  @override
  State<BgView> createState() => _BgViewState();
}

class _BgViewState extends State<BgView> {
  double? _previousScreenWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (_previousScreenWidth != null && _previousScreenWidth != screenWidth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
    _previousScreenWidth = screenWidth;

    return BackgroundManager.build(context, widget.state);
  }
}
