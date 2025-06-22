import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';

class FreezedPage extends StatefulWidget {
  final bool isMobile;
  final Function(bool) isFocused;
  final ScrollController scrollController;

  const FreezedPage({
    super.key,
    required this.isMobile,
    required this.isFocused,
    required this.scrollController,
  });

  @override
  State<FreezedPage> createState() => _FreezedPageState();
}

class _FreezedPageState extends State<FreezedPage> {
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
                    title: 'Freezed',
                    tags: const [
                      '#Freezed',
                      '#Immutable',
                      '#Data Class',
                      '#Code Generation',
                      '#copyWith',
                      '#Union Types',
                      '#불변 객체',
                      '#데이터 클래스',
                    ],
                    content:
                        '모델 클래스를 정의하고, 그걸 Cubit의 State로 연결할 때\n'
                        'Freezed를 도입해 @freezed 어노테이션만 붙이면 모든 반복 코드를 자동으로 생성해줍니다.\n'
                        '저는 이 기능을 너무 편하게 사용하고 있습니다.\n\n'
                        '• Model 클래스: 필드 선언만으로 불변(immutable) 모델 완성\n'
                        '• State 클래스: 상태 클래스 정의·복제·비교 로직 자동 생성\n'
                        '• Cubit에서 사용: copyWith()로 안전하고 깔끔한 상태 업데이트\n\n'
                        '이 포스트에서는 제 프로젝트에서 실제로 사용하는 3가지 Freezed 활용 방법을 소개합니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Freezed란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Freezed는 Dart/Flutter에서 불변(immutable) 클래스를 쉽게 만들 수 있게 해주는\n'
                            '코드 생성 라이브러리입니다.\n\n'
                            '@freezed 어노테이션 하나로 toString(), operator ==(), hashCode(), \n'
                            'copyWith() 등의 메서드를 자동 생성해줍니다.',
                        detailContent:
                            'Freezed의 핵심 기능:\n\n'
                            '🔸 1. 자동 코드 생성\n'
                            '  - toString(), operator ==(), hashCode() 자동 생성\n'
                            '  - copyWith() 메서드로 쉬운 객체 복사 및 수정\n'
                            '  - JSON 직렬화/역직렬화 지원 (json_serializable과 함께)\n\n'
                            '🔸 2. 불변성 보장\n'
                            '  - 모든 프로퍼티가 final로 생성됨\n'
                            '  - 객체 생성 후 값 변경 불가\n'
                            '  - copyWith()를 통한 안전한 객체 변경\n\n'
                            '🔸 3. Union Types 지원\n'
                            '  - 하나의 클래스에서 여러 상태를 표현 가능\n'
                            '  - Loading, Success, Error 등의 상태를 타입 안전하게 처리\n'
                            '  - when(), map() 메서드로 패턴 매칭 지원\n\n'
                            '🔸 4. 개발자 친화적\n'
                            '  - 보일러플레이트 코드 대폭 감소\n'
                            '  - IDE 자동완성과 리팩토링 지원\n'
                            '  - 타입 안전성 보장\n\n'
                            'BLoC 패턴이나 Provider와 함께 사용하면 상태 관리가 훨씬 깔끔해집니다.',
                        toggleText: '개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            '개념을 보니까..\n   그냥 UI View나 Class에 변수 넣어서 사용하면 안되나요',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '저도 처음에는 그렇게 코드를 작성했습니다.\n\n'
                            '"그냥 class 만들고 생성자 정의하면 되는데 왜 이런 복잡한 걸 써야 하지?"\n'
                            '"어노테이션에 build_runner까지... 너무 번거로운 거 아닌가?"\n\n'
                            '실제로 간단한 모델 클래스 몇 개라면 일반 클래스로도 충분합니다.\n'
                            '하지만 프로젝트가 커지면서...',
                        toggleText: '처음엔 불필요해 보였지만\n실제로 겪은 문제들이 궁금하다면 Click',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '일반 클래스를 사용하면서 겪은 실제 문제들:\n\n'
                            '❌ 반복되는 보일러플레이트 코드\n'
                            '• 모델 클래스마다 toString(), operator ==(), hashCode() 직접 구현\n'
                            '• 프로퍼티 추가할 때마다 이 메서드들도 함께 수정해야 함\n'
                            '• copyWith() 메서드를 직접 만들려면 모든 프로퍼티를 일일이 처리\n\n'
                            '❌ 휴먼 에러 발생\n'
                            '• operator ==()에서 일부 프로퍼티를 빼먹어서 비교 로직이 틀림\n'
                            '• hashCode에서 새로 추가한 프로퍼티를 반영하지 못함\n'
                            '• copyWith()에서 null 체크를 빼먹어서 런타임 에러 발생\n\n'
                            '❌ 상태 관리의 복잡성\n'
                            '• BLoC State에서 Loading, Success, Error를 별도(enum)클래스로 관리\n'
                            '• 상태 변경 시 타입 캐스팅과 null 체크가 반복됨\n'
                            '• 새로운 상태 추가 시 모든 관련 코드를 찾아서 수정\n\n'
                            '✅ Freezed 도입 후 개선사항\n'
                            '• @freezed 어노테이션 하나로 모든 필수 메서드 자동 생성\n'
                            '• 프로퍼티 추가/삭제 시 관련 코드 자동 업데이트\n'
                            '• Union Types로 상태 관리가 훨씬 직관적이고 타입 안전함\n'
                            '• when() 메서드로 모든 상태를 빠뜨리지 않고 처리 가능\n\n'
                            '✅ 개발 생산성 향상\n'
                            '• 모델 클래스 작성 시간 대폭 단축\n'
                            '• 휴먼 에러 방지로 디버깅 시간 절약\n'
                            '• 코드 리팩토링이 훨씬 안전하고 쉬워짐\n\n'
                            '처음에는 "학습 비용이 있지 않을까?" 걱정했지만,\n'
                            '실제로 사용해보니 개발 속도와 코드 품질이 동시에 개선되었습니다!(중요).\n\n'
                            '특히 팀 프로젝트에서는 "모든 모델은 @freezed를 사용한다"는\n'
                            '일관된 규칙이 있어서 코드 리뷰나 협업이 훨씬 수월했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 150.h : 150),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '실제 프로젝트에서 사용하는',
                        textSubTitle: 'Freezed 3가지 활용 방법',
                        textSubTitle2:
                            '\n\n1. Model에서 사용하는 방법\n'
                            '2. State에서 사용하는 방법\n'
                            '3. Cubit에서 emit copyWith 사용하는 방법\n\n'
                            '모든 코드는 제 프로젝트에서 직접 구현한 실제 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),

                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Model에서 Freezed 사용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '저는 Model 클래스를 데이터 구조를 정의하는 핵심 구조로 사용하고 있습니다.\n'
                            'InitModel을 예시로 Freezed 버전과 순수 Dart 버전을 비교해보겠습니다.\n\n'
                            'enum, double, int, bool 등 다양한 타입들이 포함되어 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''Freezed 사용 - InitModel''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_model.freezed.dart';

@freezed
class InitModel with _$InitModel {
  const factory InitModel({
    // 초기화 상태
    @Default(InitState.inactive) InitState initState,
    
    // 프로필 뷰 높이
    @Default(0.0) double mainViewHeight,
    
    // 로딩 남은시간
    @Default(4) int remainingTime,
    
    // 브라우저 확인
    @Default(false) bool isChromeBrowser,
    
    // 모바일 init 확인
    @Default(false) bool isMobileInit,
    
    // 모바일 화면 폴드, 또는 웹
    @Default(false) bool isMobileFoldable,
  }) = _InitModel;
}

enum InitState { inactive, active }
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '단 20줄로 완성! enum, double, int, bool 등\n'
                            '다양한 타입들이 모두 포함되어 있습니다.\n\n'
                            '이제 동일한 기능을 순수 Dart로 구현해 보겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''Dart 구현 - 모든 정의?.''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// enum 정의도 별도로 필요
enum InitState { inactive, active }

class InitModel {
  final InitState initState;
  final double mainViewHeight;
  final int remainingTime;
  final bool isChromeBrowser;
  final bool isMobileInit;
  final bool isMobileFoldable;

  const InitModel({
    this.initState = InitState.inactive,
    this.mainViewHeight = 0.0,
    this.remainingTime = 4,
    this.isChromeBrowser = false,
    this.isMobileInit = false,
    this.isMobileFoldable = false,
  });

  // copyWith 메서드 - 모든 것을 정의
  InitModel copyWith({
    InitState? initState,
    double? mainViewHeight,
    int? remainingTime,
    bool? isChromeBrowser,
    bool? isMobileInit,
    bool? isMobileFoldable,
  }) {
    return InitModel(
      initState: initState ?? this.initState,
      mainViewHeight: mainViewHeight ?? this.mainViewHeight,
      remainingTime: remainingTime ?? this.remainingTime,
      isChromeBrowser: isChromeBrowser ?? this.isChromeBrowser,
      isMobileInit: isMobileInit ?? this.isMobileInit,
      isMobileFoldable: isMobileFoldable ?? this.isMobileFoldable,
    );
  }

  // toString 메서드
  @override
  String toString() {
    return 'InitModel('
        'initState: $initState, '
        'mainViewHeight: $mainViewHeight, '
        'remainingTime: $remainingTime, '
        'isChromeBrowser: $isChromeBrowser, '
        'isMobileInit: $isMobileInit, '
        'isMobileFoldable: $isMobileFoldable)';
  }

  // operator == 메서드
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InitModel &&
        other.initState == initState &&
        other.mainViewHeight == mainViewHeight &&
        other.remainingTime == remainingTime &&
        other.isChromeBrowser == isChromeBrowser &&
        other.isMobileInit == isMobileInit &&
        other.isMobileFoldable == isMobileFoldable;
  }

  // hashCode 메서드
  @override
  int get hashCode {
    return Object.hash(
      initState,
      mainViewHeight,
      remainingTime,
      isChromeBrowser,
      isMobileInit,
      isMobileFoldable,
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
                            '무려 70줄! 3.5배 길어졌습니다.\n'
                            'enum 정의도 따로 해야 하고, 모든 메서드를 직접 구현해야 합니다.\n\n'
                            '그런데 만약 getter와 setter로 사용한다면 어떤 문제가 생길까요?\n\n'
                            '예를 들어 다음과 같은 코드가 있다고 가정해 보겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''getter/setter 사용''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
enum InitState { inactive, active }

class InitModel {
  InitState initState = InitState.inactive;
  double mainViewHeight = 0.0;
  int remainingTime = 4;
  bool isChromeBrowser = false;
  bool isMobileInit = false;
  bool isMobileFoldable = false;
}

// 사용하는 곳에서...
void someMethod() {
  final model = InitModel();
  
  // 의도치 않은 상태 변경이 쉽게 발생
  model.initState = InitState.active;
  model.mainViewHeight = 100.0;
  
  // 다른 함수를 호출했는데...
  someOtherFunction(model);
  
  // 모델 상태가 변경되었을 수도!
  print(model.initState); // inactive? active? 예측 불가능
  print(model.remainingTime); // 4? 0? 예측 불가능
}

void someOtherFunction(InitModel model) {
  // 실수로 상태를 변경
  model.initState = InitState.inactive;
  model.remainingTime = 0; // 로딩 시간 리셋!
  model.isChromeBrowser = true; // 브라우저 상태도 변경
  // 원래 함수로 돌아가도 변경된 상태 유지됨
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'getter/setter의 문제점들:\n\n'
                            '🔸 불변성 보장 불가: 어디서든 값이 변경될 수 있음\n'
                            '🔸 예측 불가능한 상태: 함수 호출 후 값이 언제 바뀔지 모름\n'
                            '🔸 디버깅 어려움: 언제 어디서 값이 바뀌었는지 추적 불가\n'
                            '🔸 사이드 이펙트: 함수 호출 후 예상치 못한 상태 변경\n'
                            '🔸 동시성 문제: 멀티스레드 환경에서 Race Condition 발생 가능\n\n'
                            'Freezed는 이 모든 문제를 불변성으로 해결한다!\n'
                            'enum, double, int, bool 등 모든 타입을 안전하게 관리할 수 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 120.h : 120),

                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'State에서 Freezed 사용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'BLoC 패턴에서 State 클래스도 Freezed로 만들 수 있습니다.\n'
                            '여러 개의 Model을 조합해서 하나의 State를 구성하는 방식입니다.\n\n'
                            '이 웹페이지의 MobileState를 예시로 보여드리겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''MobileState - 여러 모델 조합''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/detailMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/skill_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model_mobile.dart';

part 'mobile_state.freezed.dart';

@freezed
class MobileState with _$MobileState {
  const factory MobileState({
    @Default(InitModel()) InitModel initModel,
    @Default(IntroModel()) IntroModel introModel,
    @Default(ScrollModel()) ScrollModel scrollModel,
    @Default(AboutMeModel()) AboutMeModel aboutMeModel,
    @Default(DetailMeModel()) DetailMeModel detailMeModel,
    @Default(ChapterModel()) ChapterModel chapterModel,
    @Default(SkillModel()) SkillModel skillModel,
    @Default(ProjectModelWithMobile()) ProjectModelWithMobile projectModel,
    @Default(MainPageTextConstants.defaultPlayerText) String isPlayerText,
    @Default(false) bool isBackGroundAniStart,
  }) = _MobileState;
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '여러 개의 Freezed 모델을 하나의 State로 조합하는 방식입니다.\n'
                            '각 섹션별 상태를 독립적인 모델로 관리하고,\n'
                            'State에서 이들을 모두 포함해서 전체 상태를 관리합니다.\n\n'
                            '이렇게 하면 코드 구조가 명확해지고 유지보수가 쉬워집니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 120.h : 120),

                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Cubit에서 emit copyWith 사용하기',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Cubit에서 상태를 변경할 때 emit()과 copyWith()를 함께 사용합니다.\n'
                            'Freezed가 자동 생성한 copyWith() 메서드를 활용해서\n'
                            '타입 안전하고 불변적인 상태 업데이트를 할 수 있습니다.\n\n'
                            '실제 MobileCubit에서 사용하는 패턴들을 보여드리겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''패턴 1: 단일 모델 상태 업데이트''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// MobileCubit에서 AboutMe 애니메이션 시작
void aboutMeAniStart(bool isStart) async {
  emit(
    state.copyWith(
      aboutMeModel: state.aboutMeModel.copyWith(isTitleAniStart: isStart),
    ),
  );
  
  if (isStart) {
    await Future.delayed(const Duration(milliseconds: 300));
  }
  
  emit(
    state.copyWith(
      aboutMeModel: state.aboutMeModel.copyWith(
        isDescriptionAniStart: isStart,
      ),
    ),
  );
}

// 플레이어 애니메이션 상태 변경
void aboutMePlayerAni(bool isStart) {
  if (state.aboutMeModel.isPlayerAniOpacity == isStart) return;
  
  emit(
    state.copyWith(
      aboutMeModel: state.aboutMeModel.copyWith(isPlayerAniOpacity: isStart),
    ),
  );
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''패턴 2: 복합 상태 업데이트''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 여러 섹션 상태를 동시에 업데이트
void showChapterDetail(int chapterIndex) async {
  emit(
    state.copyWith(
      scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
      chapterModel: state.chapterModel.copyWith(
        isChapterDetailVisible: true,
        selectedChapterIndex: chapterIndex,
        isButtonVisible: false,
        isChapterContentVisible: false,
        isBackGroundAniStart: true,
      ),
    ),
  );
  
  await Future.delayed(const Duration(milliseconds: 50));
  
  emit(
    state.copyWith(
      chapterModel: state.chapterModel.copyWith(isChapterDetailAni: true),
    ),
  );
  
  await Future.delayed(const Duration(milliseconds: 600));
  
  emit(
    state.copyWith(
      chapterModel: state.chapterModel.copyWith(
        isChapterDetailAniTitle: true,
      ),
    ),
  );
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '''패턴 3: 조건부 상태 업데이트''',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 상태 변경 전 조건 체크
void detailMePageStart(bool isDetailMe) {
  if (state.detailMeModel.isDetailMe == isDetailMe) return;

  emit(
    state.copyWith(
      detailMeModel: state.detailMeModel.copyWith(isDetailMe: isDetailMe),
    ),
  );
  _updateGlobalBackgroundState();
  aboutMePlayerAni(false);
}

// 글로벌 배경 상태 업데이트
void _updateGlobalBackgroundState() {
  final newGlobalState =
      state.aboutMeModel.isBackGroundAniStart ||
      state.detailMeModel.isDetailMe ||
      state.chapterModel.isBackGroundAniStart ||
      state.skillModel.isBackGroundAniStart ||
      state.projectModel.isBackGroundAniStart;

  emit(
    state.copyWith(isBackGroundAniStart: newGlobalState),
  );
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Cubit에서 emit()과 copyWith()를 함께 사용하는 핵심 패턴들입니다.\n\n'
                            '🔸 단일 모델 업데이트: 특정 모델의 일부 상태만 변경\n'
                            '🔸 복합 상태 업데이트: 여러 모델을 동시에 업데이트\n'
                            '🔸 조건부 업데이트: 상태 체크 후 안전한 업데이트\n\n'
                            '이런 패턴들로 복잡한 상태 관리도 깔끔하고 안전하게 처리할 수 있습니다.',
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
