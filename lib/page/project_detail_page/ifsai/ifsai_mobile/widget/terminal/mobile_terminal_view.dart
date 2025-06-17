import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'mobile_clipboard_widget.dart';
import 'mobile_terminal_display.dart';

class MobileTerminalView extends StatelessWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const MobileTerminalView({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Text(
            TerminalTextConstants.terminalTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          SizedBox(height: 40.h),
          const MobileClipboardWidget(),
          SizedBox(height: 20.h),
          MobileTerminalDisplay(state: state, cubit: cubit),
        ],
      ),
    );
  }
}
