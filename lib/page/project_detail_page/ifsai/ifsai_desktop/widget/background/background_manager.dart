import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/responsive/desktop_background_layout.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/responsive/tablet_background_layout.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/responsive/mobile_background_layout.dart';

class BackgroundManager {
  static Widget build(BuildContext context, IfsaiState state) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1500) {
      return DesktopBackgroundLayout.build(state);
    } else if (screenWidth > 1050) {
      return TabletBackgroundLayout.build(state);
    } else if (screenWidth > 600) {
      return MobileBackgroundLayout.build(state);
    } else {
      return MobileBackgroundLayout.build(state);
    }
  }
}
