import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_story.dart';

class SpotlightContents extends StatelessWidget {
  final ChapterModel state;
  const SpotlightContents({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: state.isChapterDetailAniContent ? 0.h : 250.h,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        ),

        DskChapterStory(
          title: '개발을 배우며 교수님과 동기들이 저에게 해준 말이 있습니다.',
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
                '- 이 이야기는 저의 목표 그리고 함께 일하게 될 기업의 방향성과\n동료와의 협력이 잘 맞는지 확인할 수 있는 짧은 소개로 이어집니다. -',
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
                  '“정원이는 성격이 Flutter 개발자보다는 연구직, 또는 보안에 성격이 더 어울릴 것 같은데 이쪽으로 공부를 해보는 것은 어떻게 생각하시나요?”\n\n'
                  '이 말은 대학생활을 같이 한 친한 동기 4명과 전임 교수님에게 들었던 말이었습니다.\n'
                  '나는 왜 보안, 또는 연구직에 어울린다는 말을 들었을까.. 그 당시에는 몰랐지만 이제는 당당하게 말할 수 있는 나의 이야기.\n\n'
                  '지인들이 말해주는 나의 성격과 분위기,\n'
                  '그리고 그 말을 듣고도 여전히 나의 목표였던 Flutter 개발자로 꿈을 이어가게 되는 나의 고집.',

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
