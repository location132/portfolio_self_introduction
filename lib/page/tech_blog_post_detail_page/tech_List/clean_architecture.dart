import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/repository_widget.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/domain_layer.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/presentation_layer.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class CleanArchitecture extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  const CleanArchitecture({
    super.key,
    required this.isFocused,
    this.scrollController,
  });

  @override
  State<CleanArchitecture> createState() => _CleanArchitectureState();
}

class _CleanArchitectureState extends State<CleanArchitecture> {
  final GlobalKey _codeExampleSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.isFocused(true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateScrollOffset();
    });
  }

  void _calculateScrollOffset() {
    if (_codeExampleSectionKey.currentContext != null) {
      final RenderBox renderBox =
          _codeExampleSectionKey.currentContext!.findRenderObject()
              as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final cubit = context.read<TechBlogPostDetailCubit>();
      cubit.setScrollTargetOffset(position.dy - 200);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: widget.scrollController,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  PostHeader(
                    title: 'Clean Architecture',
                    tags: const [
                      '#Clean Architecture',
                      '#Domain Layer',
                      '#Data Layer',
                      '#Presentation Layer',
                      '#Dependency Injection',
                      '#클린 아키텍쳐',
                      '#서비스 패턴',
                      '#Service Pattern',
                    ],
                    content:
                        '프로젝트가 커질수록 느끼는 것이 있습니다.\n'
                        '"아, 이 코드를 어디에 둬야 할까?" 하는 고민이 점점 많아진다는 것이죠.\n\n'
                        'MVVM을 도입하면서 구조가 많이 개선되었지만,\n  '
                        '여전히 "비즈니스 로직을 어디에 둘 것인가?", "외부 API 호출은 어떻게 관리할까?" 같은 질문들이 머릿속을 맴돌고 있었습니다.\n\n'
                        '처음에는 Service 파일과 리포지토리 패턴(원격 저장소(Remote Repository), 원격 응답(Remote Response), 원격 서비스(Remote Service), 원격 소스(Remote Source) 등)이 너무 복잡하게 느껴졌습니다. 학생 인턴 시절에는 더욱 그랬습니다.\n\n'
                        'ICT 인턴십 실무를 통해 실제 현업에서 사용하는 Clean Architecture 패턴을 처음 접하게 되었고, 2024년 10월부터 제 Flutter 프로젝트에 적용하기 시작했습니다.\n\n'
                        '이제는 이 구조가 제 프로젝트의 필수 골격 중 하나로 자리 잡았습니다. 완벽하지는 않지만, 제가 Flutter에서 Clean Architecture를 어떻게 해석하고 적용했는지를 함께 공유해보겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                  ),
                  const SizedBox(height: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        title: 'Clean Architecture란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      const SizedBox(height: 30),
                      ExpandableContent(
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Clean Architecture는 Robert C. Martin(Uncle Bob)이 제안한'
                            '소프트웨어 아키텍처 원칙입니다.\n'
                            '핵심은 "의존성 역전"을 통해 비즈니스 로직을 외부 요소로부터'
                            '독립시키는 것입니다.',
                        detailContent:
                            'Clean Architecture의 핵심 원칙:\n\n'
                            '🔸 1. 의존성 규칙 (Dependency Rule)\n'
                            '  - 외부 레이어에서 내부 레이어로만 의존성이 향해야 함\n'
                            '  - 내부 레이어는 외부 레이어를 알아서는 안 됨\n\n'
                            '🔸 2. 관심사의 분리 (Separation of Concerns)\n'
                            '  - 각 레이어는 명확한 책임을 가져야 함\n'
                            '  - 비즈니스 로직은 UI나 DB에 종속되지 않아야 함\n\n'
                            '🔸 3. 테스트 가능성 (Testability)\n'
                            '  - 비즈니스 로직은 외부 의존성 없이 테스트 가능해야 함\n'
                            '  - Mock 객체를 통한 독립적인 테스트 환경 구성\n\n'
                            '🔸 4. 독립성 (Independence)\n'
                            '  - 프레임워크, DB, UI, 외부 에이전시로부터 독립\n'
                            '  - 핵심 비즈니스 로직은 변경에 영향받지 않아야 함\n\n'
                            'Flutter에서는 이런 원칙들을 Domain, Data, Presentation 레이어로\n'
                            '구분해서 적용할 수 있습니다.',
                        toggleText: '개념이 궁금하시면 Click',
                      ),
                      const SizedBox(height: 80),
                      TitleTextTechBlog(
                        title: '개념을 보니까..\n   너무 복잡한 거 아닌가요?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      const SizedBox(height: 40),
                      ExpandableContent(
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '저도 처음에는 그렇게 생각했어요.\n\n'
                            '“정말 이렇게까지 해야 하나?...” 프로젝트 시작 단계에서 레이어와 인터페이스가\n'
                            '너무 많아 어디부터 봐야 할지 막막했거든요.\n\n'
                            '하지만 실제로 적응하고 배워보니...\n\n',
                        toggleText: '처음엔 복잡해 보였지만\n어떤 장점이 있을지 궁금하다면 Click',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '처음에는 확실히 복잡해 보여 수석 개발자와 선임개발자에게 정말 많은 질문을 하며 배웠던 기억이 있어요\n'
                            'Domain, Data, Presentation 레이어를 나누고,\n'
                            'Repository 인터페이스를 만들고, UseCase를 따로 정의하고...\n\n'
                            '"처음 접할때는 이렇게까지 해야 하나?" 싶고 개발이 너무 힘들었어요.\n\n'
                            '아래 내용은 제가 인턴 경험동안 작성한 내용들이에요.\n\n'
                            '✅ **테스트가 정말 쉬움\n'
                            '• 비즈니스 로직을 UI나 외부 의존성 없이 독립적으로 테스트 가능\n'
                            '• Mock 객체로 다양한 시나리오 테스트가 용이함\n\n'
                            '✅ **기능 추가가 예측 가능**\n'
                            '• "이 코드는 어디에 넣어야 하지?" 하는 고민이 사라짐\n'
                            '• 각 레이어의 역할이 명확해서 코드 위치를 쉽게 결정 가능\n\n'
                            '✅ **협업할 때 의사소통이 명확함**\n'
                            '• "Repository에서 데이터 처리하고", "UseCase에서 비즈니스 로직 담당"\n'
                            '• 팀원들과 코드 리뷰할 때 구조가 명확해서 소통이 수월함\n\n'
                            '✅ **버그 추적이 간편해짐**\n'
                            '• 문제가 생기면 어느 레이어에서 발생했는지 빠르게 파악 가능\n'
                            '• 각 레이어가 독립적이라 영향 범위를 쉽게 예측 가능\n\n'
                            '처음 보면 다소 복잡해 보일 수 있지만,\n'
                            '실제 개발 과정을 겪어보면 구조 덕분에 확실히 도움이 된다는 걸 느꼈어요.\n\n'
                            '저는 BLoC 패턴과 함께 사용 중인데,\n'
                            '상태 관리도 훨씬 깔끔해져서 편하게 작업하고 있습니다.'
                            '\n\n\n\n이 블로그를 다시 작성하며, 개발 초기 개념을 잡아준 이수석님과 유선임님 그 시절 제가 너무 부족했지만\n 천천히 개념과 이론을 잡아주셔서 너무 감사했습니다.',
                      ),
                      const SizedBox(height: 150),

                      RepositoryPattern(
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                      ),

                      // //--------------------------------
                      DomainLayer(
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                      ),
                      PresentationLayer(
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                      ),
                      const SizedBox(height: 150),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
