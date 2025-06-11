import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/components/future_section.dart';

class DskSpotlight extends StatelessWidget {
  final ChapterModel state;

  const DskSpotlight({super.key, required this.state});

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
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureSection(
                  contentTitle: 'Flutter를 선택한 이유, 나의 꿈',
                  description:
                      '개발을 배우며 교수님과 동기들이 저에게 해준 말이 있습니다.\n\n'
                      '"정원이는 성격이 Flutter 개발자보다는 연구직, 또는 보안에 성격이 더 어울릴 것 같은데 이쪽으로 공부를 해보는 것은 어떻게 생각하시나요?"\n\n'
                      '이 말은 대학생활을 같이 한 친한 동기 4명과 전임 교수님에게 들었던 말이었습니다.\n'
                      '나는 왜 보안, 또는 연구직에 어울린다는 말을 들었을까..     그 당시에는 몰랐지만 이제는 당당하게 말할 수 있는 나의 이야기.\n'
                      '지인들이 말해주는 나의 성격과 분위기,\n'
                      '그리고 그 말을 듣고도 여전히 나의 목표였던 Flutter 개발자로 꿈을 이어가게 되는 나의 고집.\n\n'
                      '- 이 이야기는 저의 목표 그리고 함께 일하게 될 기업의 방향성과 동료와의 협력이 잘 맞는지 확인할 수 있는 짧은 소개로 이어집니다.\n\n'
                      '저는 어렸을 때부터 하나의 기업과 끝까지 함께하며 결과를 만들어내는 것이 꿈이었습니다. '
                      '그렇기 때문에 다양한 플랫폼과 기능을 하나의 언어와 프레임워크로 구현할 수 있는 Flutter를 선택하게 되었습니다. '
                      '이는 제게 매우 큰 장점이자 매력으로 다가왔습니다.',
                ),
                SizedBox(height: 80),
                FutureSection(
                  contentTitle: '나는 왜 연구직이 어울린다는 말을 들었을까?',
                  description:
                      '교수님과 동기들에게 이러한 설명을 들었을 때 처음에는 조금 당황스러웠지만, '
                      '시간이 흐르며 그 이유를 천천히 깨닫게 되었습니다. '
                      '동기들과 교수님께서 보았던 저는 항상 질문하고 의심하는, 근본적인 원인을 찾으려는 성향이 있었습니다. '
                      '제가 발견한 문제는 그냥 넘어가지 않고 반드시 해결하려는 집요한 성격 때문에 가끔 진도가 빨리 나가지 않을 때도 있습니다.',
                ),
                SizedBox(height: 80),
                FutureSection(
                  contentTitle: '이상을현실로',
                  description: '이제 기업과 함께, 꿈을 현실로 만들겠습니다.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
