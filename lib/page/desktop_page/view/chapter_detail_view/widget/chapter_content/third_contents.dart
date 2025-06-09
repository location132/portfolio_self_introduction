import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_story.dart';

class ThirdContents extends StatelessWidget {
  final ChapterModel state;
  const ThirdContents({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DskChapterStory(
          title: '매년 도전하는 개발, 2025년은 Web',
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
                  'iOS, AndroidApp 넘어 Web에 도전하며, 매일 새로운 것을 배우고 있습니다. 완벽하지는 않지만, 꾸준히 성장하고 있습니다.',
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
          title: '기술적 도전과 지속적인 학습',
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
                  '매년, 작년의 저를 돌아봅니다. 내가 그때 이런 걸 할 수 있었나? 라는 생각이 들 만큼 달라져 있죠.\n매일 개발하며 정체기처럼 느껴질 때도 있지만, 되돌아보면 분명히 성장해왔다는 걸 느낍니다.',
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
          title: '2026년부터의 목표',
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
                '"Spring Boot를 공부해 뭐든 할 수 있는 개발자가 되기"',
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
                  'Flutter를 통해 프론트엔드 개발의 즐거움을 느낀 지금, 이제는 백엔드까지 직접 설계하고 운영할 수 있는 개발자가 되고 싶습니다.\n\n'
                  'Spring Boot를 시작으로 서버 아키텍처와 데이터 흐름까지 이해하며, '
                  '2026년, 더 넓은 시야와 실력을 갖춘 개발자로 나아가는 것이 목표입니다.',
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
