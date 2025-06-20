import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/subtitle_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/List/widget/title_text_tech.dart';

class PresentationLayer extends StatelessWidget {
  final bool isBackgroundColorWhite;

  const PresentationLayer({super.key, required this.isBackgroundColorWhite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Presentation (UI) 계층 제목
        TitleTextTechBlog(
          title: 'Presentation (UI) 계층',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),

        // Presentation Layer 설명
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Presentation 계층은 사용자와 직접 상호작용하는 UI와 상태 관리를 담당하는 계층입니다.\n'
              'Clean Architecture에서 가장 바깥쪽에 위치하며, 사용자의 입력을 받고 결과를 화면에 표시합니다.\n\n'
              '이 계층의 핵심은 "어떻게 보여줄 것인가"에 집중하면서도,\n'
              '비즈니스 로직은 내부 계층에 위임하는 것입니다.',
        ),
        const SizedBox(height: 80),

        // Cubit (상태 관리)
        SubtitleTextTechBlog(
          title: 'Cubit (상태 관리)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Cubit은 BLoC 패턴의 간소화된 버전으로, UI 상태를 관리합니다.\n'
              '비즈니스 로직은 Service 계층에 위임하고, 순수하게 상태 변화만 담당합니다.\n\n'
              '프로젝트의 Desktop Cubit 구현을 보겠습니다.',
        ),
        const SizedBox(height: 30),

        CodeBlock(
          title: '''DesktopCubit - 프로젝트 상태 관리''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
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
      emit(
        state.copyWith(
          initModel: state.initModel.copyWith(initState: InitState.active),
        ),
      );
    }

    final controller = state.scrollModel.scrollController;
    if (controller != null) {
      await changeProfileViewHeight(controller);
    }

    if (!isClosed) {
      emit(
        state.copyWith(
          initModel: state.initModel.copyWith(initState: InitState.inactive),
          scrollModel: state.scrollModel.copyWith(isScrollEnabled: true),
        ),
      );
    }
  }

  // 사용자 스크롤 감지 및 상태 관리
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
    }
  }

  // 프로젝트 카테고리 선택 상태 관리
  void selectProjectCategory(String category) async {
    if (state.projectModel.selectedProjectCategory == category) {
      return;
    }

    if (state.projectModel.isProjectListVisible) {
      emit(
        state.copyWith(
          projectModel: state.projectModel.copyWith(isProjectListAni: false),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 300));
    }

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          selectedProjectCategory: category,
          isProjectListVisible: true,
        ),
      ),
    );
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Cubit의 특징:\n\n'
              '✅ 오직 UI 상태 변경만 담당합니다\n'
              '✅ @injectable로 의존성 주입을 관리합니다\n'
              '✅ 예측 가능한 상태 변화 패턴을 제공합니다\n'
              '✅ Page, View와 독립적으로 기능합니다\n\n'
              '제 코드 스타일은 복잡한 비즈니스 로직은 Service에 위임하고,\n'
              'Cubit은 상태 변화에만 집중합니다.',
        ),
        const SizedBox(height: 80),

        // State 클래스
        SubtitleTextTechBlog(
          title: 'State 클래스',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'State 클래스는 UI가 보여줄 상태를 정의합니다.\n'
              'freezed를 사용해 불변성을 보장하고, copyWith로 안전한 상태 변경을 제공합니다.',
        ),
        const SizedBox(height: 30),

        CodeBlock(
          title: '''DesktopState - 프로젝트 상태 정의''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
@freezed
class DesktopState with _$DesktopState {
  const factory DesktopState({
    @Default(InitModel()) InitModel initModel,
    @Default(BannerModel()) BannerModel bannerModel,
    @Default(ChapterModel()) ChapterModel chapterModel,
    @Default(ScrollModel()) ScrollModel scrollModel,
    @Default(MySkillModel()) MySkillModel mySkillModel,
    @Default(DetailMeModel()) DetailMeModel detailMeModel,
    @Default(ProjectModel()) ProjectModel projectModel,
    StartAnimationModel? startAnimation,
  }) = _DesktopState;
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'State 클래스의 장점:\n\n'
              '✅ freezed로 불변성 보장됩니다\n'
              '✅ copyWith로 안전한 상태 변경이 가능합니다\n'
              '✅ 관련된 상태들을 모델별로 그룹화합니다\n'
              '✅ 컴파일 타임에 타입 안전성 검증됩니다\n\n',
        ),
        const SizedBox(height: 80),

        // Page와 View 분리 구조
        SubtitleTextTechBlog(
          title: 'Page와 View 분리 구조',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '제 프로젝트에서는 Page와 View를 명확히 분리합니다.\n'
              'Page는 BlocProvider와 초기 설정을 담당하고,\n'
              'View는 UI 렌더링과 상태 반응을 담당합니다.\n\n'
              '이 구조를 통해 관심사 분리와 재사용성을 높였습니다.',
        ),
        const SizedBox(height: 30),

        CodeBlock(
          title: '''DesktopPage - Page 계층 (BlocProvider 설정)''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
class DesktopPage extends StatelessWidget {
  final bool isChromeBrowser;
  final String deviceType;

  const DesktopPage({
    super.key,
    required this.isChromeBrowser,
    required this.deviceType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 의존성 주입을 통해 Cubit 제공
      create: (context) => di<DesktopCubit>(),
      child: _MainView(
        isChromeBrowser: isChromeBrowser,
        deviceType: deviceType,
      ),
    );
  }
}

// _MainView는 UI 렌더링과 상태 관리를 담당
class _MainView extends StatefulWidget {
  final bool isChromeBrowser;
  final String deviceType;
  
  const _MainView({
    required this.isChromeBrowser, 
    required this.deviceType
  });

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesktopCubit, DesktopState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            controller: state.scrollModel.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: BannerPage(
                  state: state,
                  desktopCubit: context.read<DesktopCubit>(),
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
        const SizedBox(height: 30),

        CodeBlock(
          title: '''BannerPage → BannerView 분리 구조''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// banner_page.dart - 중간 계층 (이벤트 처리 및 비즈니스 로직)
class BannerPage extends StatelessWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;

  const BannerPage({
    super.key,
    required this.state,
    required this.desktopCubit,
  });

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('banner-view'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.1 &&
            state.scrollModel.bannerState == BannerState.inactive) {
          // 비즈니스 로직 처리
          context.read<DesktopCubit>().viewListener('banner');
        }
      },
      child: BannerView(desktopCubit: desktopCubit, state: state),
    );
  }
}

// banner_view.dart - 순수 UI 구현
class BannerView extends StatefulWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;

  const BannerView({
    super.key,
    required this.state,
    required this.desktopCubit,
  });

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: TitleTextConstants.title1,
          subTitle: TitleTextConstants.subTitle1,
          description: TitleTextConstants.description1,
          isVisible: true,
        ),
        // Rive 애니메이션
        Visibility(
          visible: widget.state.bannerModel.isRiveVisible,
          child: AnimatedOpacity(
            opacity: widget.state.bannerModel.riveOpacity,
            duration: const Duration(milliseconds: 600),
            child: BannerRive(
              isStartAni: widget.state.scrollModel.bannerState == 
                  BannerState.activated,
            ),
          ),
        ),
        // 상호작용 요소
        Player(
          isPlayerAniOpacity: widget.state.bannerModel.isPlayerActive,
          onTap: () {
            widget.desktopCubit.playerActive('banner', isActive: false);
          },
        ),
      ],
    );
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '이 구조의 장점:\n\n'
              '✅ Page 계층: BlocProvider 설정과 의존성 주입만 담당합니다\n'
              '✅ 중간 Page: 이벤트 처리와 상태 전달을 담당합니다\n'
              '✅ View 계층: 순수 UI 렌더링과 애니메이션을 담당합니다\n'
              '✅ 각 계층의 책임이 명확하게 분리됩니다\n'
              '✅ View는 재사용 가능한 컴포넌트로 활용됩니다\n'
              '✅ 테스트 시 각 계층을 독립적으로 검증 가능합니다\n\n',
        ),
        const SizedBox(height: 80),

        // 의존성 주입
        SubtitleTextTechBlog(
          title: '의존성 주입 (Dependency Injection)',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              'Clean Architecture에서 의존성 주입은 매우 중요합니다.\n'
              '각 계층이 구체적인 구현이 아닌 추상화에 의존하도록 만듭니다.\n\n'
              '제 프로젝트에서는 GetIt과 injectable을 사용합니다.',
        ),
        const SizedBox(height: 30),

        CodeBlock(
          title: '''프로젝트 의존성 주입 설정''',
          language: 'dart',
          isBackgroundColor: isBackgroundColorWhite,
          code: r'''
// injector.dart
final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

void setupDependencies() {
  // Presentation Layer (Cubit들)
  getIt.registerFactory<DesktopCubit>(
    () => DesktopCubit(),
  );
  
  getIt.registerFactory<MobileCubit>(
    () => MobileCubit(),
  );
  
  getIt.registerFactory<TechBlogCubit>(
    () => TechBlogCubit(),
  );
  
  getIt.registerFactory<ProjectDetailCubit>(
    () => ProjectDetailCubit(),
  );
}

// main.dart
void main() {
  configureDependencies();
  runApp(MyApp());
}

// Page에서 Cubit 주입
class DesktopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<DesktopCubit>(), // GetIt을 통한 주입
      child: _MainView(),
    );
  }
}

// injectable 어노테이션 사용
@injectable
class DesktopCubit extends Cubit<DesktopState> {
  DesktopCubit() : super(DesktopState());
  
  @postConstruct
  void init() {
    // 초기화 로직
  }
}
''',
        ),
        const SizedBox(height: 30),
        StoryBlock(
          isBackgroundColor: isBackgroundColorWhite,
          story:
              '의존성 주입의 효과:\n\n'
              '✅ 느슨한 결합: 각 계층이 독립적으로 개발 및 테스트 가능합니다\n'
              '✅ 자동 등록: @injectable로 편리하게 등록됩니다\n'
              '✅ 생명주기 관리: factory와 singleton 패턴을 지원합니다\n'
              '✅ 테스트 친화적: Mock 객체로 쉽게 단위 테스트 가능합니다\n\n',
        ),
        const SizedBox(height: 180),
        TitleTextTechBlog(
          title: '긴 글을 마치며',
          isBackgroundColor: isBackgroundColorWhite,
        ),
        const SizedBox(height: 30),
        StoryBlock(
          story:
              '제가 작성한 코드 절대 정답이 아닙니다.\n'
              '하지만 조금씩 변화를 주고 성장하면 언젠가 더 클린하고 누구나 볼 수 있는 에일리언 코드가 아닌 코드를 만들 수 있다고 생각하고있습니다.\n\n'
              '다시 한번 학생인턴 시절 여러가지 패턴과 구조를 알려준 선임과 수석님에게 감사드립니다.',
          isBackgroundColor: isBackgroundColorWhite,
        ),
      ],
    );
  }
}
