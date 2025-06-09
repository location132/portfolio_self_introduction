import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DskChapterIntroBox extends StatefulWidget {
  final bool isChapterDescriptionAni;
  final bool isTextOpacity;
  final int selectedChapterIndex;
  const DskChapterIntroBox({
    super.key,
    required this.isChapterDescriptionAni,
    required this.isTextOpacity,
    required this.selectedChapterIndex,
  });

  @override
  State<DskChapterIntroBox> createState() => _DskChapterIntroBoxState();
}

class _DskChapterIntroBoxState extends State<DskChapterIntroBox> {
  bool isSecondsAni = false;
  bool isTextOpacity = false;

  @override
  void didUpdateWidget(covariant DskChapterIntroBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isChapterDescriptionAni != widget.isChapterDescriptionAni) {
      setState(() {
        isSecondsAni = true;
      });
    }
    if (oldWidget.isTextOpacity != widget.isTextOpacity) {
      setState(() {
        isTextOpacity = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 화면이 작으면 왼쪽 정렬, 크면 중앙 정렬 유지
        final isSmallScreen = constraints.maxWidth < 900;

        Widget content = Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            height: isSecondsAni ? 220.h : 0.h,
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
            child: AnimatedOpacity(
              opacity: isTextOpacity ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
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
                  Center(
                    child: Text(
                      widget.selectedChapterIndex == 0
                          ? '챕터 1에서는 각종 세미나와 컨퍼런스에 참여한\n이유를 확인하실 수 있습니다.\n\n'
                              '세 가지로 구성된 작은 세미나 이야기는\n제가 꿈꾸던 목표와 배운 점을 공유할 수 있도록 구성한 챕터입니다.'
                          : widget.selectedChapterIndex == 1
                          ? '챕터 2에서는 대학생활의 프로젝트와 인턴 경험,\n성장을 위한 소중한 시간들을 확인하실 수 있습니다.\n\n'
                              '기본 개념부터 시작해서 팀 프로젝트까지,\n저의 대학시절 개발 경험을 공유할 수 있도록 구성한 챕터입니다.'
                          : '챕터 3에서는 새로운 성장의 방향과\n앞으로의 목표를 확인하실 수 있습니다.\n\n'
                              '아직 부족한 지금도, 계속해서 고민하고 시도하며\n성장하고 있는 저의 짧은 이야기를 공유할 수 있도록 구성한 챕터입니다.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.6,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        return isSmallScreen
            ? Align(alignment: Alignment.centerLeft, child: content)
            : Center(child: content);
      },
    );
  }
}
