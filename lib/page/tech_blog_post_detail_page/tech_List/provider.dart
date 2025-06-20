import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/post_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/subtitle_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/expandable_content.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/my_story_start.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class ProviderPage extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const ProviderPage({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
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
                    title: 'Provider(단점만 모아보기?)',
                    tags: const [
                      '#Provider',
                      '#State Management',
                      '#Flutter',
                      '#ChangeNotifier',
                      '#Consumer',
                      '#상태 관리',
                      '#플러터',
                      '#Context',
                      '#MultiProvider',
                    ],
                    content:
                        'Flutter로 개발을 시작할 때 가장 먼저 공부한 상태관리는 바로 Provider입니다.\n'
                        '"와, 이렇게 쉽게 상태를 공유할 수 있구나!"\n'
                        '"Consumer만 써도 알아서 UI가 업데이트되네!"\n\n'
                        '저는 약 2년 정도 Provider를 메인 상태 관리 도구로 사용했습니다.\n'
                        '간단한 앱부터 대학교 과제까지.. Provider와 함께 많은 것들을 했었던 기억이 있습니다.\n\n'
                        '하지만 프로젝트가 커질수록 Provider의 한계도 느끼게 되었고,\n'
                        '결국 잎사이 프로젝트부터 Cubit으로 넘어가게 되었습니다.\n\n'
                        '지금은 Provider를 사용하지 않지만, Provider는 상태관리의 기본을 알려준 좋은 라이브러리였습니다.\n'
                        '\n\n--지금은 기억이 거의 나지 않아요.. 사용안하면 기억에서 없어지는구나',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Provider란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Provider는 Flutter에서 가장 널리 사용되는 상태 관리 패키지 중 하나입니다.\n'
                            'Google Flutter 팀에서 권장하는 상태 관리 방식이기도 하죠.\n\n'
                            '복잡한 위젯 트리에서도 쉽게 상태를 공유할 수 있어요!',
                        detailContent:
                            'Provider의 핵심 개념:\n\n'
                            '🔸 1. ChangeNotifier\n'
                            '  - 상태 변화를 알려주는 기본 클래스\n'
                            '  - notifyListeners()로 위젯들에게 변화 알림\n'
                            '  - dispose()로 메모리 누수 방지\n\n'
                            '🔸 2. Consumer\n'
                            '  - Provider의 상태를 구독하는 위젯\n'
                            '  - 상태가 변경되면 자동으로 rebuild\n'
                            '  - 필요한 부분만 재빌드하여 성능 최적화\n\n'
                            '🔸 3. Provider.of / context.read / context.watch\n'
                            '  - Provider에 접근하는 다양한 방법들\n'
                            '  - read: 일회성 접근, watch: 상태 변화 구독\n'
                            '  - 상황에 맞게 적절한 방법 선택 가능\n\n'
                            '🔸 4. MultiProvider\n'
                            '  - 여러 Provider를 한 번에 제공\n'
                            '  - 복잡한 앱에서 Provider 관리 용이\n'
                            '  - 의존성 주입과 비슷한 효과\n\n'
                            'setState보다 훨씬 강력하고, 사용법도 상대적으로 간단합니다.',
                        toggleText: '개념이 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '개념을 보니까..\n   그러면 Provider가 완벽한 거 아닌가요?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '저도 처음에는 그렇게 생각했어요.\n\n'
                            '"Provider만 있으면 뭐든 할 수 있을 것 같은데?"\n'
                            '"Bloc보다 훨씬 가볍?..고, 무엇보다 사용법도 쉽네!"(Bloc의 Cubit도 가볍게 만들 수 있습니다!)\n\n'
                            '실제로 Provider는 정말 훌륭한 상태 관리 도구입니다.\n'
                            '하지만 프로젝트가 점점 커지면서 한계를 느끼기 시작했어요.',
                        toggleText:
                            '            처음엔 완벽해 보였지만\n실제로 겪은 한계들이 궁금하다면 Click',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            'Provider 사용하면서 잎사이 프로젝트에서 겪은 한계들:\n\n'
                            '❌ 복잡한 상태 변화 로직 처리 어려움\n'
                            '• 여러 단계의 비동기 처리가 복잡해짐\n'
                            '• 상태 변화의 순서나 조건이 복잡할 때 코드가 지저분해짐(매우 중요)\n'
                            '• 에러 핸들링과 로딩 상태 관리가 번거로움\n\n'
                            '❌ 상태 변화 추적의 어려움\n'
                            '• 언제, 왜 상태가 변했는지 추적하기 어려움\n'
                            '• 디버깅할 때 상태 변화 히스토리를 볼 수 없음\n'
                            '• 여러 Provider가 연쇄적으로 업데이트될 때 혼란\n\n'
                            '❌ 보일러플레이트 코드 증가\n'
                            '• ChangeNotifier 클래스들이 점점 거대해짐\n'
                            '• notifyListeners() 호출을 깜빡하는 실수\n'
                            '• dispose() 관리가 복잡해짐\n\n'
                            '❌ 테스트의 어려움\n'
                            '• 상태 변화 시나리오를 테스트하기 복잡함\n'
                            '• Mock Provider 설정이 번거로움\n'
                            '• 비동기 상태 변화 테스트가 어려움\n\n'
                            '❌ 성능 이슈\n'
                            '• 하나의 Provider가 변경되면 모든 Consumer가 rebuild(매우매우 중요)\n'
                            '• 세밀한 최적화가 어려움\n'
                            '• 큰 객체를 Provider로 관리할 때 성능 저하\n\n'
                            '작은 프로젝트에서는 Provider가 정말 완벽했지만,\n'
                            '복잡한 상태 관리가 필요한 프로젝트에서는 한계가 명확했어요.\n\n'
                            '그래서 결국 더 구조적이고 예측 가능한 Cubit으로 넘어가게 되었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: 'Provider와 함께한 2년은 소중한 시간이었습니다.\n',
                        textSubTitle: '',
                        textSubTitle2:
                            '\n\n      지금은 Cubit으로 넘어가서 사용하지 않고있어요\n리펙터링도 진행했어요 Cubit 기술블로그를 확인해주세요!',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      // 간단한 어플리케이션은 아직까지 Provider
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '간단한 어플리케이션은 아직까지 Provider?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '저는 2만줄이 넘는 잎사이 프로젝트를 혼자 진행할 때, 초기에는 Provider를 사용했습니다.\n\n'
                            '처음에는 정말 괜찮았어요. 간단하고 직관적이었거든요.\n'
                            '하지만 점점 깔끔한 구조와는 거리가 멀어지고..\n'
                            '서로 얽히고 얽히는 문제가 발생하였습니다.\n\n'
                            '바로 앱의 페이지가 20페이지가 넘어가는 시점부터였던 것 같아요.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '하지만 간단한 사용방법과 기능이 많지 않은 앱과 웹이라면\n'
                            'Provider를 사용해 애자일 기법으로 빠르게 MVP만 만들기에는 좋을 것 같습니다.\n\n'
                            '특히:\n'
                            '• 프로토타입 개발\n'
                            '• 간단한 CRUD 앱\n'
                            '• 빠른 검증이 필요한 아이디어\n'
                            '• 소규모 팀 프로젝트\n\n'
                            '이런 상황에서는 Provider의 간결함이 오히려 큰 장점이 될 거라 생각하고 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 1. MultiProvider 지옥
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'MultiProvider 지옥',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 15.h : 15),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '13개의 Provider가 한 곳에 모인 날',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '어느날 프로젝트의 main.dart를 열어보니... 충격적인 광경이 펼쳐졌습니다.\n'
                            'MultiProvider 안에 무려 13개의 ChangeNotifierProvider가 줄지어 서 있었어요.\n\n'
                            '처음에는 "하나씩 추가하면 되겠지?" 라고 생각했는데,\n'
                            '프로젝트가 커질수록 Provider가 계속 늘어나더라고요.',
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            '아! 지금은 Cubit을 사용한 Page/View/Model 구조로 리펙터링을 진행했어요!\nCubit 기술블로그를 확인해주세요!',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 50.h : 50),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '어떤 프로젝트의 main.dart',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginModel()),
      ChangeNotifierProvider(create: (_) => JoinModel()),
      ChangeNotifierProvider(create: (_) => SearchBarModel()),
      ChangeNotifierProvider(create: (_) => SearchScreenModel()),
      ChangeNotifierProvider(create: (_) => SearchBarModel2()),
      ChangeNotifierProvider(create: (_) => PartnershipRequestModel()),
      ChangeNotifierProvider(create: (_) => PartnershipRequestChangeModel()),
      ChangeNotifierProvider(create: (_) => PageRoutes()),
      ChangeNotifierProvider(create: (_) => MenuPrice()),
      ChangeNotifierProvider(create: (_) => ResetStorePage()),
      ChangeNotifierProvider(create: (_) => ResetMyPage()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => MyCartLengthProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavigationModel()),
      ChangeNotifierProvider(create: (_) => NaverMapProvider()),
      //---------bloc------------//
      BlocProvider<ReviewPageNavigatorBloc>(
        create: (context) => ReviewPageNavigatorBloc(),
      ),
    ],
    child: MyApp(
        isLoggedIn: isTokenValid,
        urlImg: urlImg,
        basketCount: basketCount,
        isStudent: isStudent,
        studentEmail: studentEmail),
  ),
);
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '13개의 Provider가 한꺼번에 생성되는 모습을 보니 뭔가 이상하다는 생각이 들었어요.\n\n'
                            '문제점들:\n'
                            '❌ 앱 시작 시 모든 Provider가 한 번에 생성됨\n'
                            '❌ 사용하지 않는 페이지의 Provider까지 메모리에 로드(중요)\n'
                            '❌ Provider 간의 의존성을 파악하기 어려움(중요)\n'
                            '❌ main.dart가 점점 거대해짐\n'
                            '❌ Provider 추가/제거 시 main.dart 수정 필요(중요)',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '특히 SearchBarModel과 SearchBarModel2가 따로 있는 걸 보고\n'
                            '"아, 이제 정말 Provider의 한계에 도달했구나" 라고 느꼈습니다.\n\n'
                            '같은 기능인데 Provider를 나눠야 하는 상황이 온 거죠.\n'
                            '이때부터 "더 체계적인 상태 관리가 필요하다"고 생각했어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 2. 장바구니 Provider 165줄
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '복잡한 상태 관리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 15.h : 15),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '장바구니 Provider가 165줄이 된 이유',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '잎사이 프로젝트에서 가장 복잡했던 Provider가 바로 CartProvider였습니다.\n'
                            '단순한 장바구니 기능이었는데... 어떻게 165줄이나 되었을까요?\n\n'
                            '처음에는 "장바구니니까 간단하겠지?"라고 생각했어요.\n'
                            '하지만 요구사항이 하나씩 추가될 때마다 Provider는 점점 거대해졌습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'CartProvider의 복잡한 상태 관리',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class CartProvider extends ChangeNotifier {
  // 선택된 아이템을 저장하는 Map - basketId를 키로 사용
  Map<int, List<bool>> selectedItems = {};

  // 모든 항목이 선택되었는지 여부를 저장
  bool _isAllSelected = false;

  // 전체 항목의 수
  int _totalItemCount = 0;

  // 선택된 항목의 총 금액
  int _totalSelectedAmount = 0;

  // 장바구니 데이터를 저장
  List<CartModel> _cartData = [];

  // 모든 항목이 선택되었는지 여부를 반환
  bool get isAllSelected => _isAllSelected;

  // 장바구니에 있는 전체 항목의 수를 반환
  int get totalItemCount => _totalItemCount;

  // 선택된 항목의 수를 반환
  int get selectedItemCount => selectedItems.values
      .expand((storeItems) => storeItems)
      .where((item) => item)
      .length;

  // 선택된 항목들의 총 금액을 반환
  int get totalSelectedAmount => _totalSelectedAmount;

  // 1개 이상 선택된 항목이 있는지 여부를 반환
  bool get hasSelectedItems => selectedItems.values
      .expand((storeItems) => storeItems)
      .any((item) => item);
  
  // ... 이하 생략 (실제로는 165줄)
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 코드만 봐도 복잡하죠? 실제로는 더 많은 메서드들이 있었어요:\n(사실 이때는 MVVM계층과 Service계층을 모르던 시기였어요)\n\n'
                            '• `toggleAllItemsInStore()` - 가게별 전체 선택\n'
                            '• `toggleItemSelection()` - 개별 아이템 선택\n'
                            '• `_updateTotalSelectedAmount()` - 총 금액 계산\n'
                            '• `_updateAllSelectedStatus()` - 전체 선택 상태 업데이트\n'
                            '• `getSelectedBasketIds()` - 선택된 항목들의 ID 반환\n'
                            '• `toggleAllSelection()` - 모든 항목 토글\n\n'
                            '각 메서드마다 `notifyListeners()`를 호출하고,\n'
                            '상태들이 서로 연관되어 있어서 하나만 바뀌어도 여러 곳에 영향을 미쳤어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '복잡한 Map<int, List<bool>> 구조',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 실제 사용된 복잡한 데이터 구조
Map<int, List<bool>> selectedItems = {};

// basketId를 키로 하고, 각 가게의 메뉴 선택 상태를 List<bool>로 관리
// 예시: 
// {
//   123: [true, false, true],   // basketId 123번 가게의 메뉴 선택 상태
//   456: [false, false, true],  // basketId 456번 가게의 메뉴 선택 상태
// }

// 이런 구조 때문에 데이터 접근이 복잡해짐
void toggleItemSelection(int basketId, int menuIndex) {
  if (_cartData.isNotEmpty &&
      _cartData[0].basketId == basketId &&
      selectedItems.containsKey(basketId) &&
      menuIndex < (selectedItems[basketId]?.length ?? 0)) {
    
    selectedItems[basketId]![menuIndex] = 
        !selectedItems[basketId]![menuIndex];

    _updateTotalSelectedAmount();
    _updateAllSelectedStatus();
    notifyListeners(); // 또 호출...
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이렇게 복잡해진 이유:\n\n'
                            '🔸 요구사항이 계속 추가됨\n'
                            '• "개별 선택 기능 추가해주세요"\n'
                            '• "가게별 전체 선택도 필요해요"\n'
                            '• "총 금액도 실시간으로 보여주세요"\n'
                            '• "선택된 항목 개수도 표시해주세요"\n\n'
                            '🔸 Provider 하나에 모든 로직이 집중\n'
                            '• 선택 상태 관리\n'
                            '• 금액 계산\n'
                            '• UI 업데이트 로직\n'
                            '• 데이터 검증 로직\n\n'
                            '🔸 복잡한 상태 간의 의존성\n'
                            '• 하나의 상태가 바뀌면 여러 상태를 업데이트해야 함\n'
                            '• `notifyListeners()` 호출 시점을 놓치면 UI 버그 발생',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '결국 이 CartProvider 때문에 가장 많은 버그가 발생했어요.\n\n'
                            '가장 기억에 남는 버그:\n'
                            '• 아이템을 선택했는데 총 금액이 업데이트 안 됨\n'
                            '• 전체 선택을 눌렀는데 일부만 선택됨\n'
                            '• 다른 페이지 갔다 오면 선택 상태가 초기화됨\n\n'
                            '"Provider로는 이런 복잡한 상태 관리가 한계구나"\n'
                            '라고 깨달은 순간이었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            '솔직하게 지금 Cubit으로 진행하면 버그 없이 금방 해결할 수 있을 것 ㄱ.. (이하 생략)',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 3. Provider.of listen 함정
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Provider.of의 함정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 15.h : 15),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'listen: false를 잊으면 생기는 일',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Provider를 사용하면서 가장 자주 겪었던 실수가 바로 `listen` 매개변수였어요.\n'
                            '특히 initState()나 버튼 onPressed에서 Provider를 사용할 때\n'
                            '`listen: false`를 빼먹고 에러를 겪은 적이 정말 많았습니다.\n\n'
                            '"왜 갑자기 앱이 터지지?" 하면서 한참을 헤맸던 기억이 나네요.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '실제 프로젝트에서 발견한 패턴들',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginState();
    });
  }

  void loginState() {
    // ✅ 올바른 사용 - listen: false 사용
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final myCartLengthProvider = 
        Provider.of<MyCartLengthProvider>(context, listen: false);
    
    if (widget.isLoggedIn) {
      loginStatus.setloginStatus(true);
      loginStatus.setBasketCount(widget.basketCount);
      myCartLengthProvider.setMyCartLength(widget.basketCount);
    }
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'UI에서 상태를 구독할 때 - listen 기본값 사용',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@override
Widget build(BuildContext context) {
  // ✅ UI에서는 listen: true (기본값) 사용하여 상태 변화 구독
  final favoriteCount = Provider.of<ResetMyPage>(context).isFavoriteCount;
  
  return Scaffold(
    body: Text('좋아요 개수: $favoriteCount'),
  );
}

// ❌ 만약 이렇게 했다면?
void someButtonPressed() {
  // 에러 발생! build 메서드 실행 중에 listen: true로 Provider 접근
  final provider = Provider.of<SomeProvider>(context); // listen: true가 기본값
  provider.updateSomething();
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '실제로 겪었던 에러들:\n\n'
                            '❌ "setState() called during build" 에러\n'
                            '• build 메서드 안에서 listen: true로 Provider 접근\n'
                            '• Provider가 상태를 바꾸면서 build 중에 setState 호출\n\n'
                            '❌ "Looking up a deactivated widget\'s ancestor" 에러\n'
                            '• 위젯이 dispose된 후에 Provider에 접근\n'
                            '• context가 유효하지 않은 상태에서 listen: true 사용\n\n'
                            '❌ 무한 rebuild 현상\n'
                            '• build 메서드에서 Provider 상태를 변경\n'
                            '• 상태 변경 → rebuild → 또 상태 변경 → 무한 반복',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '디버깅하기 어려웠던 실제 버그 사례',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 이런 코드가 있었다고 가정해보세요
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // ❌ 버그의 원인!
      // onPressed에서 listen: false를 빼먹음
      context.read<BottomNavigationModel>().setSelectedTab(3);
      
      // 근데 이게 더 문제였음
      Provider.of<ResetStorePage>(context).toggleAllFavoritesToTrue();
      // 위 코드는 listen: true가 기본값이라 build 중에 상태 변경 시도!
    },
    child: Text('버튼'),
  );
}

// ✅ 올바른 수정
onPressed: () {
  Provider.of<ResetStorePage>(context, listen: false)
      .toggleAllFavoritesToTrue();
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이런 실수를 방지하는 팁들:\n\n'
                            '✅ 경험으로 터득한 규칙들\n'
                            '• initState, dispose에서는 무조건 listen: false\n'
                            '• 버튼 onPressed에서는 무조건 listen: false\n'
                            '• build 메서드에서 상태 변경할 때는 listen: false\n'
                            '• UI 표시용으로만 사용할 때만 listen: true (기본값)\n\n'
                            '✅ context.read() vs context.watch() 사용\n'
                            '• context.read() = listen: false와 동일\n'
                            '• context.watch() = listen: true와 동일\n'
                            '• 의미가 더 명확해서 실수 방지에 도움',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 4. ChangeNotifier 상속지옥
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'ChangeNotifier 상속지옥',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 15.h : 15),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '같은 기능을 하는 Provider들의 분산',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '프로젝트가 커지면서 가장 당황스러웠던 순간은\n'
                            '비슷한 기능을 하는 Provider들이 여러 개 생겨나는 것이었어요.\n\n'
                            'SearchBarModel, SearchBarModel2, SearchScreenModel...\n'
                            'ResetStorePage, ResetMyPage...\n'
                            'CartProvider, MyCartLengthProvider...\n\n'
                            '"이게 정말 맞나?" 싶은 상황이 계속 발생했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '검색 기능만 해도 3개의 Provider',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 검색 기능을 위한 3개의 Provider들
ChangeNotifierProvider(create: (_) => SearchBarModel()),
ChangeNotifierProvider(create: (_) => SearchBarModel2()),
ChangeNotifierProvider(create: (_) => SearchScreenModel()),

// SearchBarModel - 검색창 UI 상태 관리
class SearchBarModel with ChangeNotifier {
  bool _isFirstTab = true;
  bool _isSearchScreen = false;
  bool _isRemoveSearchHistory = false;
  bool _isSearchResultsScreen = false;
  bool _isresultSearchAni = true;
  String _isUserTextController = '';
  // ... getter/setter들과 notifyListeners()
}

// SearchBarModel2 - 연관 검색어 기능 (왜 따로 만들었을까요?)
class SearchBarModel2 with ChangeNotifier {
  String _userInputForRelatedSearch = '';
  List<String> _previousValue = [];
  // ... getter/setter들과 notifyListeners()
}

// SearchScreenModel - 검색 화면 데이터 관리
class SearchScreenModel with ChangeNotifier {
  List<Map<String, dynamic>>? _searchHistory;
  List<Map<String, dynamic>>? _popularSearches;
  // ... getter/setter들과 notifyListeners()
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이렇게 분산된 이유:\n\n'
                            '🔸 처음에는 SearchBarModel 하나로 시작\n'
                            '• 검색창 상태만 관리하면 될 줄 알았음\n\n'
                            '🔸 요구사항 추가: "연관 검색어 기능 추가해주세요"\n'
                            '• SearchBarModel에 추가하려니 너무 복잡해짐\n'
                            '• 그래서 SearchBarModel2 생성\n\n'
                            '🔸 또 요구사항 추가: "검색 히스토리와 인기 검색어"\n'
                            '• 또 다른 Provider 필요 → SearchScreenModel 생성\n\n'
                            '결국 하나의 검색 기능을 위해 3개의 Provider가 필요해진 거죠.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '리셋 기능도 2개로 분산',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 비슷한 기능인데 Provider가 2개
ChangeNotifierProvider(create: (_) => ResetStorePage()),
ChangeNotifierProvider(create: (_) => ResetMyPage()),

// 실제 사용하는 코드에서의 혼란
void getUserData() async {
  // 어? 이건 어느 Provider를 써야 하지?
  Provider.of<ResetStorePage>(context, listen: false)
      .toggleAllFavoritesToTrue();
      
  // 또 다른 곳에서는...
  Provider.of<ResetMyPage>(context, listen: false)
      .setFavoriteCount(userData['status']['favoriteCount']);
}

// 장바구니도 2개로 분산
ChangeNotifierProvider(create: (_) => CartProvider()),
ChangeNotifierProvider(create: (_) => MyCartLengthProvider()),

// 사용할 때마다 "어느 Provider지?" 하고 헷갈림
final cartProvider = Provider.of<CartProvider>(context, listen: false);
final lengthProvider = Provider.of<MyCartLengthProvider>(context, listen: false);
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이런 분산이 만든 문제들:\n\n'
                            '❌ Provider 간의 의존성 지옥\n'
                            '• SearchBarModel이 바뀌면 SearchBarModel2도 업데이트 필요\n'
                            '• CartProvider가 바뀌면 MyCartLengthProvider도 업데이트\n'
                            '• 하나의 기능인데 여러 곳을 동시에 수정해야 함\n\n'
                            '❌ 코드 가독성 저하\n'
                            '• "이 기능은 어느 Provider에 있지?"\n'
                            '• 새 개발자가 코드 파악하기 어려움\n'
                            '• 관련 로직이 여러 파일에 흩어져 있음\n\n'
                            '❌ 상태 동기화 문제\n'
                            '• Provider A의 상태와 Provider B의 상태가 안 맞는 경우\n'
                            '• 어느 Provider가 "진짜" 상태인지 헷갈림',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '결국 깨달은 것:\n\n'
                            '🔸 Provider는 단일 관심사 원칙을 지키기 어려움\n'
                            '• 기능이 조금만 복잡해져도 Provider 분할 필요\n'
                            '• 하지만 분할하면 의존성 관리가 복잡해짐\n\n'
                            '🔸 명확한 경계를 정의하기 어려움\n'
                            '• "이 상태는 어느 Provider에 넣어야 하지?"\n'
                            '• 애매한 상태들이 계속 생겨남\n\n'
                            '"이럴 거면 처음부터 더 체계적인 구조가 필요했구나"\n'
                            '라고 생각하게 된 계기였어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),

                      // 5. notifyListeners 남발
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Provider의 생명주기 관리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 15.h : 15),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'notifyListeners() 남발의 부작용',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Provider를 사용하면서 가장 습관적으로 하게 되는 것이 바로\n'
                            '모든 setter 메서드 끝에 `notifyListeners()`를 붙이는 것이었어요.\n\n'
                            '"상태가 바뀌었으니까 UI 업데이트해야지!"\n'
                            '라는 생각으로 무조건 넣었는데... 이게 문제의 시작이었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '실제 LoginModel의 notifyListeners() 남발',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class LoginModel with ChangeNotifier {
  bool _loginStatus = false;
  bool _isStudent = false;
  String _studentEmail = '';
  String _onProfileImageReceived = '';
  int _basketCount = 0;

  // 로그인 상태 확인
  void setloginStatus(bool loginStatus) {
    _loginStatus = loginStatus;
    notifyListeners(); // 1번째
  }

  // 사용자 프로필 이미지 확인
  void setOnProfileImageReceived(String profileImage) {
    _onProfileImageReceived = profileImage;
    notifyListeners(); // 2번째
  }

  // 학생 이메일 확인
  void setStudentEmail(String studentEmail) {
    _studentEmail = studentEmail;
    notifyListeners(); // 3번째
  }

  // 학생 여부 확인
  void setIsStudent(bool isStudent) {
    _isStudent = isStudent;
    print('학생 : $_isStudent');
    notifyListeners(); // 4번째
  }

  // 장바구니 개수 확인
  void setBasketCount(int basketCount) {
    _basketCount = basketCount;
    print('장바구니 개수 : $_basketCount');
    notifyListeners(); // 5번째
  }
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '실제 앱 초기화 과정에서 일어나는 일:\n\n'
                            '```\n'
                            'loginStatus.setloginStatus(true);           // rebuild 1\n'
                            'loginStatus.setBasketCount(basketCount);    // rebuild 2\n'
                            'loginStatus.setOnProfileImageReceived(url); // rebuild 3\n'
                            'loginStatus.setIsStudent(isStudent);        // rebuild 4\n'
                            'loginStatus.setStudentEmail(email);         // rebuild 5\n'
                            '```\n\n'
                            '한 번의 로그인 처리에 무려 5번의 rebuild가 발생!\n'
                            'UI가 버벅거리는 이유를 찾았습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'notifyListeners() 남발로 인한 성능 문제',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 장바구니에서 하나의 아이템을 선택할 때 일어나는 일
void toggleItemSelection(int basketId, int menuIndex) {
  selectedItems[basketId]![menuIndex] = 
      !selectedItems[basketId]![menuIndex];

  _updateTotalSelectedAmount(); // 내부에서 notifyListeners() 호출
  _updateAllSelectedStatus();   // 내부에서 또 notifyListeners() 호출
  notifyListeners();            // 또 호출...
}

// _updateTotalSelectedAmount 내부
void _updateTotalSelectedAmount() {
  _totalSelectedAmount = 0;
  // ... 계산 로직
  notifyListeners(); // 또 호출!
}

// _updateAllSelectedStatus 내부  
void _updateAllSelectedStatus() {
  _isAllSelected = selectedItems.values
      .every((storeItems) => storeItems.every((item) => item));
  notifyListeners(); // 또 호출!
}

// 결과: 하나의 아이템 선택에 3번의 rebuild 발생!
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'notifyListeners() 남발로 인한 문제들:\n\n'
                            '❌ 불필요한 rebuild 과다\n'
                            '• 하나의 액션에 여러 번의 UI 업데이트\n'
                            '• 앱 성능 저하와 버벅거림\n'
                            '• 배터리 소모 증가\n\n'
                            '❌ Consumer 위젯의 과도한 반응\n'
                            '• 필요하지 않은 상황에도 rebuild\n'
                            '• 복잡한 UI에서 성능 이슈 심화\n\n'
                            '❌ 디버깅의 어려움\n'
                            '• "왜 이렇게 자주 rebuild 되지?"\n'
                            '• Flutter Inspector에서 rebuild 횟수 추적 어려움',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '개선 시도: 배치 업데이트 패턴',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 개선된 로그인 처리 (나중에 시도해본 방법)
class LoginModel with ChangeNotifier {
  // ... 상태 변수들

  // 배치로 여러 상태를 한 번에 업데이트
  void updateLoginInfo({
    bool? loginStatus,
    int? basketCount,
    String? profileImage,
    bool? isStudent,
    String? studentEmail,
  }) {
    bool hasChanged = false;
    
    if (loginStatus != null && _loginStatus != loginStatus) {
      _loginStatus = loginStatus;
      hasChanged = true;
    }
    
    if (basketCount != null && _basketCount != basketCount) {
      _basketCount = basketCount;
      hasChanged = true;
    }
    
    // ... 다른 상태들도 동일하게
    
    if (hasChanged) {
      notifyListeners(); // 마지막에 한 번만!
    }
  }
}

// 하지만 이것도 결국 Provider의 근본적 한계...
// 복잡한 상태 관리에는 부족했어요
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '결국 깨달은 Provider의 한계:\n\n'
                            '🔸 수동적인 생명주기 관리\n'
                            '• 언제 notifyListeners()를 호출할지 개발자가 직접 결정\n'
                            '• 깜빡하면 UI 업데이트 안 됨, 너무 많이 호출하면 성능 저하\n\n'
                            '🔸 상태 변화의 추적 어려움\n'
                            '• 어떤 상태가 언제 왜 바뀌었는지 파악하기 어려움\n'
                            '• 디버깅할 때 상태 변화 히스토리를 볼 수 없음\n\n'
                            '🔸 최적화의 한계\n'
                            '• 세밀한 업데이트 제어가 어려움\n'
                            '• 모든 Consumer가 동일하게 반응함\n\n'
                            '"이제 정말 더 체계적인 상태 관리가 필요하다"\n'
                            '라고 확신하게 된 순간이었어요.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      SubtitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '규모가 큰 프로젝트는 역시? Cubit!!.',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 180.h : 180),
                      //--------------------------------
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
