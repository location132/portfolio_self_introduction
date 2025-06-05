import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class MyStack extends StatelessWidget {
  final String? myStackTitle;
  final String? myStack;
  const MyStack({super.key, this.myStackTitle, this.myStack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 450.w,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              myStackTitle ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              myStack ?? '',
              style: TextStyle(
                fontSize: 15.0,
                color: const Color.fromARGB(255, 166, 166, 166),
                height:
                    myStackTitle == SelectTapTextConstants.myStackTitle3
                        ? 1.5.sp
                        : 2.2.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
