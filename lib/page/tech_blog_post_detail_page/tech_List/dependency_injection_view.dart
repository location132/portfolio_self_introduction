import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/subtitle_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class DependencyInjectionView extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const DependencyInjectionView({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<DependencyInjectionView> createState() =>
      _DependencyInjectionViewState();
}

class _DependencyInjectionViewState extends State<DependencyInjectionView> {
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
                  // 개념
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
                    isBackgroundColor: state.isBackgroundColorWhite,
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
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
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
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '개념은 좋아 보이는데, 언제 써야 하는지 감이 안 잡히시죠?\n'
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
                      // 개념과, 내이야기 사이
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '의존성 주입 포스팅',
                        textSubTitle:
                            '\n자동 의존성 주입 구현하기\n4계층 아키텍쳐 + DI 설계\n다중 의존성과 순환 의존성',
                        textSubTitle2:
                            '\n\n\n\n소개하는 코드는 제 프로젝트들과 포트폴리오 웹에서 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      // 내 코드와 이야기 시작
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '자동 의존성 주입 구현하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '62개의 클래스가 서로 얽혀있는 상황에서\n'
                            'GetIt + Injectable로 자동 의존성 주입을 구현하는 과정부터 시작해보겠습니다.\n\n'
                            '저는 아래와 같이 설정하고 프로젝트를 진행했어요',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 1단계: pubspec.yaml 설정
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '1단계: pubspec.yaml에 필요한 패키지 추가',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml',
                        language: 'yaml',
                        code: '''dependencies:
  get_it: ^7.6.4
  injectable: ^2.3.2
  
dev_dependencies:
  injectable_generator: ^2.4.1
  build_runner: ^2.4.7''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 2단계: injector.dart 설정
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '2단계: injector.dart 기본 설정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'coreService/core/di/injector.dart',
                        language: 'dart',
                        code:
                            '''import 'package:my_dream/coreService/core/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt di = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => di.init();

class Injector {
  Injector._();

  static void init() {
    configureDependencies();
  }

  static void reset() {
    di.reset();
  }
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '✅ GetIt di = GetIt.instance; 로 전역 DI 컨테이너 생성\n'
                            '✅ @InjectableInit으로 자동 코드 생성 설정\n'
                            '✅ Injector.init()으로 초기화, reset()으로 정리\n\n'
                            '이 설정이 끝나면 Injectable이 알아서 injector.config.dart를 생성해줍니다!',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 3단계: main.dart에서 초기화
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '3단계: main.dart에서 DI 초기화',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'main.dart',
                        language: 'dart',
                        code: '''void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env 파일 로드
  await dotenv.load(fileName: '.env');

  await Isar.initializeIsarCore();

  // 의존성 주입 초기화 - 이 한 줄로 33개 클래스 모두 등록!
  Injector.init();  -->(중요)

  runApp(
    MultiProvider(
      providers: [
        // 이거 프로파이더는 Cubit과 ServiceFile을 보조하는 느낌으로 사용했어요
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(/* ... */),
    ),
  );
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '중요한 포인트는 Injector.init() 호출 순서입니다!\n'
                            '✅ WidgetsFlutterBinding.ensureInitialized() 이후\n'
                            '✅ runApp() 이전에 호출\n'
                            '✅ 이 한 줄로 33개 클래스가 모두 자동 등록됩니다',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 4단계: 실제 자동 생성된 코드 확인
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4단계: 자동 생성된 injector.config.dart 구경하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'flutter packages pub run build_runner build 명령어를 실행하면\n'
                            'Injectable이 자동으로 injector.config.dart 파일을 생성해줍니다.\n\n'
                            '한번 빌드는 build, 개발중이라면 watch 명령어를 사용중이에요',
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'injector.config.dart (자동 생성된 코드)',
                        language: 'dart',
                        code: '''// GENERATED CODE - DO NOT MODIFY BY HAND
// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

extension GetItInjectableX on GetIt {
  GetIt init({
    String? environment,
    EnvironmentFilter? environmentFilter,
  }) {
    final gh = GetItHelper(this, environment, environmentFilter);
    
    // Singleton으로 등록되는 Service들
    gh.singleton<CartRemoteSource>(() => CartRemoteSource());
    gh.singleton<CartRemoteRepository>(
        () => CartRemoteRepository(gh<CartRemoteSource>()));
    gh.singleton<CartRemoteService>(
        () => CartRemoteService(gh<CartRemoteRepository>()));
    ....(생략)
    
    // Factory로 등록되는 Cubit들
    gh.factory<ShoppingCartCubit>(
        () => ShoppingCartCubit(gh<CartRemoteService>()));
    ....(생략)
    
    // NaverMap 복잡한 의존성들도 자동 해결!
    gh.singleton<NaverMapDio>(() => NaverMapDio());
    gh.singleton<NaverMapRemoteSource>(
        () => NaverMapRemoteSource(gh<NaverMapDio>()));
    gh.singleton<NaverMapRemoteRepository>(() => NaverMapRemoteRepository(
          gh<NaverMapRemoteSource>(),
          gh<NaverMapLocalSource>(),
        ));
    gh.singleton<NaverMapService>(
        () => NaverMapService(gh<NaverMapRemoteRepository>()));
    gh.factory<NaverMapCubit>(() => NaverMapCubit(
          gh<NaverMapService>(),
          gh<LocationService>(),
          gh<NaverMapOverlayService>(),
        ));
    ....(생략)

    return this;
  }
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '위 에 본 코드 제가 만든 코드가 아닌 자동으로 생성된 코드에요\n\n'
                            '✅ 33개 클래스가 모두 자동으로 등록\n'
                            '✅ 의존성 순서도 자동으로 해결\n'
                            '✅ gh<T>() 형태로 자동 주입\n'
                            '✅ NaverMapCubit처럼 3개 서비스를 주입받는 복잡한 것도 자동!\n\n'
                            '이제 어디서든 di<ShoppingCartCubit>() 한 줄로 완성된 객체를 가져올 수 있어요!',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 챕터 2: 4계층 아키텍쳐 + DI 설계
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4계층 아키텍쳐 + DI 설계',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Source → Repository → Service → Cubit\n'
                            '이 4계층 구조를 DI와 함께 설계하는 방법을 소개하겠습니다,\n\n'
                            '장바구니, 네이버 맵, 가맹점 등 실제 기능별 구현 사례도 포함됩니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 4계층 구조 개념 설명
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4계층 구조의 역할과 의존성 방향',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '🔸 Source (DataSource) - 가장 하위 계층\n'
                            '   • 실제 API 호출, DB 접근, 로컬 저장소 관리\n'
                            '   • 외부 데이터를 내부 모델로 변환\n\n'
                            '🔸 Repository - 데이터 계층\n'
                            '   • Source를 주입받아 데이터 흐름 관리\n'
                            '   • 비즈니스 로직에서 데이터 소스를 추상화\n\n'
                            '🔸  Service - 비즈니스 로직 계층\n'
                            '   • Repository를 주입받아 실제 비즈니스 로직 처리\n'
                            '   • 복잡한 데이터 가공과 비즈니스 규칙 적용\n\n'
                            '🔸  Cubit - Presentation 계층\n'
                            '   • Service를 주입받아 UI 상태 관리\n'
                            '   • 사용자 액션을 받아 비즈니스 로직 호출',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 1계층: CartRemoteSource
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '1계층: CartRemoteSource (DataSource)',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'repository/cart_api/cart_reomte_source.dart',
                        language: 'dart',
                        code: '''import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_response.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_dio/my_shopping_cart_dio.dart';

@singleton  // Singleton으로 DI 등록
class CartRemoteSource {
  // 내 장바구니 조회
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    CartResponse response =
        await getMyCartWithDioRequest(cacheMemory: cacheMemory);
    return response.toModel();  // Response → Model 변환
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    RecommendedSideMenuResponse response =
        await getRecommendedSideMenuRequest(marketId);
    return response.toModel();  // Response → Model 변환
  }
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'DataSource의 핵심 역할:\n'
                            '✅ @singleton으로 DI 등록\n'
                            '✅ 실제 API 호출 (getMyCartWithDioRequest)\n'
                            '✅ Response를 Model로 변환 (response.toModel())\n'
                            '✅ 다른 클래스에 의존하지 않는 최하위 계층',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 2계층: CartRemoteRepository
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '2계층: CartRemoteRepository (Repository)',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title:
                            'repository/cart_api/cart_remote_repository.dart',
                        language: 'dart',
                        code: '''import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_source.dart';

@singleton  // Singleton으로 DI 등록
class CartRemoteRepository {
  final CartRemoteSource _cartRemoteSource;  // Source를 주입받음
  
  CartRemoteRepository(this._cartRemoteSource);  // 생성자 주입

  // 내 장바구니 조회
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    List<CartModel> cartData =
        await _cartRemoteSource.getMyCartWithDio(cacheMemory: cacheMemory);
    return cartData;  // 데이터 흐름 관리
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    final List<SideMenuModel> response =
        await _cartRemoteSource.getRecommendedSideMenu(marketId);
    return response;  // 데이터 흐름 관리
  }
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Repository의 핵심 역할:\n'
                            '✅ @singleton으로 DI 등록\n'
                            '✅ CartRemoteSource를 생성자로 주입받음\n'
                            '✅ 데이터 소스를 추상화하여 비즈니스 로직에서 분리\n'
                            '✅ 여러 데이터 소스를 조합할 수 있는 계층',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 3계층: CartRemoteService
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '3계층: CartRemoteService (Service)',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'repository/cart_api/cart_reomte_service.dart',
                        language: 'dart',
                        code: '''import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_remote_repository.dart';

@singleton  // Singleton으로 DI 등록
class CartRemoteService {
  final CartRemoteRepository _cartRemoteRepository;  // Repository를 주입받음

  CartRemoteService(this._cartRemoteRepository);  // 생성자 주입

  // 내 장바구니 조회
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    return await _cartRemoteRepository.getMyCartWithDio(
        cacheMemory: cacheMemory);
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    return await _cartRemoteRepository.getRecommendedSideMenu(marketId);
  }
  
  // 여기에 복잡한 비즈니스 로직들이 추가될 수 있음
  // 예: 장바구니 유효성 검사, 할인 적용, 재고 확인 등
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Service의 핵심 역할:\n'
                            '✅ @singleton으로 DI 등록\n'
                            '✅ CartRemoteRepository를 생성자로 주입받음\n'
                            '✅ 복잡한 비즈니스 로직 처리 (유효성 검사, 할인 적용 등)\n'
                            '✅ 여러 Repository를 조합하여 복합적인 기능 구현 가능',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 4계층: ShoppingCartCubit
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '4계층: ShoppingCartCubit (Presentation)',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title:
                            'Page/11_shopping_cart/pages/shopping_page/shopping_cart_cubit.dart',
                        language: 'dart',
                        code:
                            '''import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_service.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/shopping_cart_state.dart';

@injectable  // Factory로 DI 등록 (매번 새 인스턴스)
class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  final CartRemoteService _cartRemoteService;  // Service를 주입받음

  ShoppingCartCubit(this._cartRemoteService)  // 생성자 주입
      : super(const ShoppingCartState(screenState: ScreenState.loading));

  // 장바구니 조회
  Future<void> getMycart({
    int cacheMemory = 0,
    required LoginModel loginStatus,
    required CartProvider cartProvider,
  }) async {
    if (state.screenState != ScreenState.loading) {
      emit(state.copyWith(screenState: ScreenState.loading));
    }

    try {
      // Service를 통해 비즈니스 로직 호출
      final List<CartModel> cartData =
          await _cartRemoteService.getMyCartWithDio(cacheMemory: cacheMemory);

      if (cartData.isNotEmpty) {
        final int totalMenuItems = cartData[0].menu.length;
        
        // 복잡한 UI 로직들...
        await getRecommendedSideMenu(cartData[0].marketId);
        _updateUI(loginStatus, cartProvider, cartData, totalMenuItems);
      }

      emit(state.copyWith(
        cartModel: cartData,
        screenState: ScreenState.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(screenState: ScreenState.loaded));
    }
  }

  // 사장 추천 사이드 메뉴 추천
  Future<void> getRecommendedSideMenu(int marketId) async {
    final List<SideMenuModel> response =
        await _cartRemoteService.getRecommendedSideMenu(marketId);

    emit(state.copyWith(recommendedSideMenu: response));
  }
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Cubit의 핵심 역할:\n'
                            '✅ @injectable으로 DI 등록 (Factory - 매번 새 인스턴스)\n'
                            '✅ CartRemoteService를 생성자로 주입받음\n'
                            '✅ UI 상태 관리와 사용자 액션 처리\n'
                            '✅ emit()으로 상태 변경을 UI에 알림',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 실제 사용 예시
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '실제 페이지에서 DI로 Cubit 주입하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'shopping_cart_page.dart',
                        language: 'dart',
                        code:
                            '''class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // di<T>() 한 줄로 완전한 4계층 의존성이 모두 주입됨!
      create: (context) => di<ShoppingCartCubit>(),
      child: ShoppingCartView(),
    );
  }
}

// DI가 자동으로 해결하는 의존성 체인:
// di<ShoppingCartCubit>()
//  자동으로 CartRemoteService 주입
//  자동으로 CartRemoteRepository의 4개 파일 주입  
//  완성된 ShoppingCartCubit 반환!''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '저는 Page와 View를 분리하고 Page애서 의존성 주입 후 사용하고 있어요\n\n'
                            'di<ShoppingCartCubit>() 한 줄이면\n'
                            'GetIt이 알아서 4계층의 모든 의존성을 순서대로 주입해서\n'
                            '완전한 ShoppingCartCubit을 만들어줍니다!\n\n'
                            '✅ Source 생성 → Repository에 주입 → Service에 주입 → Cubit에 주입\n'
                            '✅ 모든 과정이 자동으로 처리됨\n'
                            '✅ 수동으로 관리할 필요 없음',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 챕터 3: 다중 의존성과 순환 의존성
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '다중 의존성과 순환 의존성',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'NaverMapCubit이 3개의 서비스를 동시에 주입받는 복잡한 구조와\n'
                            '순환 의존성이 발생했을 때 해결했던 실제 경험을 공유합니다.\n\n'
                            '이 부분이 가장 까다로웠어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // NaverMapCubit 다중 의존성 구조
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'NaverMapCubit의 복잡한 3개 서비스 동시 주입',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Page/12_naver_map/page/NaverMapApp_cubit.dart',
                        language: 'dart',
                        code: '''import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/12_naver_map/service/naver_map_service.dart';
import 'package:my_dream/Page/12_naver_map/service/naver_map_overlay.dart';
import 'package:my_dream/coreService/core/service/location_service.dart';

@injectable
class NaverMapCubit extends Cubit<NaverMapState> {
  final LocationService _locationService;
  final NaverMapService _naverMapService;
  final NaverMapOverlayService _overlayService;

  // 생성자에서 3개 서비스를 동시에 주입받음
  NaverMapCubit(
    this._naverMapService,
    this._locationService, 
    this._overlayService
  ) : super(NaverMapState(panelController: PanelController())) {
    // 상태 변경 콜백 설정
    _overlayService.onVisibilityChanged = (bool visible) {
      if (visible) {
        startCompassListener();
      } else {
        stopCompassListener();
      }
    };
  }

  // 네이버 맵 초기화 - 3개 서비스 모두 활용
  Future<void> onMapReady(NaverMapController controller, BuildContext context) async {
    emit(state.copyWith(mapController: controller));
    
    // NaverMapService 사용
    await _getNaverMapData();
    await _getNaverMapCategory();
    
    // LocationService 사용
    await initializeCurrentLocation();
    
    // OverlayService 사용
    if (context.mounted) {
      await _addMarkers(context);
    }
  }

  // LocationService 사용 - 현재 위치 기능
  Future<void> moveToCurrentLocation(BuildContext context) async {
    final position = await _locationService.getCurrentLocation();
    await _moveCameraToPosition(position);
  }

  // NaverMapService 사용 - 맵 데이터 관리
  Future<void> _getNaverMapData() async {
    final naverMapData = await _naverMapService.getAllNaverMapData();
    emit(state.copyWith(naverMapData: naverMapData));
  }

  // OverlayService 사용 - 마커 및 오버레이 관리
  Future<void> _addMarkers(BuildContext context) async {
    // 복잡한 마커 생성 로직...
    final markers = await _overlayService.createMarkers(state.naverMapData);
    await state.mapController?.addOverlayAll(markers);
  }
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구조의 특징:\n'
                            '✅ NaverMapService: 맵 데이터 및 설정 관리\n'
                            '✅ LocationService: GPS 위치 정보 처리\n'
                            '✅ NaverMapOverlayService: 마커, 오버레이 관리\n\n'
                            '각 서비스가 독립적인 역할을 담당하면서\n'
                            'NaverMapCubit에서 이들을 조합하여 복합적인 기능을 구현합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 자동 생성된 DI 코드에서 확인
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '자동 생성된 DI 코드에서 확인하는 복잡한 의존성',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'injector.config.dart (자동 생성)',
                        language: 'dart',
                        code: '''// 각 서비스들이 먼저 등록됨
gh.singleton<LocationService>(() => LocationService());

gh.singleton<NaverMapDio>(() => NaverMapDio());
gh.singleton<NaverMapRemoteSource>(() => NaverMapRemoteSource(gh<NaverMapDio>()));
gh.singleton<NaverMapLocalSource>(() => NaverMapLocalSource());
gh.singleton<NaverMapRemoteRepository>(() => NaverMapRemoteRepository(
  gh<NaverMapRemoteSource>(),
  gh<NaverMapLocalSource>(),
));
gh.singleton<NaverMapService>(() => NaverMapService(gh<NaverMapRemoteRepository>()));

gh.singleton<NaverMapOverlayService>(() => NaverMapOverlayService());

// 마지막에 NaverMapCubit이 3개 서비스를 모두 주입받아 생성됨
gh.factory<NaverMapCubit>(() => NaverMapCubit(
  gh<NaverMapService>(),        // 1번째 의존성
  gh<LocationService>(),        // 2번째 의존성
  gh<NaverMapOverlayService>(), // 3번째 의존성
));''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Injectable이 자동으로 의존성 순서를 분석해서:\n'
                            '✅ 1단계: 각 서비스들을 먼저 생성\n'
                            '✅ 2단계: NaverMapService는 Repository를 주입받아 생성\n'
                            '✅ 3단계: 마지막에 NaverMapCubit이 3개 서비스를 모두 주입받아 생성\n\n'
                            'di<NaverMapCubit>() 한 줄이면 이 모든 과정이 자동으로 처리됩니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 순환 의존성 문제와 해결
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '순환 의존성 문제와 해결 경험',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '개발 중에 이런 순환 의존성 문제가 발생했어요:\n\n'
                            '❌ CartService → OrderService → CartService\n'
                            '❌ UserService → AuthService → UserService\n\n'
                            'build_runner build 실행 시 순환 의존성 에러가 발생하며\n'
                            '컴파일이 되지 않았습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '문제가 된 순환 의존성 구조',
                        language: 'dart',
                        code: '''// 잘못된 구조 - 순환 의존성
@singleton
class CartService {
  final OrderService _orderService;  // CartService가 OrderService에 의존
  CartService(this._orderService);
}

@singleton  
class OrderService {
  final CartService _cartService;    // OrderService가 CartService에 의존
  OrderService(this._cartService);   // 순환 의존성 발생!
}

// build_runner 실행 시 에러 발생:
// Error: Cannot resolve dependencies. Circular dependency detected.''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '해결 방법 1: Repository 계층으로 분리\n'
                            '공통으로 사용되는 데이터 접근 로직을 Repository로 분리하여\n'
                            '각 Service가 Repository에만 의존하도록 구조를 변경했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Repository 패턴으로 분리',
                        language: 'dart',
                        code: '''// 해결된 구조 - Repository 패턴 적용
@singleton
class CartRepository {
  // 장바구니 데이터 관리
  Future<List<CartItem>> getCartItems() async { ... }
  Future<void> addToCart(CartItem item) async { ... }
}

@singleton
class OrderRepository {  
  // 주문 데이터 관리
  Future<List<Order>> getOrders() async { ... }
  Future<void> createOrder(Order order) async { ... }
}

@singleton
class CartService {
  final CartRepository _cartRepository;  // Repository에만 의존
  CartService(this._cartRepository);
}

@singleton
class OrderService {
  final OrderRepository _orderRepository;  // Repository에만 의존
  final CartRepository _cartRepository;    // 필요시 다른 Repository도 주입 가능
  OrderService(this._orderRepository, this._cartRepository);
}''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '해결 방법 2: Interface 분리\n'
                            '필요한 경우 abstract class를 사용해서\n'
                            '의존성을 더 세밀하게 제어할 수 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),

                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '실제로 적용한 해결책:\n'
                            '✅ 공통 데이터 접근 로직은 Repository 계층으로 분리\n'
                            '✅ Service 계층에서는 Repository만 주입받도록 설계\n'
                            '✅ 복잡한 비즈니스 로직은 여러 Repository를 조합하여 처리\n\n'
                            '이렇게 하니 순환 의존성 문제가 완전히 해결되었고\n'
                            '코드의 구조도 더 명확해졌습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      // 실제 페이지에서 다중 의존성 주입 확인
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '실제 페이지에서 복잡한 의존성 주입 사용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 20.h : 20),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'NaverMapApp_page.dart',
                        language: 'dart',
                        code: '''class NaverMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 한 줄로 복잡한 다중 의존성이 모두 해결됨
      create: (context) => di<NaverMapCubit>(),
      child: NaverMapView(),
    );
  }
}

// di<NaverMapCubit>()
//  1. LocationService 생성 및 주입
//  2. NaverMapDio → NaverMapRemoteSource → NaverMapLocalSource → 
//     NaverMapRemoteRepository → NaverMapService 순서로 생성 및 주입
//  3. NaverMapOverlayService 생성 및 주입
//  4. 3개 서비스를 모두 주입받은 완성된 NaverMapCubit 반환''',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'di<NaverMapCubit>() 한 줄로 처리되는 의존성들:\n'
                            '✅ LocationService: GPS 위치 정보 처리\n'
                            '✅ NaverMapService: 4계층 구조의 완전한 서비스 (Dio → Source → Repository → Service)\n'
                            '✅ NaverMapOverlayService: 마커 및 오버레이 관리\n\n'
                            '총 7개 이상의 클래스가 서로 얽혀있지만\n'
                            'Injectable이 모든 의존성을 자동으로 해결해줍니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
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
