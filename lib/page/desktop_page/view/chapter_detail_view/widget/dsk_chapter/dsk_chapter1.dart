import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/components/seminar_section.dart';

class DskChapter1 extends StatelessWidget {
  final ChapterModel state;
  const DskChapter1({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),

        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[800],
          margin: EdgeInsets.symmetric(horizontal: 20.w),
        ),

        SizedBox(height: 40.h),

        AnimatedOpacity(
          opacity: state.isChapterContentVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              // 1. 판교 디지털센터 groom 강연
              SeminarSection(
                title: '판교 디지털센터 groom 강연',
                imagePath: 'assets/Images/SeminarImage_groom.jpeg',
                contentTitle: '참여의 의미, 그 안에서 발견하는 나.',
                description:
                    '하루하루 쌓아가는 작은 지식과 강연에서의 배움을 통해, 기업과 함께 새로운 도전에 나설 때,\n\n'
                    '"기술적으로 불가능할 것 같습니다." 라는 부정적인 마인드보다는 "이 파트, 제가 도전해보겠습니다." 같은 긍정적인 태도를 갖기 위해,\n\n'
                    '저는 다양한 세미나와 컨퍼런스에 꾸준히 참여하고 있습니다.',
                isStart: state.isChapterDetailAniTitle,
              ),

              // 2. 선배 개발자의 조언 with 커뮤니케이션
              SeminarSection(
                title: '선배 개발자의 조언 with 커뮤니케이션',
                imagePath: 'assets/Images/pdc_groom.jpg',
                contentTitle: '의견의 다름은 가능성의 씨앗입니다.',
                description:
                    '예전엔 말하는 사람이 되길 원했습니다. 지금은 듣는 사람이 되길 노력하고 있습니다.\n\n'
                    '다른 의견 속에서 더 나은 성장 그리고 목표를 발견하게 되었기 때문입니다.\n\n'
                    '저는 믿고있습니다. 의견의 다름은 가능성 그리고 성장할 수 있는 씨앗의 첫 단계라는 것을.',
                isStart: state.isChapterDetailAniTitle,
              ),

              // 3. 송도 Future<Flutter> 2024
              SeminarSection(
                title: '송도 Future<Flutter> 2024',
                imagePath: 'assets/Images/SeminarImage_flutter.jpg',
                contentTitle: '도와주는 기술 속에서도 저는 중심이길 원합니다.',
                description:
                    '새로운 기술과 도구들이 등장할 때마다, 저는 항상 이런 생각을 해봅니다.\n\n'
                    '"이 기술이 나를 도와주는 건 맞지만, 그 속에서도 내가 중심이 되어야 한다."\n\n'
                    '기술에 의존하지 않고, 기술을 활용하는 개발자가 되고 싶습니다.',
                isStart: state.isChapterDetailAniTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
