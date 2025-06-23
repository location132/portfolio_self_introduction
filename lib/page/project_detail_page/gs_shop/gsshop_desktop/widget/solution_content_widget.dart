import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/code_block.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/title_text_tech.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/story_block.dart';

class SolutionContentWidget extends StatelessWidget {
  final bool isMobile;
  const SolutionContentWidget({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextTechBlog(title: '1. 생명주기 개선을 통한 상태 관리', isMobile: isMobile),
        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '문제의 근본 원인은 검색창에 포커스가 갈 때마다 FutureBuilder가 재실행되어 화면이 번쩍이는 것이었습니다. '
              '이를 해결하기 위해 생명주기를 개선한 상태 관리를 적용했습니다.',
        ),
        SizedBox(height: isMobile ? 20.h : 20),

        CodeBlock(
          isMobile: isMobile,
          title: '생명주기 개선 코드',
          language: 'dart',
          code: '''
class _SearchHistory extends State<SearchHistory> {
  bool _isFirstSearchBar = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFirstSearchBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SearchHistoryModel>>(
      future: getSearchHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            _isFirstSearchBar) {
          return const SizedBox(); // 첫 로딩만 숨김
        }
      },
    );
  }
}''',
        ),

        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '개선사항:\n'
              '• _isFirstSearchBar 플래그로 첫 번째 로딩만 숨기기\n'
              '• didChangeDependencies()에서 플래그 변경으로 재빌드 방지\n'
              '• 이후 검색에서는 자연스러운 로딩 상태 표시',
        ),

        SizedBox(height: isMobile ? 40.h : 40),

        TitleTextTechBlog(title: '2. UI 상태 전환 개선', isMobile: isMobile),
        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '검색 기록 삭제나 상태 변경 시 갑작스러운 변화를 방지하기 위해 '
              'AnimatedOpacity를 활용해 자연스러운 UI 전환을 구현했습니다.',
        ),
        SizedBox(height: isMobile ? 20.h : 20),

        CodeBlock(
          isMobile: isMobile,
          title: 'UI 개선 코드',
          language: 'dart',
          code: '''
class _SearchHistory extends State<SearchHistory> {
  double _historyOpacity = 1.0;

  void removeHistory(String searchItem) async {
    setState(() {
      _historyOpacity = 0.0; // 페이드 아웃
    });
    
    await Future.delayed(const Duration(milliseconds: 250), () async {
      preferencesSearchHistort.removeSearchHistory(searchItem);
      setState(() {
        _historyOpacity = 1.0; // 페이드 인
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _historyOpacity,
      duration: const Duration(milliseconds: 700),
      child: FutureBuilder(...),
    );
  }
}''',
        ),

        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '개선 효과:\n'
              '• 삭제/수정 시 0.25초 페이드 아웃 → 작업 수행 → 0.7초 페이드 인\n'
              '• 갑작스러운 화면 변화 대신 자연스러운 전환\n'
              '• 사용자에게 작업이 진행 중임을 시각적으로 알림',
        ),

        SizedBox(height: isMobile ? 40.h : 40),

        TitleTextTechBlog(title: '3. Cubit을 통한 중앙화된 상태 관리', isMobile: isMobile),
        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '검색창과 검색 결과 화면 간의 상태 동기화를 위해 Cubit 패턴을 적용하여 '
              '중앙화된 상태 관리 시스템을 구축했습니다.',
        ),
        SizedBox(height: isMobile ? 20.h : 20),

        CodeBlock(
          isMobile: isMobile,
          title: 'Cubit 상태 관리 코드',
          language: 'dart',
          code: '''
// SearchCubit
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void updateSearchScreenState(String searchValue) {
    if (searchValue.isNotEmpty) {
      emit(state.copyWith(
        isSearchResultVisible: true,
        isHistoryVisible: false,
        currentSearchValue: searchValue,
      ));
    } else {
      emit(state.copyWith(
        isSearchResultVisible: false,
        isHistoryVisible: true,
        currentSearchValue: '',
      ));
    }
  }

  void cacheRelatedSearches(List<String> searches) {
    emit(state.copyWith(cachedRelatedSearches: searches));
  }
}

// 검색창에서의 사용
void onSearchChanged(String value) {
  final searchCubit = context.read<SearchCubit>();
  searchCubit.updateSearchScreenState(value.trim());
}''',
        ),

        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '상태 관리 개선사항:\n'
              '• Cubit을 통한 단방향 데이터 흐름\n'
              '• copyWith로 불변성을 보장하는 상태 변경\n'
              '• BlocBuilder로 효율적인 위젯 재빌드\n'
              '• 컴포넌트 간 props drilling 제거',
        ),

        SizedBox(height: isMobile ? 40.h : 40),

        TitleTextTechBlog(title: '4. 서버 통신 최적화와 에러 핸들링', isMobile: isMobile),
        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              'API 호출 시 발생할 수 있는 Race Condition과 네트워크 에러를 방지하기 위해 '
              '재시도 로직과 토큰 갱신 메커니즘을 구현했습니다.',
        ),
        SizedBox(height: isMobile ? 20.h : 20),

        CodeBlock(
          isMobile: isMobile,
          title: '서버 통신 최적화 코드',
          language: 'dart',
          code: '''
// RelatedSearchModel
@freezed
class RelatedSearchModel with _\$RelatedSearchModel {
  const factory RelatedSearchModel({
    required String word,
    required int frequency,
    required DateTime createdAt,
  }) = _RelatedSearchModel;

  factory RelatedSearchModel.fromJson(Map<String, dynamic> json) =>
      _\$RelatedSearchModelFromJson(json);
}

// RelatedSearchDto
@freezed
class RelatedSearchDto with _\$RelatedSearchDto {
  const factory RelatedSearchDto({
    required List<RelatedSearchModel> result,
    required bool success,
    String? message,
  }) = _RelatedSearchDto;

  factory RelatedSearchDto.fromJson(Map<String, dynamic> json) =>
      _\$RelatedSearchDtoFromJson(json);
}

Future<List<RelatedSearchModel>> sendRelatedSearch(String search, {int retry = 0}) async {
  final dio = Dio();
  const String url = '\${Environment.apiUrl}/auto-complete';

  try {
    final response = await dio.get(url, queryParameters: {'word': search});
    
    if (response.statusCode == 200) {
      final dto = RelatedSearchDto.fromJson(response.data);
      
      if (dto.success) {
        // 빈도수 기준 정렬로 일관된 순서 보장
        final sortedResults = dto.result.toList()
          ..sort((a, b) => b.frequency.compareTo(a.frequency));
        
        return sortedResults;
      }
    }
    return [];
  } catch (e) {
    if (retry < 1) {
      final tokenRefreshed = await _refreshToken();
      if (tokenRefreshed) {
        return await sendRelatedSearch(search, retry: 1);
      }
    }
    return [];
  }
}''',
        ),

        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '통신 최적화 방법:\n'
              '• Freezed 기반 모델과 DTO로 타입 안전성 확보\n'
              '• retry 파라미터로 자동 재시도 메커니즘\n'
              '• 토큰 만료 시 자동 갱신 후 재요청\n'
              '• 빈도수 기준 정렬로 일관된 검색 결과 순서\n'
              '• 에러 발생 시 빈 리스트 반환으로 앱 크래시 방지',
        ),

        SizedBox(height: isMobile ? 40.h : 40),

        TitleTextTechBlog(title: '5. Isar와 모델 기반 데이터 관리', isMobile: isMobile),
        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '로그인 상태에 따라 Isar 로컬 저장소와 서버 데이터를 seamless하게 전환하는 '
              '모델 기반 데이터 관리 시스템을 구현했습니다.',
        ),
        SizedBox(height: isMobile ? 20.h : 20),

        CodeBlock(
          isMobile: isMobile,
          title: 'SearchHistoryModel과 Isar 데이터 관리',
          language: 'dart',
          code: '''
// SearchHistoryModel
@collection
class SearchHistoryModel {
  Id id = Isar.autoIncrement;
  late String content;
  late DateTime createdAt;
  late bool isSynced;
  String? serverId;
}

// Repository 패턴으로 데이터 소스 통합
class SearchHistoryRepository {
  final Isar isar;
  final ApiService apiService;
  
  SearchHistoryRepository(this.isar, this.apiService);

  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final authCubit = GetIt.instance<AuthCubit>();
    
    if (authCubit.state.isLoggedIn) {
      // 서버 데이터 우선, 로컬에 캐시
      try {
        final serverHistory = await apiService.getSearchHistory();
        await _cacheToLocal(serverHistory);
        return serverHistory;
      } catch (e) {
        // 서버 실패 시 로컬 데이터 반환
        return await _getLocalHistory();
      }
    } else {
      // 로그인하지 않은 경우 로컬 데이터만
      return await _getLocalHistory();
    }
  }

  Future<void> saveSearchHistory(String content) async {
    final history = SearchHistoryModel()
      ..content = content
      ..createdAt = DateTime.now()
      ..isSynced = false;

    // 로컬에 즉시 저장
    await isar.writeTxn(() async {
      await isar.searchHistoryModels.put(history);
    });

    // 서버 동기화 시도
    await _syncToServer(history);
  }
}''',
        ),

        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '데이터 관리 개선사항:\n'
              '• Isar 컬렉션으로 타입 안전한 로컬 저장소\n'
              '• Repository 패턴으로 데이터 소스 추상화\n'
              '• 서버 실패 시 로컬 데이터 자동 fallback\n'
              '• 모델 기반 데이터 구조로 유지보수성 향상',
        ),

        SizedBox(height: isMobile ? 40.h : 40),

        TitleTextTechBlog(title: '6. 최적화된 검색 입력 처리', isMobile: isMobile),
        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '한글 조합형 입력으로 인한 과도한 onChange 이벤트를 최적화하고, '
              '검색창 포커스 관리를 통해 UX를 개선했습니다.',
        ),
        SizedBox(height: isMobile ? 20.h : 20),

        CodeBlock(
          isMobile: isMobile,
          title: '검색 입력 처리 최적화 코드',
          language: 'dart',
          code: '''
class _SearchBarClangState extends State<SearchBarClang> {
  final TextEditingController _searchBarCupertino = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  String saveSearchHistory = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    final searchCubit = context.read<SearchCubit>();
    
    if (_focusNode.hasFocus) {
      // 검색바 클릭 시 최근 검색어 + 실시간 검색어 표시
      searchCubit.showSearchHistory();
    } else if (!_focusNode.hasFocus) {
      // 검색바에서 벗어날 시 메인화면으로 이동
      searchCubit.showMainScreen();
    }
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.only(left: _isFocused ? 20 : 0),
      child: CupertinoSearchTextField(
        controller: _searchBarCupertino,
        onChanged: (value) {
          saveSearchHistory = value.trim();
          updateSearchScreenState();
        },
        onSubmitted: (value) {
          setsearchHistory(); // 검색 완료 시에만 히스토리 저장
        },
        focusNode: _focusNode,
      ),
    );
  }
}''',
        ),

        SizedBox(height: isMobile ? 20.h : 20),
        StoryBlock(
          isMobile: isMobile,
          story:
              '입력 처리 개선사항:\n'
              '• FocusNode로 검색창 상태 정확한 추적\n'
              '• trim()으로 불필요한 공백 제거\n'
              '• onSubmitted에서만 히스토리 저장으로 성능 개선\n'
              '• AnimatedContainer로 포커스 시 부드러운 레이아웃 변경\n'
              '• 한글 입력 중간 상태에서의 불필요한 API 호출 감소',
        ),

        SizedBox(height: isMobile ? 100.h : 100),
      ],
    );
  }
}
