import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';

class MobileClipboardWidget extends StatefulWidget {
  const MobileClipboardWidget({super.key});

  @override
  State<MobileClipboardWidget> createState() => _MobileClipboardWidgetState();
}

class _MobileClipboardWidgetState extends State<MobileClipboardWidget> {
  final List<bool> _isCommandCopied = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TerminalTextConstants.clipboardTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Column(
            children:
                TerminalTextConstants.clipboardCommands.asMap().entries.map((
                  entry,
                ) {
                  final index = entry.key;
                  final cmd = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(bottom: index < 2 ? 8.h : 0),
                    child: _buildCommandCard(cmd, index),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommandCard(Map<String, String> cmd, int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cmd['title']!,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            cmd['description']!,
            style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    cmd['command']!,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.greenAccent,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () async {
                  context.read<IfsaiCubit>().setSelectedCommand(
                    cmd['command']!,
                  );
                  setState(() {
                    _isCommandCopied[index] = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() {
                        _isCommandCopied[index] = false;
                      });
                    }
                  });
                },
                child: Text(
                  _isCommandCopied[index]
                      ? TerminalTextConstants.copySuccessMessage
                      : TerminalTextConstants.copyButtonText,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
