import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/repository_widget.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class RepositoryPatternPage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const RepositoryPatternPage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<RepositoryPatternPage> createState() => _RepositoryPatternPageState();
}

class _RepositoryPatternPageState extends State<RepositoryPatternPage> {
  final GlobalKey _codeExampleSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // widget.isFocused(true);
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
      if (widget.isMobile) {
        cubit.setScrollTargetOffset(position.dy - 0);
      } else {
        cubit.setScrollTargetOffset(position.dy - 250);
      }
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
              padding: EdgeInsets.all(widget.isMobile ? 24.0.w : 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.isMobile ? 100.h : 100),
                  PostHeader(
                    title: 'Repository Pattern',
                    tags: const [
                      '#Repository Pattern',
                      '#Data Layer',
                      '#Remote Repository',
                      '#Local Repository',
                      '#Data Source',
                      '#레포지토리 패턴',
                      '#데이터 계층',
                      '#Clean Architecture',
                    ],
                    content:
                        '데이터를 어떻게 관리할까?\n'
                        '로컬 데이터베이스(Isar, Hive)에서 가져올지, API(DIO)에서 받아올지 아니면 캐시된(DioCacheManager, NetworkCache) 데이터를 사용할지...\n\n'
                        '처음에는 이런 데이터 소스들을 직접 View나 ViewModel, 아니면 Provider에서 처리하곤 했습니다.\n'
                        '하지만 프로젝트가 커지고 복잡해질수록 "데이터 로직이 여기저기 흩어져 있어서 유지보수가 힘들다"는 것을 알게되었습니다.\n\n'
                        'Repository Pattern은 이런 문제를 해결할 수 있게 ICT 학생 인턴 중 배운 패턴입니다.\n'
                        '데이터 소스를 추상화하여 비즈니스 로직에서는 "어떤 데이터가 필요한지"만 알면 되고,\n'
                        '"어디서 어떻게 가져오는지"는 Repository가 알아서 처리하게 됩니다.\n\n'
                        '제가 Flutter 프로젝트에서 Repository Pattern을 어떻게 구현하고 활용하는지 공유해보겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Repository Pattern이란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Repository Pattern은 도메인과 데이터 매핑 레이어 사이를 캡슐화하여\n'
                            '데이터 저장 로직을 비즈니스 로직으로부터 분리하는 디자인 패턴입니다.\n\n'
                            '쉽게 말해, "데이터를 어떻게 가져올지"에 대한 세부사항을\n'
                            '비즈니스 로직에서 숨겨주는 패턴이에요.',
                        detailContent:
                            'Repository Pattern의 핵심 개념:\n\n'
                            '🔸 1. 데이터 접근 추상화\n'
                            '  - API, 로컬 DB, 캐시 등 다양한 데이터 소스를 하나의 인터페이스로 통합\n'
                            '  - 비즈니스 로직은 데이터가 어디서 오는지 몰라도 됨\n\n'
                            '🔸 2. 의존성 역전 (Dependency Inversion)\n'
                            '  - 상위 계층이 하위 계층의 구현에 의존하지 않음\n'
                            '  - 인터페이스를 통해 느슨한 결합 구현\n\n'
                            '🔸 3. 테스트 용이성\n'
                            '  - Repository를 Mock으로 대체해서 독립적인 테스트 가능\n'
                            '  - 네트워크나 DB 없이도 비즈니스 로직 테스트 가능\n\n'
                            '🔸 4. 관심사의 분리\n'
                            '  - 데이터 접근 로직과 비즈니스 로직을 명확히 분리\n'
                            '  - 각 레이어가 자신의 책임에만 집중\n\n'
                            'Clean Architecture에서는 Data Layer의 핵심 구성 요소로 사용됩니다.',
                        toggleText: '개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            '개념을 보니까..\n   진짜 필요한 건가요? 그냥 API 직접 호출하면 안 되나요?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '저도 학생인턴 전에는 그렇게 생각했어요.\n\n'
                            '제 2만줄 코드 잎사이 프로젝트 단순히 바로 DIO 호출하고 끝내면 되는 간편한 코드였는데..\n'
                            '"Repository 만들고, ServiceFile 만들고... 너무 복잡한 거 아닌가?"\n'
                            '"그냥 view에서 바로 API 호출하면 안 될까?" 라고 인턴 경험 중 생각했거든요.\n\n'
                            '실제로 작은 프로젝트에서는 Repository 없이도 문제없이 동작했습니다.\n'
                            '하지만 프로젝트가 커지면서...',
                        toggleText: '처음엔 불필요해 보였지만\n실제로 겪은 문제들이 궁금하다면 Click',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '프로젝트가 커지면서 겪은 실제 문제들:\n\n'
                            '❌ **데이터 로직이 여기저기 흩어짐**\n'
                            '• 같은 API 호출 로직이 여러 Cubit에 중복됨\n'
                            '• 로그인 상태 확인 로직이 모든 API 호출마다 반복됨\n'
                            '• 에러 처리 로직이 일관성 없이 각각 다르게 구현됨\n\n'
                            '❌ **테스트가 어려움**\n'
                            '• Cubit 테스트할 때마다 실제 API 서버가 필요함\n'
                            '• 네트워크 에러 상황을 재현하기 어려움\n'
                            '• 비즈니스 로직과 데이터 접근 로직이 섞여서 독립적 테스트 불가능\n\n'
                            '❌ **변경에 취약함**\n'
                            '• API 응답 형식이 바뀌면 모든 관련 Cubit을 수정해야 함\n'
                            '• 로컬 캐싱을 추가하려면 여러 곳을 동시에 변경해야 함\n'
                            '• 다른 API로 교체할 때 영향 범위가 예측하기 어려움\n\n'
                            '✅ **Repository Pattern 도입 후**\n'
                            '• 데이터 접근 로직이 한 곳에 집중됨\n'
                            '• Mock Repository로 쉽게 테스트 가능\n'
                            '• API 변경 시 Repository만 수정하면 됨\n'
                            '• 로컬 캐싱, 재시도 로직 등을 Repository에서 일관성 있게 처리\n\n'
                            '처음에는 "과한 것 같다"고 생각했지만,\n'
                            '실제로 사용해보니 코드 품질과 유지보수성이 확실히 개선되었어요.\n\n'
                            '특히 인턴시절 회사 프로젝트에서는 "데이터는 Repository에서만 가져온다"는\n'
                            '명확한 규칙이 있어서 협업할 때도 혼란이 없었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '이제부터는 제가 실제 프로젝트에서 사용하는',
                        textSubTitle: 'Repository Pattern 구현 방법을 소개합니다.',
                        textSubTitle2:
                            '\n\n\n\n소개하는 코드는 제 잎사이 프로젝트에서 실제로 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      RepositoryPattern(
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        isMobile: widget.isMobile,
                      ),
                      SizedBox(height: widget.isMobile ? 150.h : 150),
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
