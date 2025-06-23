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

class Isar extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const Isar({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<Isar> createState() => _IsarState();
}

class _IsarState extends State<Isar> {
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
                    title: 'Isar Database',
                    tags: const [
                      '#Isar',
                      '#Database',
                      '#NoSQL',
                      '#Flutter',
                      '#Local Storage',
                      '#로컬 데이터베이스',
                      '#Dart',
                      '#CRUD',
                      '#데이터 저장',
                    ],
                    content:
                        'Flutter 앱에서 로컬 데이터를 저장해야 할 때, 어떤 선택지가 있을까요?\n'
                        'SharedPreferences? SQLite? Hive? 아니면 Isar?\n\n'
                        '저는 처음 간단한 데이터는 SharedPreferences로, 복잡한 데이터는 Hive로 처리했습니다.\n'
                        'Hive를 사용하며 느낀점은 "와, 이렇게 쉬울 수가!"라며 개발이 신기해졌었던 기억이 있습니다.\n\n'
                        '하지만 프로젝트가 커지고 데이터 구조가 복잡해지면서 한계를 느끼기 시작했습니다.\n'
                        '특히 관계형 데이터 처리와 복잡한 쿼리가 필요한 상황에서 Hive는 FLutter 신입인 저에게 있어 너무나 커다란 벽이였던 것 같았습니다.\n\n'
                        '그러던 중 ICT 인턴 기술 미팅, 제가 발표를 해야하는 시간 저는 신기술인 Isar Database를 발견하고 기술해 발표했습니다.\n'
                        '"Hive의 편리함 + NoSQL의 강력함"을 모두 갖춘 Isar\n\n'
                        '2024년 11월 발표 이후, 프로젝트에 적용해보면서 느낀 Isar\n'
                        '제가 프로젝트에서 어떻게 사용하고 있는지 공유해보겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Isar Database란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Isar는 Flutter와 Dart를 위한 초고속 NoSQL 데이터베이스입니다.\n'
                            'Hive보다 빠르고, SQLite보다 사용하기 쉬우며, 강력한 쿼리 기능을 제공합니다.\n\n'
                            '그 중 가장 큰 장점은 "Type-safe"하다는 점입니다.\n'
                            '컴파일 타임에 오류를 잡아주고, IDE에서 자동완성도 완벽하게 지원합니다.',
                        detailContent:
                            'Isar Database의 핵심 특징:\n\n'
                            '🔸 1. 초고속 성능\n'
                            '  - Hive보다 최대 10배, SQLite보다 최대 4배 빠름\n'
                            '  - C++로 작성된 네이티브 엔진 사용\n'
                            '  - 멀티 스레드 지원으로 UI 블로킹 없음\n\n'
                            '🔸 2. Type-safe & Code Generation\n'
                            '  - Dart 클래스를 그대로 데이터베이스 스키마로 사용\n'
                            '  - 컴파일 타임 안전성 보장\n'
                            '  - IDE 자동완성과 리팩토링 지원\n\n'
                            '🔸 3. 강력한 쿼리 기능\n'
                            '  - 복합 인덱스와 멀티 엔트리 인덱스 지원\n'
                            '  - 풀텍스트 검색 (Full-text search)\n'
                            '  - 관계형 쿼리 (Links & Backlinks)\n\n'
                            '🔸 4. 개발자 친화적\n'
                            '  - Isar Inspector로 실시간 데이터베이스 탐색\n'
                            '  - 간단한 설정으로 즉시 사용 가능\n'
                            '  - 트랜잭션과 스키마 마이그레이션 지원\n\n'
                            '🔸 5. 크로스 플랫폼\n'
                            '  - iOS, Android, Desktop, Web 모두 지원\n'
                            '  - 동일한 API로 모든 플랫폼에서 사용 가능\n\n'
                            'NoSQL이지만 SQL처럼 강력한 쿼리를 제공하면서도\n'
                            'Hive처럼 사용하기 쉬운 것이 Isar의 가장 큰 매력입니다.',
                        toggleText: 'Isar 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Hive 말고 왜 Isar를 선택했나요?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '처음에는 Hive를 너무나 좋아했었습니다.\n'
                            '간단하고, 빠르고, 사용하기 쉬웠기 때문입니다.\n\n'
                            '하지만 프로젝트를 진행하면서 몇 가지 아쉬운 점들이 보이기 시작했습니다.\n'
                            '특히 데이터가 많아지고, 검색과 필터링 기능이 필요해지면서\n'
                            '"이제 Hive로는 한계가 있겠구나..." 라는 생각이 들었습니다.\n\n'
                            '그래서 대안을 찾던 중 발견한...',
                        toggleText:
                            '            처음엔 Hive로 충분했지만\n실제로 겪은 한계점들이 궁금하다면 Click',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            'Hive를 사용하면서 겪은 한계점들:\n\n'
                            '❌ Hive의 한계점들\n'
                            '• 복잡한 쿼리가 어려움 (필터링, 정렬, 조인 등)\n'
                            '• 관계형 데이터 처리의 한계\n'
                            '• 인덱싱 기능 부족으로 대용량 데이터에서 성능 저하\n'
                            '• 풀텍스트 검색 불가능\n'
                            '• 스키마 변경 시 마이그레이션이 복잡\n\n'
                            '❌ 프로젝트에서 느낀 문제점들\n'
                            '• 데이터 검색 시 모든 데이터를 로드해서 필터링해야 함\n'
                            '• 사용자가 많아질수록 검색 속도가 현저히 느려짐\n'
                            '• 복잡한 데이터 관계를 표현하기 어려움\n'
                            '• 데이터 구조 변경 시 기존 데이터 처리가 복잡\n\n'
                            '그래서 대안을 찾던 중 Isar Database를 발견했습니다.\n\n'
                            '✅ Isar를 선택한 이유\n'
                            '• Hive의 편리함을 유지하면서도 더 강력한 기능 제공\n'
                            '• Type-safe한 코드 생성으로 런타임 오류 방지\n'
                            '• 복잡한 쿼리와 관계형 데이터 처리 가능\n'
                            '• Isar Inspector로 실시간 디버깅 지원\n'
                            '• 성능이 Hive보다도 더 빠름\n\n'
                            '✅ 마이그레이션 경험\n'
                            '• "Hive에서 Isar로 마이그레이션하는 게 번거롭지 않을까?" 걱정했습니다\n'
                            '• 하지만 생각보다 전환 과정도 어렵지 않았습니다\n'
                            '• 코드 구조가 더 깔끔해지고 성능도 향상되었습니다\n\n'
                            '결과적으로 지금은 모든 새 프로젝트에서 Isar를 기본으로 사용하고 있습니다.\n'
                            'ICT 인턴 시절 기술 발표에서 Isar를 소개한 후, 제 프로젝트에 적극 도입하게 되었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '이제부터는 제가 프로젝트에서 사용하는',
                        textSubTitle: 'Isar Database 구현 방법과 패턴을 소개합니다.',
                        textSubTitle2: '\n\n\n\n소개하는 코드는 제 프로젝트에서 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      //---------이제 내 이야기 시작------------------------
                      // 1번: Isar + Injectable 의존성 주입 시스템
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Isar + Injectable로 구현하는 타입 세이프한 의존성 주입 시스템',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Isar를 단독으로 사용하는 것도 좋지만, 저는 프로젝트에서는 의존성 주입(DI)과 함께 사용하고 있습니다.\n'
                            '특히 Clean Architecture 패턴과 결합하면 더욱 강력해집니다.(이 내용은 2번 내용에서 다루겠습니다.)\n\n'
                            '저는 get_it과 Injectable을 함께 사용해서 타입 세이프한(Type-safe) DI 시스템을 사용했습니다..\n'
                            '이 방법의 장점은 컴파일 타임에 의존성 오류를 잡을 수 있고, IDE에서 자동완성을 지원받을 수 있기 때문입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml - DI 의존성 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  # Isar 관련
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  path_provider: ^2.1.1
  
  # DI 관련
  get_it: ^7.6.4
  injectable: ^2.3.2

dev_dependencies:
  # 코드 생성
  isar_generator: ^3.1.0+1
  injectable_generator: ^2.4.1
  build_runner: ^2.4.7
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 과정 사실 저는 쉽게 끝날 줄 알았습니다.\n'
                            '하지만 예상도 못한 문제점이 있었습니다.\n바로 Isar 데이터베이스 제작자는 Hive를 제작한 개발자였다는 것 입니다.\n\n'
                            '버전 충돌.. 지금 Isar는 너가 사용하고 있는 injectable_generator 이 라이브러리 최신버전과 맞지 않아\n'
                            '버전을 다르게 해야해 라는 오류들...\n\n'
                            '결국, 저는 의존성 버전을 수동으로 조정하고, pubspec.lock을 지운 뒤 하나씩 맞춰가는 과정을 반복했었던 기억이 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Isar 초기화 서비스 - @singleton으로 등록',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@singleton
class IsarInitService {
  late final Future<Isar> isar;
  
  IsarInitService() {
    isar = openDB();
  }
  
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        AppVersionSchema,
        NaverMapVersionSchema,
        NaverMapDataSchema,
        NaverMapCategorySchema,
      ],
      directory: dir.path,
      name: 'ifsai_db', // 프로젝트명으로 DB 이름 설정
    );
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Isar 서비스 - DI로 의존성 주입',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@singleton
class NaverMapDataService {
  final IsarInitService _isarInitService;
  final NaverMapVersionService _naverMapVersionService;
  final NaverMapCategoryService _naverMapCategoryService;

  // Injectable이 자동으로 의존성 주입
  NaverMapDataService(
    this._isarInitService, 
    this._naverMapVersionService,
    this._naverMapCategoryService
  );

  // 네이버 맵 데이터 조회
  Future<List<NaverMapDataContent>> getAllNaverMapData() async {
    try {
      final db = await _isarInitService.isar;
      final data = await db.naverMapDatas.where().findAll();
      return data.first.naverMapData!;
    } catch (e) {
      return [];
    }
  }
  
  // 트랜잭션을 사용한 데이터 저장
  Future<void> saveNaverMapData(List<NaverMapDataContent> response) async {
    final db = await _isarInitService.isar;
    
    await db.writeTxn(() async {
      await db.naverMapDatas.clear(); // 기존 데이터 삭제
      await db.naverMapDatas.put(NaverMapData(naverMapData: response));
    });
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'main.dart - DI 컨테이너 초기화',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Isar 초기화 (iOS에서 필요)
  await Isar.initializeIsarCore();
  
  // Injectable 초기화
  configureDependencies();
  
  runApp(MyApp());
}

// Injectable 설정
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();''',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 2번: Repository Pattern
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            'Repository Pattern으로 분리하는\n     DIO 그리고 Isar - 네트워크와 로컬 데이터 전략',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '앱에서는 네트워크 데이터와 로컬 데이터를 동시에 다뤄야 합니다.\n'
                            '"네트워크에서 가져올까? 로컬에서 가져올까?"를 런타임에 결정해야 하죠.\n\n'
                            '저는 Repository Pattern을 사용해서 이 문제를 해결했습니다.\n(레포지토리 패턴은 다른 기술블로그에 자세하게 기술되어있습니다.)\n\n'
                            'Remote Repository(DIO)와 Local Repository(Isar)를 완전히 분리하고,\n'
                            '상위 Repository에서 데이터 소스를 상황에 맞게 선택하도록 구현했습니다.\n\n'
                            '이 방법은 네트워크 상황이나 데이터가 최신 유무에 따라 유연하게 대응할 수 있는 장점으로 이어졌습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Remote Source - DIO를 사용한 네트워크 데이터',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@singleton
class NaverMapRemoteSource {
  final Dio _dio;
  
  NaverMapRemoteSource(this._dio);
  
  // 네트워크에서 네이버 맵 데이터 가져오기
  Future<List<NaverMapDataContent>> getNaverMapDataFromServer() async {
    try {
      final response = await _dio.get('/api/naver-map/data');
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data['data'];
        return jsonList
            .map((json) => NaverMapDataContent.fromJson(json))
            .toList();
      }
      throw Exception('Server error: ${response.statusCode}');
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '처음에는 네트워크에서 데이터를 받아올 때마다 매번 전체 데이터를 받아왔습니다.\n'
                            '하지만 네이버 맵 데이터가 192개나 되다 보니 네트워크 비용과 로딩 시간이 문제가 되었습니다.\n\n'
                            '"매번 똑같은 데이터를 다시 받아와야 하나?" 하는 의문이 들었습니다.\n'
                            '그래서 서버 개발자와 협의해 버전 시스템을 도입했습니다.\n\n'
                            '서버에서는 데이터 변경 시마다 버전을 올리고,\n'
                            'Flutter에서는 현재 버전과 서버 버전을 비교해서 필요할 때만 새 데이터를 받아오도록 했습니다.\n',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Local Source - Isar를 사용한 로컬 데이터',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@singleton
class NaverMapLocalSource {
  final NaverMapDataService _naverMapDataService;
  final NaverMapCategoryService _naverMapCategoryService;
  
  NaverMapLocalSource(this._naverMapDataService, this._naverMapCategoryService);
  
  // 로컬에서 네이버 맵 데이터 가져오기
  Future<List<NaverMapDataContent>> getNaverMapDataFromLocal() async {
    return await _naverMapDataService.getAllNaverMapData();
  }
  
  // 로컬에 네이버 맵 데이터 저장
  Future<void> saveNaverMapDataToLocal(List<NaverMapDataContent> data) async {
    await _naverMapDataService.saveNaverMapData(data);
  }
  
  // 로컬에서 카테고리 데이터 가져오기
  Future<List<NaverMapCategoryContent>> getNaverMapCategoryFromLocal() async {
    return await _naverMapCategoryService.getAllNaverMapCategory();
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Local Source 구현할 때 가장 중요하게 생각한 부분은 "DTO → Model 변환 전에 Isar에 먼저 저장하자"였습니다.\n\n'
                            '서버에서 받은 JSON 데이터를 Model로 변환하기 전 오류가 생길 수 있다는 신입다운 생각?과\n'
                            '문제가 발생하면 전체 데이터를 다시 받아와야 하는 상황이 발생하기 때문입니다.\n\n'
                            '저는 서버 응답을 받으면:\n'
                            '먼저 Isar에 raw 데이터 저장\n'
                            '저장 성공 후, Model로 변환\n'
                            '변환 실패해도 raw 데이터는 안전하게 보관\n\n'
                            '이 흐름 덕분에 데이터 손실 없이 안정적인 캐싱 시스템을 구축할 수 있었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Repository - 데이터 소스 통합 관리',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@singleton
class NaverMapRepository {
  final NaverMapRemoteSource _remoteSource;
  final NaverMapLocalSource _localSource;
  final StartRemoteLocal _startRemoteLocal; // 버전 관리용
  
  NaverMapRepository(this._remoteSource, this._localSource, this._startRemoteLocal);
  
  // 네이버 맵 데이터 가져오기 - 스마트한 캐싱 전략
  Future<List<NaverMapDataContent>> getNaverMapData() async {
    try {
      // 1. 로컬 버전 확인
      final localVersion = await _startRemoteLocal.getNaverMapVersionWithIsar();
      
      // 2. 서버에서 최신 버전 확인
      final serverVersion = await _remoteSource.getNaverMapVersionFromServer();
      
      // 3. 버전 비교해서 데이터 소스 결정
      if (localVersion?.ifsaiServerMapVersion == serverVersion) {
        // 로컬 데이터가 최신이면 로컬에서 가져오기
        print(' 로컬 데이터 사용 (최신 버전)');
        return await _localSource.getNaverMapDataFromLocal();
      } else {
        // 서버에서 최신 데이터 가져와서 로컬에 저장
        print('서버에서 최신 데이터 가져오기');
        final serverData = await _remoteSource.getNaverMapDataFromServer();
        await _localSource.saveNaverMapDataToLocal(serverData);
        return serverData;
      }
    } catch (e) {
      // 네트워크 오류 시 로컬 데이터 fallback
      print('네트워크 오류 - 로컬 데이터 사용: $e');
      return await _localSource.getNaverMapDataFromLocal();
    }
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 Repository 로직이 Isar 구현 부분 중 가장 시간을 많이 소요한 코드입니다.\n\n'
                            '처음에는 "버전 체크 API를 별도로 호출하면 네트워크 요청이 2번이 되는데 비효율적이지 않나?" 걱정했습니다.\n'
                            '하지만 실제로 측정해보니 버전 체크는 x바이트, 전체 데이터는 y 192 였기 때분입니다.\n\n'
                            '여기서 핵심은 "서버한테 현재 내 버전을 보내서, 최신이면 304 Not Modified로 응답받기" 였습니다.\n'
                            '이렇게 하면 99%의 경우에 네트워크 비용을 거의 0으로 만들 수 있고,\n'
                            '새로운 매장이 추가되었을 때만 차분 데이터를 받아올 수 있게 구현하였기 때문입니다.\n',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Service Layer - Repository 사용',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@singleton
class NaverMapService {
  final NaverMapRepository _naverMapRepository;
  
  NaverMapService(this._naverMapRepository);
  
  // 서비스 레이어에서는 단순하게 Repository 호출
  Future<List<NaverMapDataContent>> getNaverMapData() async {
    return await _naverMapRepository.getNaverMapData();
  }
  
  // 카테고리별 데이터 필터링
  Future<List<NaverMapDataContent>> getNaverMapDataByCategory(String category) async {
    final allData = await _naverMapRepository.getNaverMapData();
    return allData.where((data) => data.mainCategory == category).toList();
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'Service Layer에서는 Repository의 복잡한 로직을 숨기고 비즈니스 요구사항에 맞는 메서드만 노출합니다.\n\n'
                            '예를 들어, UI에서는 "카테고리별 매장 목록"이 필요하지만\n'
                            'Repository에서는 "전체 매장 목록"만 제공합니다.\n\n'
                            '이런 차이를 Service Layer에서 해결해줍니다:\n'
                            '• Repository → Service: 데이터 가져오기\n'
                            '• Service → UI: 비즈니스 로직 적용된 데이터 제공\n\n'
                            '이렇게 하면 UI는 복잡한 데이터 처리 로직을 몰라도 되고,\n'
                            'Repository는 순수한 데이터 관리에만 집중할 수 있습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 4번: Embedded 클래스로 설계하는 복잡한 네이버 맵 데이터 구조
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Embedded 클래스로 설계하는 복잡한 네이버 맵 데이터 구조',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '앱 개발에서 가장 고민되는 부분이 "복잡한 데이터 구조를 어떻게 저장할까?"였습니다.\n'
                            '네이버 맵 API에서 받아오는 매장 데이터만 해도 15개가 넘는 필드가 있었고,\n'
                            '각각이 서로 다른 타입(int, double, String)이었습니다.\n\n'
                            '필드 15개  매장 192개 (15  192 = 2880개! 호곡..)\n\n'
                            'Hive라면 테이블을 여러 개 만들어야 했겠지만,\n'
                            'Isar의 @embedded를 사용하면 복잡한 객체를 하나의 컬렉션에 저장할 수 있습니다.\n\n'
                            '이번 내용은 제가 프로젝트에서 어떻게 192개 매장의 복잡한 데이터를 구조화했는지 보여드리겠습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '메인 컬렉션 - NaverMapData',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@collection
@Name("NaverMapData")
class NaverMapData {
  Id id = Isar.autoIncrement;

  // 매장 데이터를 List로 저장
  List<NaverMapDataContent>? naverMapData;

  NaverMapData({this.naverMapData});
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '처음에는 각 매장을 개별 컬렉션으로 저장하려고 했습니다.\n'
                            '하지만 192개 매장을 개별로 관리하면 쿼리 성능이 떨어지고 메모리 효율성도 좋지 않았습니다.\n\n'
                            '그래서 "전체 매장 데이터를 하나의 List로 관리하자"고 결정했습니다.\n'
                            '이렇게 하면 한 번의 쿼리로 모든 데이터를 가져올 수 있고,\n'
                            '앱 시작 시 전체 데이터를 메모리에 로드해서 빠른 검색이 가능해집니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'Embedded 클래스 - NaverMapDataContent (실제 매장 데이터)',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
@embedded
class NaverMapDataContent {
  // 기본 정보
  int? marketId;           // 매장 고유 ID
  String? marketName;      // 매장명
  String? marketDescription; // 매장 설명
  String? marketImage;     // 매장 대표 이미지 URL
  
  // 카테고리 정보 (2단계 분류)
  String? mainCategory;    // 대분류 (예: "음식점")
  String? majorCategory;   // 소분류 (예: "한식", "중식")
  
  // 위치 정보
  double? locationX;       // 경도 (longitude)
  double? locationY;       // 위도 (latitude)
  String? detailAddress;   // 상세 주소
  
  // 영업 정보
  String? openTime;        // 영업 시작 시간
  String? closeTime;       // 영업 종료 시간
  String? closedDays;      // 휴무일
  String? eventMessage;    // 이벤트/공지사항
  
  // 리뷰 및 할인 정보
  double? averageReviewScore; // 평균 리뷰 점수
  int? reviewCount;           // 리뷰 개수
  int? maxDiscountRate;       // 최대 할인율(%)

  NaverMapDataContent({
    this.marketId,
    this.marketName,
    this.marketDescription,
    this.marketImage,
    this.mainCategory,
    this.majorCategory,
    this.locationX,
    this.locationY,
    this.detailAddress,
    this.openTime,
    this.closeTime,
    this.closedDays,
    this.eventMessage,
    this.averageReviewScore,
    this.reviewCount,
    this.maxDiscountRate,
  });
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구조를 설계할 때 가장 고민했던 부분들을 공유해보겠습니다:\n\n'
                            '"null safety를 어떻게 처리할까?"\n'
                            '서버에서 모든 필드가 항상 오는 건 아니었습니다. 특히 영업시간이나 할인율 같은 정보는 선택적이었죠.\n'
                            '그래서 모든 필드를 nullable(?)로 선언했습니다.\n\n'
                            '"카테고리를 enum으로 할까 String으로 할까?"\n'
                            '처음엔 enum으로 하려했지만, 서버에서 새로운 카테고리가 추가될 때마다 앱 업데이트를 해야 했습니다.\n'
                            '그래서 String으로 하고 앱에서 동적으로 처리하도록 했습니다.\n\n'
                            '"위치 정보를 별도 클래스로 분리할까?"\n'
                            '고민했지만, 쿼리 성능과 단순함을 위해 flat한 구조로 유지했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'JSON 직렬화 - toJson() 메서드',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// NaverMapDataContent 클래스 내부
Map<String, dynamic> toJson() {
  return {
    'marketId': marketId,
    'mainCategory': mainCategory,
    'majorCategory': majorCategory,
    'locationX': locationX,
    'locationY': locationY,
    'marketImage': marketImage,
    'marketName': marketName,
    'marketDescription': marketDescription,
    'detailAddress': detailAddress,
    'eventMessage': eventMessage,
    'openTime': openTime,
    'closeTime': closeTime,
    'closedDays': closedDays,
    'averageReviewScore': averageReviewScore,
    'reviewCount': reviewCount,
    'maxDiscountRate': maxDiscountRate,
  };
}

// 사용 예시 - 디버깅이나 로깅할 때 유용
void debugPrintMarketData(NaverMapDataContent market) {
  print('매장 정보: ${market.toJson()}');
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            'toJson() 메서드를 추가한 이유는 디버깅과 로깅 때문이었습니다.\n\n'
                            'Isar에서는 직접적으로 필요하지 않지만,\n'
                            '개발 중에 "어떤 데이터가 저장되었는지" 확인하려면 JSON 형태로 출력하는 게 가장 보기 좋았어요.\n\n'
                            '특히 서버에서 받은 데이터와 로컬에 저장된 데이터를 비교할 때 매우 유용했습니다.\n'
                            'print() 한 줄로 전체 매장 정보를 한눈에 볼 수 있기 때문입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 5번: 트랜잭션으로 보장하는 데이터 일관성
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            '트랜잭션으로 보장하는 데이터 일관성 - writeTxn()과 clear()의 실전 활용',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '데이터베이스에서 가장 중요한 개념 중 하나가 "원자성(Atomicity)"입니다.\n(전임 교수님이 데이터 베이스 교수님이라.. A+ 받았습니다.)\n'
                            '"모든 작업이 성공하거나, 모든 작업이 실패하거나" 둘 중 하나여야 한다는 뜻이죠.\n\n'
                            '특히 우리 프로젝트에서는 매장 데이터 업데이트 시 기존 데이터를 삭제하고 새 데이터를 저장해야 했는데,\n'
                            '만약 삭제는 성공했는데 저장이 실패하면? 모든 데이터가 사라져 버립니다.\n\n'
                            'Isar의 writeTxn()이 바로 이런 문제를 해결해줍니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '트랜잭션 없이 구현 - 위험한 방법',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 위험한 방법 - 트랜잭션 없음
Future<void> updateNaverMapDataUnsafe(List<NaverMapDataContent> newData) async {
  final db = await _isarInitService.isar;
  
  // 1. 기존 데이터 삭제
  await db.naverMapDatas.clear();
  
  // 만약 여기서 앱이 종료되거나 오류가 발생하면?
  // 기존 데이터는 사라지고 새 데이터는 저장되지 않지만 Isar는 오류를 방지해는 Try Catch 문이 있는 것 같습니다.
  
  // 2. 새 데이터 저장
  await db.naverMapDatas.put(NaverMapData(naverMapData: newData));
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '트랜잭션으로 안전하게 구현',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 안전한 방법 - writeTxn() 사용
Future<void> saveNaverMapData(List<NaverMapDataContent> response) async {
  final db = await _isarInitService.isar;

  // 버전 정보 업데이트 준비
  NaverMapVersion? version = 
      await _naverMapVersionService.getNaverMapVersionWithIsar();
  String? serverVersion = version?.ifsaiServerMapVersion;

  final newVersion = NaverMapVersion(
    ifsaiVersion: serverVersion,
    ifsaiServerMapVersion: version!.ifsaiServerMapVersion,
  );

  // 카테고리 데이터도 함께 저장
  await _naverMapCategoryService.saveNaverMapCategory(response);

  // 핵심: 모든 작업을 하나의 트랜잭션으로 묶기
  await db.writeTxn(() async {
    // 1. 기존 매장 데이터 삭제
    await db.naverMapDatas.clear();
    
    // 2. 기존 버전 데이터 삭제  
    await db.naverMapVersions.clear();

    // 3. 새 매장 데이터 저장
    await db.naverMapDatas.put(NaverMapData(naverMapData: response));
    
    // 4. 새 버전 데이터 저장
    await db.naverMapVersions.put(newVersion);
  });
  
  // writeTxn() 블록이 성공적으로 완료되면
  // 모든 작업이 동시에 커밋
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '실제로 개발 중에 트랜잭션의 중요성을 체감한 순간이 있었습니다.\n\n'
                            'Hive로 디버깅 중에 코드 실행을 중간에 멈췄는데, 기존 데이터는 삭제되었지만 새 데이터는 저장되지 않아서\n'
                            '앱을 다시 실행했을 때 매장 목록이 완전히 비어있었던 경험입니다.\n\n'
                            '"만약 사용자가 실제로 이런 상황을 겪으면 어떻게 되지?" 생각하니...\n\n'
                            'writeTxn()을 도입한 후로는 이런 문제가 완전히 사라졌습니다.\n'
                            '중간에 앱이 종료되어도 기존 데이터는 그대로 유지되고,\n'
                            '모든 작업이 성공했을 때만 새 데이터로 교체됩니다.',
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
