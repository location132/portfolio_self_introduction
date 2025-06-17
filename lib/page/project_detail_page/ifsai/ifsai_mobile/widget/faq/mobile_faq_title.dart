import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class MobileFaqTitle extends StatelessWidget {
  final int currentTitleIndex;

  const MobileFaqTitle({super.key, required this.currentTitleIndex});

  @override
  Widget build(BuildContext context) {
    final currentTitle = TitleTextConstants.faqTitles[currentTitleIndex];

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            ),
          );
        },
        child: Container(
          key: ValueKey('mobile_faq_title_$currentTitleIndex'),
          child: Column(
            children: [
              // 메인 타이틀
              Text(
                currentTitle['title']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),

              SizedBox(height: 8.h),

              // 서브 타이틀과 설명
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: currentTitle['subTitle']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white.withValues(alpha: 0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: currentTitle['description']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
