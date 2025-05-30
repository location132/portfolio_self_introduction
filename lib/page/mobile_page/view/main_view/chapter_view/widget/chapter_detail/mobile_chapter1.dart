import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_story.dart';

class MobileChapter1 extends StatelessWidget {
  final ChapterModel state;
  const MobileChapter1({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
