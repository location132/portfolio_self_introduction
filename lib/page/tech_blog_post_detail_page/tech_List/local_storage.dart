import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class LocalStorage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const LocalStorage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
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
                    title: 'SharedPreferences & Flutter Secure Storage',
                    tags: const [
                      '#SharedPreferences',
                      '#FlutterSecureStorage',
                      '#Local Storage',
                      '#Caching',
                      '#Flutter',
                      '#로컬 저장소',
                      '#Dart',
                      '#보안',
                      '#데이터 저장',
                    ],
                    content:
                        '앱에서 데이터를 로컬에 저장해야 할 때, 어떤 방법을 선택해야 할까요?\n'
                        'SharedPreferences? Flutter Secure Storage? 언제 어떤 것을 사용해야 할까요?\n\n'
                        '저는 처음에 모든 데이터를 SharedPreferences에 저장했습니다.\n'
                        '간단하고 사용하기 쉬웠기 때문이죠. 하지만 프로젝트가 커지면서 문제가 보이기 시작했습니다.\n\n'
                        '특히 로그인 토큰을 SharedPreferences에 저장하다가 보안 이슈를 깨닫게 되었고,\n'
                        '그때부터 "언제 어떤 저장소를 사용해야 하는가?"에 대해 고민하기 시작했습니다.\n\n'
                        '이제는 각각의 특성을 이해하고 적재적소에 활용하고 있습니다.\n'
                        '실제 프로젝트에서 어떻게 구분해서 사용하고 있는지 공유해보겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '로컬 스토리지란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Flutter에서 데이터를 기기에 저장하는 다양한 방법들과 각각의 특징을 알아봅시다.\n'
                            'SharedPreferences는 간단한 설정값에, Flutter Secure Storage는 민감한 정보에 사용합니다.\n\n'
                            '각각 언제 사용해야 하는지, 어떤 차이점이 있는지 알아보겠습니다.',
                        detailContent:
                            '📱 **로컬 스토리지의 필요성**\n'
                            '• 앱을 종료해도 데이터가 유지되어야 할 때\n'
                            '• 네트워크 없이도 앱이 동작해야 할 때\n'
                            '• 사용자 설정값을 기억해야 할 때\n'
                            '• 로그인 정보를 안전하게 저장해야 할 때\n\n'
                            '🔧 **Flutter의 주요 로컬 스토리지 옵션들**\n\n'
                            '**1. SharedPreferences**\n'
                            '• 간단한 키-값 쌍 저장\n'
                            '• 앱 설정, 테마, 언어 등에 적합\n'
                            '• 암호화되지 않음 (보안이 필요 없는 데이터)\n'
                            '• 사용이 매우 간단함\n\n'
                            '**2. Flutter Secure Storage**\n'
                            '• 암호화된 저장소\n'
                            '• 토큰, 비밀번호, 개인정보 등에 적합\n'
                            '• iOS Keychain, Android Keystore 활용\n'
                            '• 보안이 중요한 데이터에 사용\n\n'
                            '**3. 언제 어떤 것을 사용할까?**\n'
                            '• 일반 설정값 → SharedPreferences\n'
                            '• 민감한 정보 → Flutter Secure Storage\n'
                            '• 복잡한 데이터 → Hive, Isar 등',
                        toggleText: '로컬 스토리지 개념 알아보기',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '왜 로컬 스토리지 전략이 중요할까?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '실제 앱 개발에서 겪는 로컬 스토리지 관련 문제들을 알아봅시다.\n'
                            '잘못된 선택이 어떤 결과를 가져오는지, 올바른 전략의 장점은 무엇인지\n\n'
                            '실제 프로젝트 경험을 바탕으로 설명드리겠습니다.',
                        toggleText: '실무에서의 중요성 알아보기',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '실제 앱 개발에서 겪는 로컬 스토리지 관련 문제들:\n\n'
                            '❌ **잘못된 선택의 결과들**\n'
                            '• SharedPreferences에 토큰 저장 → 보안 취약점 발생\n'
                            '• Secure Storage에 일반 설정값 저장 → 불필요한 성능 저하\n'
                            '• 적절한 예외처리 없음 → 앱 크래시 발생\n'
                            '• 데이터 타입 변환 실수 → 런타임 에러\n\n'
                            '✅ **올바른 전략의 장점들**\n'
                            '• 적재적소에 맞는 저장 방법 선택\n'
                            '• 보안성과 성능의 균형\n'
                            '• 안정적인 데이터 관리\n'
                            '• 사용자 경험 향상\n\n'
                            '✅ **실제 프로젝트 적용 경험**\n'
                            '• "처음엔 모든 걸 SharedPreferences에 저장했다가 보안 이슈로 리팩토링했습니다"\n'
                            '• "Secure Storage의 성능을 고려하지 않아 앱이 느려졌던 경험이 있어요"\n'
                            '• "적절한 예외처리로 안정적인 앱을 만들 수 있었습니다"',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '이제부터는 제가 프로젝트에서 사용하는',
                        textSubTitle:
                            'SharedPreferences & Flutter Secure Storage 구현 방법을 소개합니다.',
                        textSubTitle2: '\n\n\n\n소개하는 코드는 제 프로젝트에서 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      //---------이제 내 이야기 시작------------------------
                      // 1번: SharedPreferences 기본 구현
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'SharedPreferences로 구현하는 앱 설정 관리 시스템',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),

                      // TODO: SharedPreferences 구현 내용
                      Container(
                        padding: EdgeInsets.all(widget.isMobile ? 16.w : 24),
                        margin: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16.w : 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          'TODO: SharedPreferences 기본 구현\n'
                          '- 의존성 추가\n'
                          '- 기본 사용법\n'
                          '- 타입별 저장/불러오기\n'
                          '- 예외처리',
                          style: TextStyle(
                            fontSize: widget.isMobile ? 14.sp : 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 2번: Flutter Secure Storage 기본 구현
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Flutter Secure Storage로 구현하는 보안 토큰 관리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),

                      // TODO: Flutter Secure Storage 구현 내용
                      Container(
                        padding: EdgeInsets.all(widget.isMobile ? 16.w : 24),
                        margin: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16.w : 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          'TODO: Flutter Secure Storage 기본 구현\n'
                          '- 의존성 추가 및 설정\n'
                          '- 기본 사용법\n'
                          '- 토큰 저장/불러오기\n'
                          '- 보안 옵션 설정',
                          style: TextStyle(
                            fontSize: widget.isMobile ? 14.sp : 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 3번: Service Layer 패턴으로 통합 관리
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Service Layer 패턴으로 통합하는 로컬 스토리지 관리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),

                      // TODO: Service Layer 구현 내용
                      Container(
                        padding: EdgeInsets.all(widget.isMobile ? 16.w : 24),
                        margin: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16.w : 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          'TODO: Service Layer 패턴 구현\n'
                          '- LocalStorageService 설계\n'
                          '- 의존성 주입 설정\n'
                          '- 통합 인터페이스 제공\n'
                          '- 에러 핸들링 전략',
                          style: TextStyle(
                            fontSize: widget.isMobile ? 14.sp : 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 4번: 실전 활용 - 자동 로그인 시스템
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '실전 활용 - 자동 로그인 시스템 구현하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),

                      // TODO: 자동 로그인 시스템 구현 내용
                      Container(
                        padding: EdgeInsets.all(widget.isMobile ? 16.w : 24),
                        margin: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16.w : 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          'TODO: 자동 로그인 시스템 구현\n'
                          '- 로그인 상태 관리\n'
                          '- 토큰 자동 갱신\n'
                          '- 보안 고려사항\n'
                          '- 사용자 경험 최적화',
                          style: TextStyle(
                            fontSize: widget.isMobile ? 14.sp : 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 5번: 성능 최적화와 베스트 프랙티스
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '성능 최적화와 베스트 프랙티스',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),

                      // TODO: 성능 최적화 내용
                      Container(
                        padding: EdgeInsets.all(widget.isMobile ? 16.w : 24),
                        margin: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16.w : 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          'TODO: 성능 최적화와 베스트 프랙티스\n'
                          '- 메모리 사용량 최적화\n'
                          '- 비동기 처리 최적화\n'
                          '- 데이터 타입별 저장 전략\n'
                          '- 실무에서의 주의사항',
                          style: TextStyle(
                            fontSize: widget.isMobile ? 14.sp : 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),
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
