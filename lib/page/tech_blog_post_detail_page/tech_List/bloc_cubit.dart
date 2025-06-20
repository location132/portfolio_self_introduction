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

class BlocCubitPage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const BlocCubitPage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<BlocCubitPage> createState() => _BlocCubitPageState();
}

class _BlocCubitPageState extends State<BlocCubitPage> {
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
        cubit.setScrollTargetOffset(position.dy - 100);
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
                    title: 'BLoC / Cubit',
                    tags: const [
                      '#BLoC',
                      '#Cubit',
                      '#State Management',
                      '#Flutter',
                      '#Provider',
                      '#상태 관리',
                      '#플러터',
                      '#ReactiveX',
                      '#Stream',
                    ],
                    content:
                        'Flutter로 개발하면서 가장 많이 고민하게 되는 것 중 하나가 "상태 관리"입니다.\n'
                        'setState부터 시작해서 Provider, Riverpod, BLoC(cubit)까지... 정말 많은 선택지가 있죠.\n\n'
                        '저는 처음에 setState로 시작했다가, Provider를 거쳐 현재는 Cubit(BLoC)을 주로 사용하고 있습니다.\n'
                        '"왜 굳이 Cubit을 써야 하나?" "다른 상태관리만으로도 충분하지 않나?" 라는 의문을 갖고 계시는 분들이 많을 것 같아요.\n\n'
                        '저도 처음에는 그랬거든요. 하지만 프로젝트가 커지고 복잡해질수록 Cubit의 장점을 체감하게 되었습니다.\n\n'
                        '2024년 6월부터 본격적으로 Cubit을 도입해서 사용해온 경험과\n'
                        'MVVM, Clean Architecture와 함께 사용하면서 느낀 Cubit의 매력을 공유해보겠습니다.\n\n'
                        '완벽하지는 않지만, 제가 Flutter에서 Cubit을 어떻게 활용하고 있는지 알려드릴게요.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'BLoC / Cubit이란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'BLoC(Business Logic Component)은 Flutter에서 상태 관리를 위한 패턴입니다.\n'
                            'Cubit은 BLoC 패턴의 간소화된 버전으로, Stream 대신 단순한 함수 호출로 상태를 변경할 수 있어요.\n\n'
                            '쉽게 말해, UI와 비즈니스 로직을 분리해서\n'
                            '상태 변화를 예측 가능하고 테스트하기 쉽게 만드는 도구입니다.',
                        detailContent:
                            'BLoC / Cubit의 핵심 개념:\n\n'
                            '🔸 1. BLoC (Business Logic Component)\n'
                            '  - Stream 기반의 상태 관리 패턴\n'
                            '  - Event를 입력받아 State를 출력하는 구조\n'
                            '  - 복잡한 비즈니스 로직에 적합\n\n'
                            '🔸 2. Cubit (Cubic)\n'
                            '  - BLoC의 간소화된 버전\n'
                            '  - Event 없이 직접 함수 호출로 상태 변경\n'
                            '  - 더 단순하고 직관적인 구조\n\n'
                            '🔸 3. 주요 장점\n'
                            '  - UI와 비즈니스 로직의 완전한 분리\n'
                            '  - 테스트하기 쉬운 구조\n'
                            '  - 예측 가능한 상태 변화\n'
                            '  - DevTools를 통한 디버깅 지원\n\n'
                            '🔸 4. 상태 관리 흐름\n'
                            '  - UI에서 Action 발생\n'
                            '  - Cubit/BLoC에서 비즈니스 로직 처리\n'
                            '  - emit()으로 새로운 상태 방출\n'
                            '  - BlocBuilder가 상태 변화를 감지해 UI 재구성\n\n'
                            'Provider보다 더 구조적이고, setState보다 훨씬 강력한 상태 관리를 제공합니다.',
                        toggleText: '개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '사람들이 사용하지 않는 상태관리??',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isPadding: false,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Flutter 3000명이 있는 단톡방에 들어가면, 단골질문들이 있습니다.\n\n'
                            '질문 : 다들 상태관리 뭐 사용하시나요?\n\n'
                            '답변 1 : setState\n'
                            '답변 2 : Provider\n'
                            '답변 3 : Riverpod..Bloc..\n\n'
                            '상태관리는 setState만으로 충분해요 라는 사람들은 보면서 얼마나 똑똑하길래.. 나도 Service 패턴을 사용하기는 하지만 엄청나네라고 혼자 생각하기도 했었던 기억이 있습니다.\n'
                            '\n\n하지만 언제 어디서나 Cubit 사용해요 라는 답변은 볼 수 없었고\n저 혼자 톡방에서 Cubit! 이라고 외치고 있었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '이제부터는 제가 실제 프로젝트에서 사용하는',
                        textSubTitle: 'BLoC의Cubit 구현 방법과 패턴을 소개합니다.',
                        textSubTitle2:
                            '\n\n\n\n소개하는 코드는 제 잎사이 프로젝트와 포트폴리오 웹에서 실제로 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      //---------이제 내 이야기 시작------------------------
                      // Cubit vs BLoC 비교
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Cubit vs BLoC, 저는 Cubit을 선택했어요',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'BLoC과 Cubit 중에서 저는 주로 Cubit을 사용합니다.\n'
                            '가장 중요한 이유는 Page와 View, 그리고 State를 1대1로 대응시킬 수 있기 때문이에요.\n\n'
                            '제 프로젝트 구조는 이렇습니다:\n'
                            '• desktopPage → desktopCubit → desktopState\n'
                            '• mobilePage → mobileCubit → mobileState\n'
                            '• 각 페이지는 독립적인 Cubit과 State를 가져야 함\n\n'
                            '즉, mobilePage에서 desktopPage의 Cubit을 사용하지 못하게 하여\n'
                            '상태 관리의 명확한 경계를 만들 수 있어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'State - Freezed로 정의',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@freezed
class DesktopState with _$DesktopState {
  const factory DesktopState({

    //StartAnimation 컨트롤러
    StartAnimationModel? startAnimation,

    @Default(BannerModel()) BannerModel bannerModel,
   
    @Default(MySkillModel()) MySkillModel mySkillModel,
   
    @Default(ChapterModel()) ChapterModel chapterModel,
   
    @Default(ScrollModel()) ScrollModel scrollModel,
   
    @Default(InitModel()) InitModel initModel,
   
    @Default(DetailMeModel()) DetailMeModel detailMeModel,
   
    @Default(ProjectModel()) ProjectModel projectModel,

  }) = _DesktopState;
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Cubit - 1대1 대응 구조',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@injectable
class DesktopCubit extends Cubit<DesktopState> {
  DesktopCubit()
    : super(
        DesktopState(
          scrollModel: ScrollModel(scrollController: ScrollController()),
        ),
      );

  @postConstruct
  void init() async {
    if (!isClosed) {
      emit(state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.active),
      ));
    }

    final controller = state.scrollModel.scrollController;
    if (controller != null) {
      await changeProfileViewHeight(controller);
    }

    // 초기화 완료 후 스크롤 활성화
    if (!isClosed) {
      emit(state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.inactive),
        scrollModel: state.scrollModel.copyWith(isScrollEnabled: true),
      ));
    }
  }

  // 브라우저 확인
  void isChromeBrowser(bool isChrome) {
    emit(state.copyWith(
      initModel: state.initModel.copyWith(isChromeBrowser: isChrome),
    ));
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '1대1 대응 구조의 장점:\n\n'
                            '✅ 명확한 책임 분리: 각 페이지가 자신만의 상태를 가짐\n'
                            '✅ 디버깅 용이성: 문제가 생기면 해당 페이지의 Cubit만 확인하면 됨\n'
                            '✅ 독립적 개발: 다른 페이지에 영향 주지 않고 개발 가능\n'
                            '✅ 메모리 관리: 페이지가 사라지면 해당 Cubit도 함께 정리됨\n'
                            '✅ 팀 협업: "이 페이지는 이 Cubit만 봐라"는 명확한 규칙\n\n'
                            'Cubit: Function → Cubit → State (단순하고 직관적)\n\n'
                            '제 프로젝트는 복잡한 Event, 그리고 EventBus(이벤트 버스는 이론만 알고 사용해본적 없습니다!)\n'
                            '처리보다는 명확한 페이지별 상태 관리가 더 중요했어서 Cubit을 선택했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 실제 프로젝트 Cubit 예시
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '실제 프로젝트의 Cubit 구현',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이제 제 포트폴리오 프로젝트에서 실제로 사용하는 Cubit을 보여드릴게요.\n'
                            '저는 어노테이션을 즐겨 사용하고 있어요.\n\n'
                            '@injectable, @postConstruct, @freezed, @SingleTone\n\n'
                            '실제 큐빅을 전부 보여드리기에는 300줄이 넘어 초기 상태만 보여드릴게요.\n',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '지금 보는 웹 페이지 Cubit 기반 코드에요!',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@injectable
class MobileCubit extends Cubit<MobileState> {
  late final VoidCallback _scrollListener;

  MobileCubit()
    : super(
        MobileState(
          scrollModel: ScrollModel(scrollController: ScrollController()),
        ),
      ) {
    _scrollListener = () {
      final ctrl = state.scrollModel.scrollController;
      if (ctrl == null || !ctrl.hasClients) return;
      if (ctrl.offset >= ctrl.position.maxScrollExtent) {
        introAtBottom();
        ctrl.removeListener(_scrollListener);
      }
    };
    state.scrollModel.scrollController?.addListener(_scrollListener);
  }

  @postConstruct
  void init({bool isDescription = true}) async {
    // introAtBottom();
    //TODO: 배포시 주석 해제
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isHome: true),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
      ),
    );
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '잎사이 프로젝트 소개 웹페이지 Cubit 코드',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 사용자 스크롤 감지 및 섹션별 애니메이션 처리
void viewListener(String viewName) async {
  if (!state.scrollModel.isScrollEnabled || isClosed) return;

  if (ProfileViewConditionUtils.isBannerScrollActive(viewName)) {
    emit(
      state.copyWith(
        bannerModel: state.bannerModel.copyWith(
          isBannerActive: true,
          currentTitleIndex: 1,
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 400));
    if (!isClosed) {
      emit(
        state.copyWith(
          scrollModel: state.scrollModel.copyWith(
            bannerState: BannerState.activated,
          ),
        ),
      );
    }

    await Future.delayed(const Duration(milliseconds: 300));
    if (!isClosed) {
      playerActive('banner', isActive: true);
    }
  } else if (ProfileViewConditionUtils.isSkillScrollActive(viewName)) {
    emit(
      state.copyWith(
        mySkillModel: state.mySkillModel.copyWith(
          status: MySkillViewStatus.active,
        ),
      ),
    );

    // 제목 애니메이션 완료 후 버튼 표시
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!isClosed) {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(isButtonVisible: true),
        ),
      );
    }
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Cubit 구현에서 중요한 포인트들:\n\n'
                            '✅ Freezed 사용: 불변성과 copyWith() 자동 생성\n'
                            '✅ 단일 책임: 각 함수는 하나의 명확한 역할만 담당\n'
                            '✅ 상태 검증: isClosed 체크로 메모리 누수 방지\n'
                            '✅ 의존성 주입: @injectable로 Clean Architecture와 연동\n\n'
                            '이런 구조로 복잡한 상태도 깔끔하게 관리할 수 있어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // UI에서 Cubit 사용하기
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'UI에서 Cubit 사용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '제 프로젝트의 핵심 구조를 보여드릴게요!\n\n'
                            '✅ Page 계층: 의존성 주입과 초기 설정 담당\n'
                            '✅ View 계층: 실제 UI 로직과 상태 구독 담당\n'
                            '✅ di<MobileCubit>(): 의존성 주입으로 Cubit 생성\n'
                            '✅ 1대1 대응: MobilePage → MobileCubit → MobileState\n\n'
                            'BlocProvider로 상태를 제공하고, BlocBuilder로 상태를 구독합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Page와 View 분리 구조',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class MobilePage extends StatelessWidget {
  const MobilePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: isMobileDevice
          ? isFoldable
              ? const Size(770, 900)
              : const Size(450, 752)
          : Size(logicalWidth, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => di<MobileCubit>(), // 여기! => 의존성 주입으로 Cubit 생성
          child: _MobileView( // 여기! => Page와 View 분리
            deviceType: deviceType,
            isMobileDevice: isMobileDevice,
            isFoldable: isFoldable,
          ),
        );
      },
    );
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'View 계층 코드(UI 로직)',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class _MobileView extends StatefulWidget {
  const _MobileView({});

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MobileCubit>().isMobileFoldable(widget.isFoldable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileCubit, MobileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isBackgroundColorWhite 
              ? Colors.white 
              : Colors.black,
          body: CustomScrollView(
            controller: state.scrollModel.scrollController,
            slivers: [
              if (state.introModel.isHome)
                SliverToBoxAdapter(
                  child: IntroPage(
                    onScrollEnd: () {
                      context.read<MobileCubit>().introAtBottom();
                    },
                  ),
                ),
              SliverToBoxAdapter(
                child: NaviBar(
                  state: state,
                  mobileCubit: context.read<MobileCubit>(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Page/View 분리 구조의 장점:\n\n'
                            '✅ 명확한 책임 분리: Page는 설정, View는 UI 로직\n'
                            '✅ 의존성 주입: di<MobileCubit>()로 깔끔한 의존성 관리\n'
                            '✅ 테스트 용이성: View만 따로 테스트 가능\n'
                            '✅ 재사용성: 같은 Cubit을 다른 View에서 재사용 가능\n'
                            '✅ 단방향 데이터 흐름: UI → Cubit → State → UI\n\n'
                            'context.read<MobileCubit>().메서드명() 으로 간단하게 상태 변경하고,\n'
                            'BlocBuilder에서 상태 변화를 감지해 UI를 자동으로 업데이트합니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 마무리 스토리
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '마치며',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'BLoC/Cubit을 도입한 지 약 6개월이 지났습니다.\n'
                            '처음에는 Provider보다 어려웠지만 지금은 없으면 안 될 저만의 필수 Skill이 되었습니다.\n'
                            '특히 제가 강조하고 싶은 것은\n\n'
                            '1대1 대응 구조입니다.\n\n'
                            'desktopPage → desktopCubit → desktopState\n'
                            'mobilePage → mobileCubit → mobileState\n'
                            '이런 구조로 각 페이지가 독립적인 상태를 가지게 되면서\n'
                            '디버깅도 쉬워지고, 머리가 잘 안돌아가는 날?.. "이 페이지는 이 Cubit만 보면 된다"는\n'
                            '명확한 규칙이 생겼습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '또한 Page/View 분리 구조와 의존성 주입(di<MobileCubit>())을\n'
                            'Clean Architecture와 함께 사용하면서\n'
                            '코드의 가독성과 유지보수성이 크게 향상되었습니다.\n\n'
                            '@injectable, @postConstruct, @freezed 같은\n'
                            '어노테이션들과 함께 사용하면 더욱 강력해지죠 maybe?..\n\n'
                            '물론 아직 완벽하지는 않습니다.\n'
                            '앞으로도 더 좋은 패턴과 구조를 찾아가며 발전시켜 나갈 예정이에요!\n\n',
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
