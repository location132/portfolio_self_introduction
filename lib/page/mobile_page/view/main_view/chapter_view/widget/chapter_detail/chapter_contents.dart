import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_intro_box.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_story.dart';

class ChapterContents extends StatelessWidget {
  final ChapterModel state;
  final Function() onSimpleView;
  final Function() onDetailView;

  const ChapterContents({
    super.key,
    required this.state,
    required this.onSimpleView,
    required this.onDetailView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            // 챕터 헤더 섹션
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[800]!, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ProfilePage1Constants.chapter1,
                    style: GoogleFonts.dancingScript(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[400],
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    ProfilePage1Constants.chapter1Title,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            ChapterIntroBox(
              isChapterDescriptionAni: state.isChapterDescriptionAni,
              isTextOpacity: state.isChapterDetailAniText,
            ),
            SizedBox(height: 32.h),

            // 스토리 섹션들
            ChapterStory(
              title: '처음 강연을 들었던 그 날,',
              isStart: state.isChapterDetailAniTitle,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 20.h),
              child: AnimatedContainer(
                height: state.isChapterDetailAniContent ? 100.h : 0.h,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: state.isChapterDetailAniText ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: Text(
                    '낯설기만 했던 세미나 주제. 하지만 주변의 개발자들은 모두 이해했다는 듯한 표정으로 고개를 끄덕이고 있었고, 이 첫날의 기억은 지금도 생생하게 남아 있습니다',
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
            ChapterStory(
              title: '저보다 먼저 개발자의 길을 걷는 선배들이',
              isStart: state.isChapterDetailAniTitle,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 10.h),
              child: AnimatedContainer(
                height: state.isChapterDetailAniContent ? 100.h : 0.h,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
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
            ChapterStory(
              title: '후배 개발자들에게 해준 하나의 말',
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 20.h),
              child: WidgetAnimation(
                isStart: state.isChapterDetailAniContent,
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
            SizedBox(height: 40.h),

            if (state.isButtonVisible)
              Stack(
                children: [
                  if (state.isDetailedView)
                    AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      child: Center(
                        child: TextButton.icon(
                          onPressed: () {
                            onSimpleView();
                          },
                          icon: Icon(
                            Icons.expand_less,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                          label: Text(
                            '간략히 보기',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                  if (!state.isDetailedView)
                    AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      child: Center(
                        child: TextButton.icon(
                          onPressed: () {
                            onDetailView();
                          },
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                          label: Text(
                            '자세히 보기',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),

            //챕터 내용 시작

            // === 데스크톱 버전 내용 추가 ===
            SizedBox(height: 60.h),

            // 구분선
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[800],
              margin: EdgeInsets.symmetric(horizontal: 20.w),
            ),

            SizedBox(height: 40.h),

            // 3개 세미나 섹션을 한번에 애니메이션
            AnimatedOpacity(
              opacity: state.isChapterContentVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              child: Column(
                children: [
                  // 1. 판교 디지털센터 groom 강연
                  ChapterStory(
                    title: '판교 디지털센터 groom 강연',
                    isStart: state.isChapterDetailAniTitle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 이미지
                        Center(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 420.w, // 갤럭시 폴드 대응
                            ),
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/Images/SeminarImage_groom.jpeg',
                              width: double.infinity,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // 제목
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            '참여의 의미, 그 안에서 발견하는 나.',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.25,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // 설명
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            '하루하루 쌓아가는 작은 지식과 강연에서의 배움을 통해, 기업과 함께 새로운 도전에 나설 때,\n\n'
                            '"기술적으로 불가능할 것 같습니다." 라는 부정적인 마인드보다는 "이 파트, 제가 도전해보겠습니다." 같은 긍정적인 태도를 갖기 위해,\n\n'
                            '저는 다양한 세미나와 컨퍼런스에 꾸준히 참여하고 있습니다.',
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 60.h),

                  // 2. 선배 개발자의 조언 with 커뮤니케이션
                  ChapterStory(
                    title: '선배 개발자의 조언 with 커뮤니케이션',
                    isStart: state.isChapterDetailAniTitle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 이미지
                        Center(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 420.w, // 갤럭시 폴드 대응
                            ),
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/Images/pdc_groom.jpg',
                              width: double.infinity,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // 제목
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            '의견의 다름은 가능성의 씨앗입니다.',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.25,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // 설명
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            '예전엔 말하는 사람이 되길 원했습니다. 지금은 듣는 사람이 되길 노력하고 있습니다.\n\n'
                            '다른 의견 속에서 더 나은 성장 그리고 목표를 발견하게 되었기 때문입니다.\n\n'
                            '저는 믿고있습니다. 의견의 다름은 가능성 그리고 성장할 수 있는 씨앗의 첫 단계라는 것을.',
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 60.h),

                  // 3. 송도 Future<Flutter> 2024
                  ChapterStory(
                    title: '송도 Future<Flutter> 2024',
                    isStart: state.isChapterDetailAniTitle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 이미지
                        Center(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 420.w, // 갤럭시 폴드 대응
                            ),
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/Images/SeminarImage_flutter.jpg',
                              width: double.infinity,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // 제목
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            '도와주는 기술 속에서도 저는 중심이길 원합니다.',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.25,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // 설명
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            '인공지능은 개발자를 더 단순하게 만들며, 많은 것을 대신해주고 있습니다. 저는 그 편리함 속에서 놓쳐버린 기본기와 목표를 붙잡고 싶었습니다.\n\n'
                            '세미나에 참여하는 이유는 성장과 목표 그리고 중심점을 되찾는 시간이기 때문입니다.',
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
