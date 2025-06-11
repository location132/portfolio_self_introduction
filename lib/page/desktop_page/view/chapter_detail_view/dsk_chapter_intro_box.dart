import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DskChapterIntroBox extends StatefulWidget {
  final int selectedChapterIndex;
  const DskChapterIntroBox({super.key, required this.selectedChapterIndex});

  @override
  State<DskChapterIntroBox> createState() => _DskChapterIntroBoxState();
}

class _DskChapterIntroBoxState extends State<DskChapterIntroBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 20.h,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey[800]!, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '   챕터 Pick',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              widget.selectedChapterIndex == 0
                  ? '챕터 1에서는 각종 세미나와 컨퍼런스에 참여한\n이유를 확인하실 수 있습니다.\n\n'
                      '세 가지로 구성된 작은 세미나 이야기는\n제가 꿈꾸던 목표와 배운 점을 공유할 수 있도록 구성한 챕터입니다.'
                  : widget.selectedChapterIndex == 1
                  ? '챕터 2에서는 대학생활의 프로젝트와 인턴 경험,\n성장을 위한 소중한 시간들을 확인하실 수 있습니다.\n\n'
                      '기본 개념부터 시작해서 팀 프로젝트까지,\n저의 대학시절 개발 경험을 공유할 수 있도록 구성한 챕터입니다.'
                  : widget.selectedChapterIndex == 2
                  ? '챕터 3에서는 새로운 성장의 방향과\n앞으로의 목표를 확인하실 수 있습니다.\n\n'
                      '아직 부족한 지금도, 계속해서 고민하고 시도하며\n성장하고 있는 저의 짧은 이야기를 공유할 수 있도록 구성한 챕터입니다.'
                  : '스팟라이트에서는 저의 개인적인 이야기와\n목표를 확인하실 수 있습니다.\n\n'
                      '교수님과 동기들의 조언부터 시작해서\n저의 꿈과 미래에 대한 이야기를 공유할 수 있도록 구성한 스팟라이트입니다.',
              style: TextStyle(
                fontSize: 16.sp,
                height: 1.6,
                color: Colors.grey[300],
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
