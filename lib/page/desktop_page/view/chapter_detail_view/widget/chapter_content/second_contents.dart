import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_story.dart';

class SecondContents extends StatelessWidget {
  final ChapterModel state;
  const SecondContents({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          height: state.isChapterDetailAniContent ? 0.h : 200.h,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        ),
        DskChapterStory(
          title: '기본 개념조차 잡히지 않았던 우리.',
          isStart: state.isChapterDetailAniTitle,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.w, top: 20.h),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: ConstrainedBox(
              constraints:
                  state.isChapterDetailAniContent
                      ? const BoxConstraints(maxWidth: 500)
                      : const BoxConstraints(maxWidth: 500, maxHeight: 0),
              child: AnimatedOpacity(
                opacity: state.isChapterDetailAniText ? 1 : 0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: Text(
                  '기본 개념조차 잡히지 않았던 저와 동기들, Unix 수업 시간에 처음 들은 cd와 ls. 하지만 이게 왜 필요한지, 어디에 쓰이는 건지 몰랐던 우리.',
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.6,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
        DskChapterStory(
          title: '우리손으로 뭔가를 해보겠다는 노력',
          isStart: state.isChapterDetailAniTitle,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.w, top: 10.h),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: ConstrainedBox(
              constraints:
                  state.isChapterDetailAniContent
                      ? const BoxConstraints(maxWidth: 500)
                      : const BoxConstraints(maxWidth: 500, maxHeight: 0),
              child: AnimatedOpacity(
                opacity: state.isChapterDetailAniText ? 1 : 0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: Text(
                  '이 노력은 어느새, 하나의 프로젝트라는 꿈으로 이어졌습니다. 처음엔 학생 몇 명이 모여 만든 엉망진창의 결과물. 완성도는 부족했지만, 우리 손으로 무언가를 만들어냈다는 그 기쁨은 현재도 제가 개발공부를 하고, 계속 공부할 수 있도록 만들어주었습니다.',
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.6,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
        DskChapterStory(
          title: 'Flutter 개발자로서의 가장 커다란 대학 경험',
          isStart: state.isChapterDetailAniTitle,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Center(
            child: AnimatedOpacity(
              opacity: state.isChapterDetailAniText ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              child: Text(
                '"저는 이 모든 경험들이 저를 여기까지 올라오게 만들어준 경험이라 생각합니다."',
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.6,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.w, top: 20.h),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: ConstrainedBox(
              constraints:
                  state.isChapterDetailAniContent
                      ? const BoxConstraints(maxWidth: 500)
                      : const BoxConstraints(maxWidth: 500, maxHeight: 0),
              child: AnimatedOpacity(
                opacity: state.isChapterDetailAniText ? 1 : 0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: Text(
                  '9명의 개발자, 3명의 디자이너, 1명의 보안 전문가, 그리고 3명의 경영학 전공 친구들과 함께 '
                  'Klang 프로젝트와 잎사이 프로젝트를 기획부터 디자인 · 개발까지 진행하며 하나의 작은 서비스를 우리 손으로 만들어내는 PM경험을 해보기도 했습니다.',
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.6,
                    color: Colors.grey[300],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
