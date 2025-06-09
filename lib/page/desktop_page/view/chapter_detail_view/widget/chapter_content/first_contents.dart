import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_story.dart';

class FirstContents extends StatelessWidget {
  final ChapterModel state;
  const FirstContents({super.key, required this.state});

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
          title: '처음 강연을 들었던 그 날,',
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
                  '낯설기만 했던 세미나 주제, 하지만 주변의 개발자들은 모두 이해했다는 듯한 표정으로 고개를 끄덕이고 있었고, 이 첫날의 기억은 지금도 생생하게 남아 있습니다',
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
          title: '저보다 먼저 개발자의 길을 걷는 선배들이',
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
                  '전해주는 강연은 어려운 말들이 가득했고 이해하지 못한 채 노트에 필기만 하던 저는 제가 처음 품었던 목표를 잊고 따라가기 급급하게 만들었던 것 같습니다.',
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
          title: '후배 개발자들에게 해준 하나의 말',
          isStart: state.isChapterDetailAniTitle,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: AnimatedOpacity(
            opacity: state.isChapterDetailAniText ? 1 : 0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            child: Text(
              '"모르는 건 당연해요. 중요한 건 계속 배우고 있다는 거예요."',
              style: TextStyle(
                fontSize: 15.sp,
                height: 1.6,
                color: Colors.white,
                fontWeight: FontWeight.w400,
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
                  '이 한마디의 말은 선배 개발자들이 만들어놓은 길을 편안하게 따라가는 개발자가 아닌, '
                  '나의 목표 그리고 나의 고집으로 성장하는 개발자가 되고 싶다는 마음을 가질 수 있게 해주었습니다.',
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
