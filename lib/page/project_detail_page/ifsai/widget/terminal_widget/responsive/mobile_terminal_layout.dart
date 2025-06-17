import 'package:flutter/material.dart';
import '../clipboard_widget.dart';
import '../terminal_display.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_cubit.dart';

class MobileTerminalLayout {
  static Widget build(IfsaiState state, IfsaiCubit cubit) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: ClipboardWidget(),
        ),
        const SizedBox(height: 20),
        TerminalDisplay(state: state, cubit: cubit, width: 360, height: 250),
      ],
    );
  }
}
