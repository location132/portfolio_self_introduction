import 'package:flutter/material.dart';
import 'responsive/desktop_terminal_layout.dart';
import 'responsive/tablet_terminal_layout.dart';
import 'responsive/mobile_terminal_layout.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_cubit.dart';

class TerminalManager extends StatelessWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const TerminalManager({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1024) {
      return DesktopTerminalLayout.build(state, cubit);
    } else if (screenWidth > 600) {
      return TabletTerminalLayout.build(state, cubit);
    } else {
      return MobileTerminalLayout.build(state, cubit);
    }
  }
}
