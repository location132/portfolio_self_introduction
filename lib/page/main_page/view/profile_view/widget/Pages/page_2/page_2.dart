import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/chapter_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_2/widgets/image_title_with_profile.dart';

class Page2 extends StatelessWidget {
  final MainPageState state;
  const Page2({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: VisibleorOpacityCondition.isOpacityWith2And3(
          state.profileModel.scrollCount),
      duration: const Duration(milliseconds: 720),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                ChapterTitle(
                  state: state,
                  chapter: ProfilePage1Constants.chapter1,
                  title: '  ${ProfilePage1Constants.chapter1Title}',
                ),
                // 1번 뷰
                ImageTitleWithProfile(
                  state: state,
                  scrollCount: 2,
                  imagePath: 'assets/Images/SeminarImage_groom.jpeg',
                  imageTitle: '판교 디지털센터 groom 강연',
                  title: '매일 배우고, 매일 성장합니다.',
                  description: '하루하루 쌓아가는 작은 도전은\n'
                      '다가올 더 큰 도전을 두려워하지 않고, 결국 이겨낼 수 있을 것이라 믿고 있습니다.',
                ),
                // 2번 뷰
                ImageTitleWithProfile(
                  state: state,
                  scrollCount: 3,
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
                  state: state,
                  scrollCount: 4,
                  imagePath: 'assets/Images/SeminarImage_flutter.jpg',
                  imageTitle: '송도 Future<Flutter> 2024',
                  title: '도와주는 기술 속에서도 저는 중심이길 원합니다.',
                  description: '인공지능은 개발자를 더 단순하게 만들며, 많은 것을 대신해주고 있습니다.\n'
                      '저는 그 편리함 속에서 놓쳐버린 기본기와 목표를 붙잡고 싶었습니다.\n\n'
                      '세미나에 참여하는 이유는 성장과 목표 그리고 중심점을 되찾는 시간이기 때문입니다.',
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
