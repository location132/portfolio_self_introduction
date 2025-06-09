import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/components/future_section.dart';

class DskChapter3 extends StatelessWidget {
  final ChapterModel state;
  const DskChapter3({super.key, required this.state});

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

        AnimatedOpacity(
          opacity: state.isChapterContentVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              FutureSection(
                contentTitle: 'Flutter Web의 첫 도전',
                description:
                    'iOS와 Android를 넘어서, Flutter Web에 처음 도전한 프로젝트입니다.\n\n'
                    '상태 관리, 생명주기, Rive 애니메이션 등 앱 개발 경험을 웹에 녹여내며,\n'
                    '동일한 품질의 사용자 경험을 구현하는 것을 목표로 삼았습니다.\n\n'
                    '1차 배포는 끝이 아닌 시작입니다. 더 나은 완성도를 위해,\n'
                    '지속적으로 개선하고 유지보수할 것을 저 자신에게 약속합니다.',
              ),

              FutureSection(
                contentTitle: '코드 품질에 대한 고민, 그리고 적용',
                description:
                    'Provider에서 Bloc으로, 단순한 State에서 Freezed + Cubit 패턴으로.\n\n'
                    'DI(Dependency Injection)를 위한 get_it과 injectable 도입,\n'
                    '그리고 더 나은 아키텍처를 위한 구조적 고민들을 이어가고 있습니다.\n\n'
                    '복잡해지는 프로젝트 속에서도 깔끔한 코드를 유지하기 위해 '
                    '아직은 익숙해지는 과정이라 속도는 느릴지라도\n'
                    '점차 손에 익고 있다는 것을 느낍니다.',
              ),

              FutureSection(
                contentTitle: '개발과 어울리는 더 다양한 툴들',
                description:
                    '프론트엔드 개발자로서 필요한 더 다양한 툴들을 익히는 것도 많이 연습을 해왔습니다\n'
                    '이제는 Figma를 넘어, Rive 애니메이션과 Canva 같은 디자인 툴도 비록 서툴지만 직접 만들 수 있게 되었습니다.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
