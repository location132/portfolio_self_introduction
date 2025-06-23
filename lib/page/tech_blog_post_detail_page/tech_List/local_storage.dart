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
                    title: 'SharedPreferences &\nFlutter Secure Storage',
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
                        '앱에서 간단하거나 중요한 데이터를 로컬에 저장해야 할 때, 어떤 방법을 선택해야 할지,\n'
                        'SharedPreferences? Flutter Secure Storage? 언제 어떤 것을 사용해야 할까..\n\n\n'
                        '위 두 가지를 소개합니다.\n\n\n'
                        '저는 처음에 모든 데이터를 SharedPreferences에 저장했습니다.\n'
                        '간단하고 사용하기 쉬웠기 때문입니다. 하지만 프로젝트가 커지면서 문제가 보이기 시작했습니다.\n\n'
                        '특히 로그인 토큰을 SharedPreferences에 저장하다가 보안 이슈를 깨닫게 되었고,\n'
                        '그때부터 "언제 어떤 저장소를 사용해야 하는가?"에 대해 고민하기 시작했습니다.\n\n'
                        '이제는 각각의 특성을 이해하고 적재적소에 활용하고 있습니다.\n'
                        '프로젝트에서 어떻게 구분해서 사용하고 있는지 공유해보겠습니다.\n\n\n\n'
                        'Isar는 다른 기술블로그에 상세하게 기술하였습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'SharedPreferences란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'SharedPreferences는 Flutter에서 가장 간단하게 사용할 수 있는 로컬 저장소입니다.\n'
                            '키-값 쌍으로 데이터를 저장하며, 앱 설정이나 사용자 기본 설정을 저장할 때 주로 사용합니다.\n\n'
                            '암호화되지 않기 때문에 보안이 필요없는 일반적인 데이터 저장에 적합합니다.',
                        detailContent:
                            'SharedPreferences의 핵심 특징:\n\n'
                            '🔸 1. 간단한 키-값 저장소\n'
                            '  - Android에서는 SharedPreferences, iOS에서는 NSUserDefaults를 사용\n'
                            '  - String, int, double, bool, List<String> 타입 지원\n'
                            '  - 비동기 방식으로 데이터 저장 및 불러오기\n\n'
                            '🔸 2. 플랫폼별 네이티브 저장소 활용\n'
                            '  - Android: XML 파일로 /data/data/패키지명/shared_prefs/ 경로에 저장\n'
                            '  - iOS: plist 파일로 Library/Preferences/ 경로에 저장\n'
                            '  - 각 플랫폼에 최적화된 저장 방식 사용\n\n'
                            '🔸 3. 주요 사용 사례\n'
                            '  - 앱 테마 설정 (다크모드/라이트모드)\n'
                            '  - 언어 설정 및 로케일 정보\n'
                            '  - 첫 실행 여부 체크\n'
                            '  - 사용자 기본 설정값 (알림, 소리 등)\n'
                            '  - 온보딩 완료 상태\n\n'
                            '🔸 4. 성능 및 제약사항\n'
                            '  - 앱 시작 시 모든 설정값을 메모리에 로드\n'
                            '  - 읽기 속도는 빠르지만 쓰기는 디스크 I/O로 인해 상대적으로 느림\n'
                            '  - 소량의 설정 데이터(보통 1MB 이하)에 최적화\n'
                            '  - 대용량 데이터나 복잡한 객체에는 부적합\n\n'
                            '🔸 5. 보안 특성\n'
                            '  - 데이터가 암호화되지 않음\n'
                            '  - 루팅/탈옥된 기기에서 파일 접근 가능\n'
                            '  - 민감한 정보(토큰, 비밀번호) 저장 부적합\n'
                            '  - 일반적인 앱 설정값에만 사용 권장\n\n'
                            '간단하고 직관적인 API로 Flutter 개발에서 가장 널리 사용되는\n'
                            '기본적인 로컬 저장소가 SharedPreferences입니다.',
                        toggleText: 'SharedPreferences 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Flutter Secure Storage란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Flutter Secure Storage는 민감한 데이터를 암호화해서 안전하게 저장하는 라이브러리입니다.\n'
                            'iOS Keychain과 Android Keystore를 활용하여 시스템 레벨에서 보안을 보장합니다.\n\n'
                            '로그인 토큰, 비밀번호, API 키와 같은 보안이 중요한 데이터를 저장할 때 사용합니다.',
                        detailContent:
                            'Flutter Secure Storage의 핵심 특징:\n\n'
                            '🔸 1. 플랫폼별 보안 저장소 활용\n'
                            '  - iOS: Keychain Services를 통한 하드웨어 기반 암호화\n'
                            '  - Android: Android Keystore System과 EncryptedSharedPreferences 활용\n'
                            '  - 각 플랫폼의 최고 수준 보안 기술 적용\n'
                            '  - 루팅/탈옥된 기기에서도 데이터 보호\n\n'
                            '🔸 2. 강력한 암호화 시스템\n'
                            '  - AES-256 암호화를 통한 데이터 보호\n'
                            '  - 각 키마다 개별 암호화 키 생성\n'
                            '  - 키 파생 함수(Key Derivation Function) 사용\n'
                            '  - 암호화 키는 하드웨어 보안 모듈에 저장\n\n'
                            '🔸 3. 주요 사용 사례\n'
                            '  - JWT 토큰, 리프레시 토큰\n'
                            '  - 사용자 인증 정보 (아이디, 암호)\n'
                            '  - API 키 및 시크릿 키\n'
                            '  - 생체 인증 관련 데이터\n'
                            '  - 개인정보 및 민감한 설정값\n\n'
                            '🔸 4. 보안 특성 및 장점\n'
                            '  - 앱 삭제 시 자동으로 모든 데이터 삭제\n'
                            '  - 백업에서 제외되어 클라우드 유출 방지\n'
                            '  - 다른 앱에서 데이터 접근 불가능\n'
                            '  - 디버깅 모드에서도 암호화된 상태로 표시\n\n'
                            '🔸 5. 성능 및 제약사항\n'
                            '  - SharedPreferences보다 약 2-3배 느림 (암호화/복호화 오버헤드)\n'
                            '  - 소용량 데이터 저장에 최적화 (일반적으로 10KB 이하)\n'
                            '  - 키-값 쌍 형태로만 저장 가능\n'
                            '  - Android 23 이상에서 최적 성능 발휘\n\n'
                            '민감한 데이터를 다루는 모든 Flutter 앱에서 필수적으로 사용해야 하는\n'
                            '보안 저장소가 Flutter Secure Storage입니다.',
                        toggleText: 'Flutter Secure Storage 궁금하시면 Click',
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
                            '앱 개발에서 겪는 로컬 스토리지 관련 문제들을 소개하겠습니다.\n'
                            '잘못된 선택이 어떤 결과를 가져오는지, 올바른 전략의 장점은 무엇인지\n\n',
                        toggleText: '실무에서의 중요성 알아보기',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '앱 개발에서 겪는 로컬 스토리지 관련 문제들:\n\n'
                            '❌ 잘못된 선택의 결과들\n'
                            '• SharedPreferences에 토큰 저장 → 보안 취약점 발생\n'
                            '• Secure Storage에 일반 설정값 저장 → 불필요한 성능 저하\n'
                            '• 적절한 예외처리 없음 → 앱 크래시 발생\n'
                            '• 데이터 타입 변환 실수 → 런타임 에러\n\n'
                            '✅ 올바른 전략의 장점들\n'
                            '• 적재적소에 맞는 저장 방법 선택\n'
                            '• 보안성과 성능의 균형\n'
                            '• 안정적인 데이터 관리\n'
                            '• 사용자 경험 향상\n\n'
                            '✅ 프로젝트 적용 경험\n'
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
                      // 1번: SharedPreferences 검색 히스토리 관리 시스템
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '검색 히스토리 관리 시스템\n  최대 10개 제한과 중복 방지 로직',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '앱에서 사용자 경험을 향상시키려면 검색 기능이 핵심입니다.\n'
                            '사용자가 이전에 검색했던 키워드를 기억해서 빠르게 재검색할 수 있도록 저도 구현해보고싶었습니다.\n\n'
                            '하지만 단순히 검색어를 저장하는 것만으로는 부족했습니다.\n'
                            '"검색어가 무제한으로 쌓이면 어떻게 될까?" "같은 검색어가 중복으로 저장되면?" 같은 문제들이 있었습니다.\n\n'
                            '그래서 최대 10개 제한, 중복 방지, 개별 삭제, 전체 삭제 기능을 모두 구현했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml - SharedPreferences 의존성 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'PreferencesSearchHistory - 검색 히스토리 관리 클래스',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSearchHistory {
  static const _historyKey = 'hisKey';

  // 검색기록 저장 - 최대 10개 제한과 중복 방지
  Future<void> setSearchHistory(String newSearchSave) async {
    final loadHistory = await SharedPreferences.getInstance();
    List<String> searchHistory = loadHistory.getStringList(_historyKey) ?? [];
    
    // 중복 검색어 제거 (이미 있다면 삭제 후 최신으로 추가)
    searchHistory.removeWhere((item) => item == newSearchSave);
    
    // 최대 10개 제한 - 가장 오래된 검색어 삭제
    if (searchHistory.length >= 10) {
      searchHistory.removeAt(0);
    }
    
    // 새로운 검색어를 맨 뒤에 추가 (최신 순)
    searchHistory.add(newSearchSave);
    await loadHistory.setStringList(_historyKey, searchHistory);
  }

  // 검색기록 불러오기
  Future<List<String>?> getSearchHistory() async {
    final loadHistory = await SharedPreferences.getInstance();
    return loadHistory.getStringList(_historyKey);
  }

  // 특정 검색기록 삭제
  Future<void> removeSearchHistory(String searchItem) async {
    final loadHistory = await SharedPreferences.getInstance();
    List<String> searchHistory = loadHistory.getStringList(_historyKey) ?? [];
    searchHistory.removeWhere((item) => item == searchItem);
    await loadHistory.setStringList(_historyKey, searchHistory);
  }

  // 검색기록 모두 삭제
  Future<void> removeAllHistory() async {
    final loadHistory = await SharedPreferences.getInstance();
    List<String> searchHistory = loadHistory.getStringList(_historyKey) ?? [];
    searchHistory.clear();
    await loadHistory.setStringList(_historyKey, searchHistory);
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현에서 핵심은 "중복 방지 로직"입니다.\n\n'
                            '처음에는 단순히 add()만 사용했는데, 같은 검색어가 여러 번 저장되는 문제가 있었습니다.\n'
                            '그래서 removeWhere()로 기존 검색어를 삭제한 뒤, 최신으로 다시 추가하도록 했습니다.\n\n'
                            '또한 searchHistory.removeAt(0)으로 가장 오래된 검색어를 삭제해서\n'
                            '최대 10개 제한을 유지하면서도 최신 검색어가 우선되도록 구현했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '검색 페이지에서 히스토리 사용',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PreferencesSearchHistory _historyService = PreferencesSearchHistory();
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  // 앱 시작 시 저장된 검색 히스토리 불러오기
  Future<void> _loadSearchHistory() async {
    final history = await _historyService.getSearchHistory();
    setState(() {
      _searchHistory = history?.reversed.toList() ?? []; // 최신순 정렬
    });
  }

  // 검색 실행 시 히스토리에 저장
  Future<void> _performSearch(String query) async {
    if (query.trim().isEmpty) return;
    
    // 검색 히스토리에 저장
    await _historyService.setSearchHistory(query.trim());
    
    // UI 업데이트를 위해 히스토리 다시 로드
    await _loadSearchHistory();
    
    // 검색 로직 실행
    _executeSearch(query);
  }

  // 개별 검색어 삭제
  Future<void> _removeHistoryItem(String item) async {
    await _historyService.removeSearchHistory(item);
    await _loadSearchHistory();
  }

  // 전체 히스토리 삭제
  Future<void> _clearAllHistory() async {
    await _historyService.removeAllHistory();
    await _loadSearchHistory();
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 2번: SharedPreferences 앱 설정 관리 시스템
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '앱 설정 관리 시스템\n  다중 알림 설정과 상태 동기화',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '앱이 커질수록 사용자 설정 항목들이 많아집니다.\n'
                            'PUSH 알림, 이벤트 알림, 커뮤니티 알림 등 각각의 설정을 개별적으로 관리해야 하기 때문입니다.\n\n'
                            '하지만 단순히 각 설정을 따로 저장하는 것만으로는 부족했습니다.\n'
                            '"PUSH 알림을 끄면 모든 하위 알림도 자동으로 꺼져야 하는가?" 같은 비즈니스 로직이 필요했습니다.\n\n'
                            '그래서 설정 간의 의존성을 관리하고, 상태 동기화를 보장하는 시스템을 구현해봤습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'AppSettingsService - 통합 설정 관리 서비스',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsService {
  // 설정 키 상수들
  static const _pushAlarmKey = 'push_alarm_enabled';
  static const _adAlarmKey = 'ad_alarm_enabled';
  static const _communityAlarmKey = 'community_alarm_enabled';
  static const _appVersionKey = 'app_version';
  static const _themeKey = 'app_theme';
  static const _languageKey = 'app_language';

  // PUSH 알림 설정 저장/불러오기
  Future<void> setPushAlarmEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_pushAlarmKey, enabled);
    
    // PUSH 알림이 꺼지면 모든 하위 알림도 자동으로 끄기
    if (!enabled) {
      await setAdAlarmEnabled(false);
      await setCommunityAlarmEnabled(false);
    }
  }

  Future<bool> getPushAlarmEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_pushAlarmKey) ?? true; // 기본값: true
  }

  // 이벤트 및 광고성 알림 설정
  Future<void> setAdAlarmEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_adAlarmKey, enabled);
  }

  Future<bool> getAdAlarmEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_adAlarmKey) ?? true;
  }

  // 커뮤니티 알림 설정
  Future<void> setCommunityAlarmEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_communityAlarmKey, enabled);
  }

  Future<bool> getCommunityAlarmEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_communityAlarmKey) ?? true;
  }

  // 앱 버전 정보 저장 (앱 업데이트 확인용)
  Future<void> setAppVersion(String version) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_appVersionKey, version);
  }

  Future<String> getAppVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_appVersionKey) ?? '1.0.0';
  }

  // 모든 설정을 한 번에 불러오기 (앱 시작 시 사용)
  Future<Map<String, dynamic>> getAllSettings() async {
    return {
      'pushAlarm': await getPushAlarmEnabled(),
      'adAlarm': await getAdAlarmEnabled(),
      'communityAlarm': await getCommunityAlarmEnabled(),
      'appVersion': await getAppVersion(),
    };
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현에서 중요한 부분은 "설정 간의 의존성 관리"입니다.\n\n'
                            'setPushAlarmEnabled()에서 PUSH 알림을 끄면 자동으로 하위 알림들도 끄도록 했습니다.\n'
                            '사용자 입장에서 "PUSH 알림을 껐는데 왜 광고 알림이 계속 와?" 하는 혼란을 방지하기 위해서죠.\n\n'
                            '또한 getAllSettings()로 앱 시작 시 모든 설정을 한 번에 불러와서\n'
                            '여러 번의 SharedPreferences 접근을 최소화했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '설정 페이지에서 사용',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
class MyPageSetting extends StatefulWidget {
  @override
  _MyPageSettingState createState() => _MyPageSettingState();
}

class _MyPageSettingState extends State<MyPageSetting> {
  final AppSettingsService _settingsService = AppSettingsService();
  
  bool isAlarmEnabled = true;
  bool isAdAlarmEnabled = true;
  bool isCommunityAlarmEnabled = true;
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAllSettings();
  }

  // 앱 시작 시 모든 설정 불러오기
  Future<void> _loadAllSettings() async {
    final settings = await _settingsService.getAllSettings();
    setState(() {
      isAlarmEnabled = settings['pushAlarm'];
      isAdAlarmEnabled = settings['adAlarm'];
      isCommunityAlarmEnabled = settings['communityAlarm'];
      appVersion = settings['appVersion'];
    });
  }

  // PUSH 알림 토글 - 하위 알림 자동 제어
  Future<void> _togglePushAlarm(bool value) async {
    await _settingsService.setPushAlarmEnabled(value);
    setState(() {
      isAlarmEnabled = value;
      if (!value) {
        // PUSH 알림이 꺼지면 하위 알림들도 자동으로 끄기
        isAdAlarmEnabled = false;
        isCommunityAlarmEnabled = false;
      } else {
        // PUSH 알림이 켜지면 하위 알림들도 자동으로 켜기
        isAdAlarmEnabled = true;
        isCommunityAlarmEnabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PUSH 알림 메인 토글
          SwitchListTile(
            title: Text('PUSH 알림설정'),
            value: isAlarmEnabled,
            onChanged: _togglePushAlarm,
          ),
          
          // 하위 알림들 (PUSH 알림이 꺼져있으면 비활성화)
          SwitchListTile(
            title: Text('이벤트 및 광고성 알림'),
            subtitle: Text('할인과 혜택에 관련된 모든 이벤트와 광고성 알람을 차단합니다.'),
            value: isAdAlarmEnabled,
            onChanged: isAlarmEnabled ? (value) async {
              await _settingsService.setAdAlarmEnabled(value);
              setState(() => isAdAlarmEnabled = value);
            } : null, // PUSH 알림이 꺼져있으면 비활성화
          ),
          
          SwitchListTile(
            title: Text('커뮤니티 알림'),
            subtitle: Text('내가 쓴 리뷰와 요청글, 또는 좋아요 및 댓글 등 모든 커뮤니티 관련 알람을 차단합니다.'),
            value: isCommunityAlarmEnabled,
            onChanged: isAlarmEnabled ? (value) async {
              await _settingsService.setCommunityAlarmEnabled(value);
              setState(() => isCommunityAlarmEnabled = value);
            } : null,
          ),
          
          // 앱 버전 정보 표시
          ListTile(
            title: Text('어플 버전'),
            subtitle: Text(appVersion),
          ),
        ],
      ),
    );
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 3번: SNS 로그인 토큰 보안 저장 - 4개 플랫폼 통합 인증 시스템
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'SNS 로그인 토큰 보안 저장\n  4개 플랫폼 통합 인증 시스템',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '현대 앱에서는 소셜 로그인이 필수가 되었습니다.\n'
                            '사용자들은 복잡한 회원가입 절차 대신 네이버, 카카오, 구글, 애플 계정으로 간편하게 로그인하고 싶어합니다.\n\n'
                            '하지만 여러 플랫폼의 토큰을 관리하는 것은 생각보다 복잡했습니다.\n'
                            '"각 플랫폼별 토큰을 어디에 저장할까?" "토큰이 유출되면 어떻게 될까?" 같은 보안 문제가 있었습니다.\n\n'
                            '그래서 Flutter Secure Storage를 사용해서 모든 인증 토큰을 안전하게 통합 관리하는 시스템을 구현했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml - Flutter Secure Storage 의존성 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  flutter:
    sdk: flutter
  flutter_secure_storage: ^9.0.0
  
  # SNS 로그인 관련
  kakao_flutter_sdk_user: ^1.9.1+2
  google_sign_in: ^6.1.5
  sign_in_with_apple: ^5.0.0
  flutter_naver_login: ^1.8.0
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'SecureAuthService - 통합 인증 토큰 관리',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class SecureAuthService {
  // Secure Storage 인스턴스 생성
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true, // Android 암호화 활성화
    ),
    iOptions: IOSOptions(
      accessibility: KeychainItemAccessibility.first_unlock_this_device,
    ),
  );

  // 토큰 키 상수들
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _snsTypeKey = 'snsType';
  static const String _userEmailKey = 'userEmail';

  // 액세스 토큰 저장
  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // 액세스 토큰 읽기
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  // 리프레시 토큰 저장
  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // 로그인한 SNS 타입 저장 (네이버, 카카오, 구글, 애플)
  static Future<void> saveSnsType(String snsType) async {
    await _storage.write(key: _snsTypeKey, value: snsType);
  }

  static Future<String?> getSnsType() async {
    return await _storage.read(key: _snsTypeKey);
  }

  // 사용자 이메일 저장
  static Future<void> saveUserEmail(String email) async {
    await _storage.write(key: _userEmailKey, value: email);
  }

  static Future<String?> getUserEmail() async {
    return await _storage.read(key: _userEmailKey);
  }

  // 모든 인증 정보 삭제 (로그아웃)
  static Future<void> clearAllAuthData() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _snsTypeKey);
    await _storage.delete(key: _userEmailKey);
  }

  // 로그인 상태 확인
  static Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현에서 핵심은 "플랫폼별 최적화된 보안 설정"입니다.\n\n'
                            'Android에서는 encryptedSharedPreferences를 활성화해서 EncryptedSharedPreferences를 사용하고,\n'
                            'iOS에서는 first_unlock_this_device로 설정해서 기기가 한 번 잠금 해제되면 접근 가능하도록 했습니다.\n\n'
                            '또한 clearAllAuthData()로 로그아웃 시 모든 인증 정보를 완전히 삭제해서\n'
                            '토큰이 남아있어서 생기는 보안 문제를 방지했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'SNS 로그인 통합 구현',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// OAuth 로그인 함수 - 4개 플랫폼 통합
Future<Map<String, dynamic>> snsLogin(String type, String accessToken) async {
  Dio dio = Dio();
  var url = '${dotenv.env['API_URL']}/v1/account/oauth/sign-in';
  
  Map<String, dynamic> data = {
    'type': type, // 'naver', 'kakao', 'google', 'apple'
    'accessToken': accessToken
  };

  try {
    var response = await dio.post(url, data: data);
    
    if (response.statusCode == 200) {
      // 서버에서 받은 JWT 토큰을 Secure Storage에 저장
      await SecureAuthService.saveAccessToken(response.data['accessToken']);
      
      // 로그인한 SNS 타입도 저장 (나중에 로그아웃 시 필요)
      await SecureAuthService.saveSnsType(type);
      
      // 사용자 정보도 함께 저장
      if (response.data['userEmail'] != null) {
        await SecureAuthService.saveUserEmail(response.data['userEmail']);
      }
      
      return {'status': 'success'};
    } else {
      return {'status': 'false'};
    }
  } catch (e) {
    print('SNS Login Error: $e');
    return {'status': 'false'};
  }
}

// 로그아웃 함수
Future<void> ifsaiLogout() async {
  // 현재 로그인된 SNS 타입 확인
  String? snsType = await SecureAuthService.getSnsType();
  
  // 각 SNS별 로그아웃 처리
  if (snsType != null) {
    switch (snsType) {
      case 'kakao':
        await UserApi.instance.logout();
        break;
      case 'google':
        await GoogleSignIn().signOut();
        break;
      case 'naver':
        await FlutterNaverLogin.logOut();
        break;
      case 'apple':
        // Apple은 별도 로그아웃 API 없음
        break;
    }
  }
  
  // 모든 보안 저장소 데이터 삭제
  await SecureAuthService.clearAllAuthData();
}

// API 요청 시 자동으로 토큰 추가하는 인터셉터
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options, 
    RequestInterceptorHandler handler,
  ) async {
    // 저장된 액세스 토큰 읽기
    String? token = await SecureAuthService.getAccessToken();
    
    if (token != null) {
      // 쿠키 또는 헤더에 토큰 추가
      var cookieJar = CookieJar();
      List<Cookie> cookies = [Cookie('accessToken', token)];
      cookieJar.saveFromResponse(Uri.parse(options.uri.toString()), cookies);
      
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    handler.next(options);
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 4번: 사용자 인증 정보 보안 관리 - 로그인 상태 유지와 토큰 관리
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '사용자 인증 정보 보안 관리\n  로그인 상태 유지와 토큰 관리',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '사용자가 한 번 로그인하면 앱을 다시 실행해도 로그인 상태가 유지되어야 합니다.\n'
                            '"앱을 껐다 켜도 로그인이 유지되나?" "토큰이 만료되면 어떻게 처리할까?" 같은 문제들이 있었습니다.\n\n'
                            '단순히 토큰만 저장하는 것이 아니라 토큰의 유효성 검증, 자동 갱신, 에러 처리까지\n'
                            '완전한 인증 시스템을 구축해야 했습니다.\n\n'
                            '그래서 앱 시작 시 자동 로그인 체크부터 토큰 만료 시 자동 로그아웃까지\n'
                            '모든 인증 플로우를 안전하게 관리하는 시스템을 구현했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'AuthStateManager - 인증 상태 관리 클래스',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthStateManager extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = true;
  String? _userEmail;
  String? _snsType;

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get userEmail => _userEmail;
  String? get snsType => _snsType;

  // 앱 시작 시 자동 로그인 체크
  Future<void> checkAutoLogin() async {
    _isLoading = true;
    notifyListeners();

    try {
      // 저장된 토큰 확인
      String? token = await SecureAuthService.getAccessToken();
      
      if (token != null && token.isNotEmpty) {
        // 토큰 유효성 서버에서 검증
        bool isValid = await _validateTokenWithServer(token);
        
        if (isValid) {
          // 유효한 토큰이면 사용자 정보 로드
          await _loadUserInfo();
          _isLoggedIn = true;
        } else {
          // 무효한 토큰이면 로그아웃 처리
          await _handleInvalidToken();
        }
      } else {
        _isLoggedIn = false;
      }
    } catch (e) {
      print('Auto login check error: $e');
      _isLoggedIn = false;
    }

    _isLoading = false;
    notifyListeners();
  }

  // 서버에서 토큰 유효성 검증
  Future<bool> _validateTokenWithServer(String token) async {
    try {
      Dio dio = Dio();
      dio.interceptors.add(AuthInterceptor()); // 자동으로 토큰 추가
      
      var response = await dio.get('/v1/accounts/profiles');
      return response.statusCode == 200;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        // 401 Unauthorized = 토큰 만료
        return false;
      }
      // 네트워크 오류 등은 일시적 문제로 간주하고 로그인 유지
      return true;
    }
  }

  // 사용자 정보 로드
  Future<void> _loadUserInfo() async {
    _userEmail = await SecureAuthService.getUserEmail();
    _snsType = await SecureAuthService.getSnsType();
  }

  // 무효한 토큰 처리 (자동 로그아웃)
  Future<void> _handleInvalidToken() async {
    await SecureAuthService.clearAllAuthData();
    _isLoggedIn = false;
    _userEmail = null;
    _snsType = null;
  }

  // 로그인 성공 처리
  Future<void> onLoginSuccess(String email, String snsType) async {
    _isLoggedIn = true;
    _userEmail = email;
    _snsType = snsType;
    
    await SecureAuthService.saveUserEmail(email);
    await SecureAuthService.saveSnsType(snsType);
    
    notifyListeners();
  }

  // 로그아웃 처리
  Future<void> logout() async {
    await ifsaiLogout(); // 실제 로그아웃 함수 호출
    
    _isLoggedIn = false;
    _userEmail = null;
    _snsType = null;
    
    notifyListeners();
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현의 핵심은 "사용자 경험의 일관성"입니다.\n\n'
                            '앱을 실행할 때마다 로그인 화면이 나오면 사용자가 불편해합니다.\n'
                            '하지만 무조건 메인 화면으로 보내면 토큰이 만료되었을 때 오류가 발생하죠.\n\n'
                            '그래서 AuthWrapper에서 로딩 화면을 보여주면서 백그라운드에서 토큰 검증을 하고,\n'
                            '그 결과에 따라 적절한 화면으로 자동 전환하도록 구현했습니다.\n\n'
                            '이렇게 하면 사용자는 별도의 조작 없이도 자연스럽게 로그인 상태가 유지되는 경험을 할 수 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 100.h : 100),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현에서 중요한 부분은 "토큰 유효성 검증 전략"입니다.\n\n'
                            '단순히 토큰이 저장되어 있다고 해서 유효한 것이 아닙니다.\n'
                            '서버에서 실제로 검증해봐야 토큰이 만료되었는지, 무효화되었는지 알 수 있습니다.\n\n'
                            '그래서 앱 시작 시 _validateTokenWithServer()로 서버에 요청을 보내서\n'
                            '401 응답이 오면 자동으로 로그아웃 처리하도록 구현했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'main.dart에서 인증 상태 관리 초기화',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Flutter Secure Storage 초기화
  const storage = FlutterSecureStorage();
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthStateManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // 앱 시작 시 자동 로그인 체크
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthStateManager>().checkAutoLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateManager>(
      builder: (context, authState, child) {
        // 로딩 중일 때
        if (authState.isLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        // 로그인 상태에 따라 화면 전환
        if (authState.isLoggedIn) {
          return MainPage(); // 메인 화면
        } else {
          return LoginPage(); // 로그인 화면
        }
      },
    );
  }
}

// 로그인 성공 시 처리 예시
class LoginPage extends StatelessWidget {
  Future<void> _handleLoginSuccess(BuildContext context, String snsType) async {
    // SNS 로그인 후 서버에서 받은 정보로 상태 업데이트
    String? userEmail = await SecureAuthService.getUserEmail();
    
    if (userEmail != null) {
      context.read<AuthStateManager>().onLoginSuccess(userEmail, snsType);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 네이버 로그인 버튼
          ElevatedButton(
            onPressed: () async {
              // 네이버 로그인 로직
              bool success = await performNaverLogin();
              if (success) {
                await _handleLoginSuccess(context, 'naver');
              }
            },
            child: Text('네이버 로그인'),
          ),
          
          // 다른 SNS 로그인 버튼들...
        ],
      ),
    );
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '저는 사용자가 모르는 백그라운드 로직을 참 좋아합니다.\n\n'
                            'AuthWrapper에서 로딩 화면을 보여주면서 백그라운드에서 토큰 검증을 하고,\n'
                            '그 결과에 따라 적절한 화면으로 자동 전환하도록 구현했습니다.\n\n'
                            '위 코드를 통해 사용자는 별도의 조작 없이도 자연스럽게 로그인 상태가 유지되는 경험을 할 수 있게 되었습니다.',
                      ),
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
