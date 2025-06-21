import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class DependencyInjectionConcept extends StatefulWidget {
  final TechBlogPostDetailState state;
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;

  const DependencyInjectionConcept({
    super.key,
    required this.state,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<DependencyInjectionConcept> createState() =>
      _DependencyInjectionConceptState();
}

class _DependencyInjectionConceptState
    extends State<DependencyInjectionConcept> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.isMobile ? 100.h : 100),
        PostHeader(
          title: 'Dependency Injection (Get It)',
          tags: const [
            '#Dependency Injection',
            '#GetIt',
            '#Injectable',
            '#Service Locator',
            '#Clean Architecture',
            '#의존성 주입',
            '#DI',
            '#Inversion of Control',
          ],
          content:
              'Flutter 프로젝트가 커질수록 객체들 간의 의존 관계가 복잡해집니다.\n'
              '"이 클래스가 저 클래스를 필요로 하고, 저 클래스는 또 다른 클래스를..."\n'
              '그리고 테스트를 작성하려고 하면 Mock 객체 만들기가 너무 어려워요.\n\n'
              '저는 여러 프로젝트를 진행하면서 이런 문제들을 겪었고,\n'
              'ICT 학생 인턴에서 배운 의존성 주입(Dependency Injection)을 도입하게 되었습니다.\n\n'
              'Flutter에서는 GetIt과 Injectable을 조합해서 DI를 구현할 수 있는데,\n'
              '처음에는 "굳이 이렇게 복잡하게?"라고 생각했지만,\n'
              '지금은 없으면 안 될 Service계층과 Repository계층을 구현하는데 편해졌습니다.\n\n'
              '특히 Clean Architecture와 함께 사용하면 정말 강력하다고 생각합니다!',
          isBackgroundColor: widget.state.isBackgroundColorWhite,
          isMobile: widget.isMobile,
        ),
        SizedBox(height: widget.isMobile ? 64.h : 64),

        // 개념 정리 섹션
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextTechBlog(
              isMobile: widget.isMobile,
              title: '의존성 주입이란?',
              isBackgroundColor: widget.state.isBackgroundColorWhite,
            ),
            SizedBox(height: widget.isMobile ? 30.h : 30),
            ExpandableContent(
              isMobile: widget.isMobile,
              isBackgroundColor: widget.state.isBackgroundColorWhite,
              summary:
                  '의존성 주입(Dependency Injection)은 객체가 자신이 필요로 하는 의존성을\n'
                  '직접 생성하지 않고, 외부에서 주입받는 디자인 패턴입니다.\n\n'
                  'Flutter에서는 GetIt과 Injectable 패키지를 조합해서 사용해요!',
              detailContent:
                  '의존성 주입의 핵심 개념:\n\n'
                  '🔸 1. 의존성(Dependency)\n'
                  '  - 한 클래스가 다른 클래스를 필요로 하는 관계\n'
                  '  - 예: UserService가 ApiClient를 필요로 함\n\n'
                  '🔸 2. 주입(Injection)\n'
                  '  - 필요한 객체를 외부에서 제공하는 것\n'
                  '  - 생성자나 setter를 통해 전달\n\n'
                  '🔸 3. 제어의 역전(IoC - Inversion of Control)\n'
                  '  - 객체 생성과 관리의 제어권이 역전되는 것\n'
                  '  - 객체가 직접 생성하지 않고 외부에서 관리\n\n'
                  '🔸 4. Service Locator 패턴\n'
                  '  - GetIt이 사용하는 방식\n'
                  '  - 중앙 저장소에서 필요한 객체를 찾아옴\n\n'
                  'DI의 장점:\n'
                  '• 테스트하기 쉬워짐 (Mock 객체 주입 가능)\n'
                  '• 코드 간의 결합도 감소\n'
                  '• 유지보수성 향상\n'
                  '• 확장성 좋아짐',
              toggleText: '개념이 궁금하시면 Click',
            ),
            SizedBox(height: widget.isMobile ? 80.h : 80),
            TitleTextTechBlog(
              isMobile: widget.isMobile,
              title: '의존성 주입 개념은 알겠는데 언제 필요한지 모르겠어요',
              isBackgroundColor: widget.state.isBackgroundColorWhite,
            ),
            SizedBox(height: widget.isMobile ? 40.h : 40),
            ExpandableContent(
              isMobile: widget.isMobile,
              isBackgroundColor: widget.state.isBackgroundColorWhite,
              summary:
                  '개념은 좋아 보이는데, 실제로는 언제 써야 하는지 감이 안 잡히시죠?\n'
                  '저도 처음에는 이 구조를 처음 접했을 때, 뭐하는 코드인지 모르고 선임을 무작정 따라했던 기억이 있어요\n\n'
                  '하지만 특정 상황들에서는 의존성 주입이 정말 필요하다는 걸 개인 프로젝트를 진행할 때, 알게되었어요',
              detailContent:
                  '의존성 주입이 필요한 상황들:\n\n'
                  '🔸 1. 여러 페이지에서 같은 Service를 사용할 때\n'
                  '  • UserService를 로그인, 프로필, 설정 페이지에서 모두 사용\n'
                  '  • 매번 새로 생성하면 메모리 낭비와 상태 불일치 발생\n'
                  '  • Singleton으로 하나의 인스턴스만 사용해야 함\n\n'
                  '🔸 2. Clean Architecture의 계층 구조를 만들 때\n'
                  '  • DataSource → Repository → Service → Cubit 순서의 의존성\n'
                  '  • 각 계층이 하위 계층을 의존하는 복잡한 구조\n'
                  '  • 수동으로 관리하면 생성자 지옥이 시작됨\n\n'
                  '🔸 3. 테스트를 작성할 때\n'
                  '  • 실제 API 대신 Mock 객체를 주입해야할 때\n'
                  '  • DI 사용했을 떄, Mock 객체 사용할때 \n\n'
                  '  • 테스트 환경과 실제 환경을 쉽게 분리 가능(이거는 좀 편해요)\n\n'
                  '🔸 4. 복잡한 비즈니스 로직이 있을 때\n'
                  '  • 결제 시스템: PaymentService, ValidationService, LoggingService\n'
                  '  • 각 서비스가 서로 의존하는 복잡한 관계\n'
                  '  • 의존성 순서와 생명주기 관리가 중요\n\n'
                  '🔸 5. 프로젝트 규모가 클 때 (15페이지 이상)\n'
                  '  • 작은 프로젝트: Provider나 setState로도 충분\n'
                  '  • 큰 프로젝트: 구조 없이는 관리 불가능\n'
                  '  • 협업할 때 코드 구조가 명확해야 함\n\n'
                  '반대로 이런 경우에는 굳이 필요 없어요:\n'
                  '❌ 간단한 할 일 앱이나 계산기 앱\n'
                  '❌ 페이지가 15개 미만인 작은 프로젝트\n'
                  '❌ 혼자 하는 프로토타입 개발\n'
                  '❌ 외부 API 호출이 거의 없는 정적 앱',
              toggleText: '언제 필요한지 궁금하시면 Click',
            ),
            SizedBox(height: widget.isMobile ? 150.h : 150),
          ],
        ),
      ],
    );
  }
}
