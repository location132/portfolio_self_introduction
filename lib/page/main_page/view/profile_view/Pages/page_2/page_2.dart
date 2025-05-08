import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/page_2/widgets/image_title_with_profile.dart';

class Page2 extends StatelessWidget {
  final int scrollCount;
  const Page2({super.key, required this.scrollCount});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity:
          scrollCount == 4 || scrollCount == 5 || scrollCount == 6 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 720),
      child: Stack(
        children: [
          ImageTitleWithProfile(
              stateScrollCount: scrollCount,
              scrollCount: 4,
              imagePath: 'assets/Images/SeminarImage_groom.jpeg',
              imageTitle: '판교 디지털센터 groom 강연',
              title: '참여의 의미, 그 안에서 발견하는 나.',
              description: '하루하루 쌓아가는 작은 지식과 강연에서의 배움을 통해,\n'
                  '기업과 함께 새로운 도전에 나설 때,\n\n'
                  '"기술적으로 불가능할 것 같습니다." 라는 부정적인 마인드보다는\n'
                  '"이 파트, 제가 도전해보겠습니다." 같은 긍정적인 태도를 갖기 위해,\n'
                  '저는 다양한 세미나와 컨퍼런스에 꾸준히 참여하고 있습니다.'),
          // 2번 뷰
          ImageTitleWithProfile(
            stateScrollCount: scrollCount,
            scrollCount: 5,
            imagePath: 'assets/Images/pdc_groom.jpg',
            imageTitle: '선배 개발자의 조언 with 커뮤니케이션',
            title: '의견의 다름은 가능성의 씨앗입니다.',
            description: '예전엔 말하는 사람이 되길 원했습니다.\n'
                '지금은 듣는 사람이 되길 노력하고 있습니다.\n\n'
                '다른 의견 속에서 더 나은 성장 그리고 목표를 발견하게 되었기 때문입니다.\n\n'
                '저는 믿고있습니다.\n의견의 다름은 가능성 그리고 성장할 수 있는 씨앗의 첫 단계라는 것을.',
          ),
          // 3번 뷰
          ImageTitleWithProfile(
            stateScrollCount: scrollCount,
            scrollCount: 6,
            imagePath: 'assets/Images/SeminarImage_flutter.jpg',
            imageTitle: '송도 Future<Flutter> 2024',
            title: '도와주는 기술 속에서도 저는 중심이길 원합니다.',
            description: '인공지능은 개발자를 더 단순하게 만들며, 많은 것을 대신해주고 있습니다.\n'
                '저는 그 편리함 속에서 놓쳐버린 기본기와 목표를 붙잡고 싶었습니다.\n\n'
                '세미나에 참여하는 이유는 성장과 목표 그리고 중심점을 되찾는 시간이기 때문입니다.',
          ),
        ],
      ),
    );
  }
}
