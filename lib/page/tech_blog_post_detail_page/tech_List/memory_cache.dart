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

class MemoryCache extends StatefulWidget {
  final Function(bool) isFocused;
  final ScrollController? scrollController;
  final bool isMobile;
  const MemoryCache({
    super.key,
    required this.isFocused,
    this.scrollController,
    required this.isMobile,
  });

  @override
  State<MemoryCache> createState() => _MemoryCacheState();
}

class _MemoryCacheState extends State<MemoryCache> {
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
                    title: 'MemoryCache &\nDio Cache Interceptor',
                    tags: const [
                      '#MemoryCache',
                      '#DioCache',
                      '#Interceptor',
                      '#Caching',
                      '#Flutter',
                      '#메모리 캐싱',
                      '#Dart',
                      '#성능 최적화',
                      '#네트워크',
                    ],
                    content:
                        '앱에서 동일한 API를 반복 호출하거나 이미지를 계속 다운로드하면 성능이 떨어집니다.\n'
                        '"사용자가 같은 데이터를 요청할 때마다 서버에 요청해야 할까?" "이미 받은 데이터를 재사용할 수는 없을까?"\n\n\n'
                        '이런 고민에서 캐싱이 시작되었다고 감히?.. 생각합니다\n\n\n'
                        '저는 처음에 매번 API를 호출하는 방식을 사용했습니다.\n'
                        '간단하고 확실했기 때문입니다. 하지만 많은 요청과, 데이터 사용량이 많아지면서 문제가 생겼습니다.\n\n'
                        '특히 같은 매장 정보를 여러 번 요청하거나 이미지를 반복 로드할 때 비효율적이라는 걸 깨달았습니다.\n'
                        '그때부터 "언제 캐싱을 사용해야 하는가?"에 대해 고민하기 시작했습니다.\n\n'
                        '이제는 메모리 캐싱과 Dio Cache Interceptor를 적재적소에 활용하고 있습니다.\n'
                        '프로젝트에서 어떻게 구현하고 있는지 공유해보겠습니다.',
                    isBackgroundColor: state.isBackgroundColorWhite,
                    isMobile: widget.isMobile,
                  ),
                  SizedBox(height: widget.isMobile ? 64.h : 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'MemoryCache란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'MemoryCache는 앱의 메모리(RAM)에 데이터를 임시 저장하는 기술입니다.\n'
                            '자주 사용되는 데이터를 메모리에 보관해서 빠르게 접근할 수 있도록 합니다.\n\n'
                            '디스크 저장소나 네트워크 요청보다 월등히 빠른 속도를 제공합니다.',
                        detailContent:
                            'MemoryCache의 핵심 특징:\n\n'
                            '🔸 1. 초고속 데이터 접근\n'
                            '  - RAM에 직접 저장되어 나노초 단위 접근 속도\n'
                            '  - 디스크 I/O나 네트워크 요청 없이 즉시 데이터 반환\n'
                            '  - CPU 캐시와 유사한 개념으로 성능 최적화\n\n'
                            '🔸 2. 휘발성 저장소 특성\n'
                            '  - 앱 종료 시 모든 캐시 데이터 삭제\n'
                            '  - 메모리 부족 시 자동으로 오래된 데이터 제거\n'
                            '  - 임시 데이터 저장에 최적화\n\n'
                            '🔸 3. 주요 사용 사례\n'
                            '  - API 응답 데이터 임시 저장\n'
                            '  - 이미지 및 미디어 파일 캐싱\n'
                            '  - 계산 결과값 임시 보관\n'
                            '  - 사용자 세션 데이터 관리\n\n'
                            '🔸 4. 메모리 관리 전략\n'
                            '  - LRU (Least Recently Used) 알고리즘 활용\n'
                            '  - 최대 메모리 사용량 제한\n'
                            '  - TTL (Time To Live) 기반 자동 만료\n'
                            '  - 수동 캐시 무효화 지원\n\n'
                            '🔸 5. 성능 및 제약사항\n'
                            '  - 매우 빠른 읽기/쓰기 속도\n'
                            '  - 메모리 사용량에 따른 제약\n'
                            '  - 앱 재시작 시 데이터 손실\n'
                            '  - 멀티 스레드 환경에서 동시성 고려 필요\n\n'
                            '빠른 데이터 접근이 필요한 모든 상황에서 사용할 수 있는\n'
                            '가장 기본적이면서도 강력한 캐싱 기술이 MemoryCache입니다.',
                        toggleText: 'MemoryCache 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: 'Dio Cache Interceptor란?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            'Dio Cache Interceptor는 Flutter의 Dio HTTP 클라이언트에 캐싱 기능을 추가하는 라이브러리입니다.\n'
                            'HTTP 요청/응답을 자동으로 캐싱하여 네트워크 사용량을 줄이고 성능을 향상시킵니다.\n\n'
                            '개발자가 별도 코드 없이도 자동으로 캐싱이 적용되는 것이 가장 큰 장점입니다.',
                        detailContent:
                            'Dio Cache Interceptor의 핵심 특징:\n\n'
                            '🔸 1. HTTP 캐싱 표준 준수\n'
                            '  - Cache-Control, ETag, Last-Modified 헤더 지원\n'
                            '  - HTTP 1.1 캐싱 명세 완전 구현\n'
                            '  - 서버 응답에 따른 자동 캐싱 정책 적용\n'
                            '  - 조건부 요청을 통한 효율적 데이터 관리\n\n'
                            '🔸 2. 다중 저장소 지원\n'
                            '  - 메모리 캐시: 초고속 액세스\n'
                            '  - 디스크 캐시: 앱 재시작 후에도 유지\n'
                            '  - 하이브리드 캐시: 메모리 + 디스크 조합\n'
                            '  - 커스텀 저장소: 개발자 정의 저장 방식\n\n'
                            '🔸 3. 자동 캐싱 관리\n'
                            '  - 동일한 요청 자동 감지 및 캐시 반환\n'
                            '  - TTL 기반 자동 만료 처리\n'
                            '  - 네트워크 상태에 따른 스마트 캐싱\n'
                            '  - 백그라운드에서 캐시 갱신\n\n'
                            '🔸 4. 네트워크 최적화\n'
                            '  - 중복 요청 방지 (Request Deduplication)\n'
                            '  - 네트워크 오프라인 시 캐시 우선 반환\n'
                            '  - 부분 응답 캐싱 지원\n'
                            '  - 압축된 응답 캐싱\n\n'
                            '🔸 5. 개발자 친화적 설정\n'
                            '  - 간단한 Interceptor 추가만으로 적용\n'
                            '  - 세밀한 캐싱 정책 커스터마이징\n'
                            '  - 디버깅을 위한 상세 로깅\n'
                            '  - 캐시 통계 및 모니터링 지원\n\n'
                            'REST API를 사용하는 모든 Flutter 앱에서 손쉽게 적용할 수 있는\n'
                            '강력한 HTTP 캐싱 솔루션이 Dio Cache Interceptor입니다.',
                        toggleText: 'Dio Cache Interceptor 궁금하시면 Click',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '왜 캐싱 전략이 중요할까?',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 40.h : 40),
                      ExpandableContent(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        summary:
                            '앱 개발에서 겪는 캐싱 관련 문제들을 알아봅시다.\n'
                            '캐싱이 없을 때의 문제점과 올바른 캐싱 전략의 장점은 무엇인지\n\n'
                            '제 프로젝트 경험을 바탕으로 설명드리겠습니다.',
                        toggleText: '실무에서의 중요성 알아보기',
                        toggleTextClose: '도움이 되셨나요? (닫기)',
                        detailContent:
                            '앱 개발에서 겪는 캐싱 관련 문제들:\n\n'
                            '캐싱이 없을 때의 문제들\n'
                            '  매번 네트워크 요청으로 느린 응답 시간\n'
                            '  동일한 데이터를 반복 다운로드하여 데이터 낭비\n'
                            '  오프라인 상태에서 앱 사용 불가\n'
                            '  이미지 로딩 시마다 깜빡임 현상\n'
                            '  배터리 소모량 증가\n\n'
                            '올바른 캐싱 전략의 장점들\n'
                            '  즉시 로딩으로 향상된 사용자 경험\n'
                            '  네트워크 사용량 최대 80% 절약\n'
                            '  오프라인에서도 기본 기능 사용 가능\n'
                            '  서버 부하 감소로 안정적인 서비스\n'
                            '  앱 성능 향상과 배터리 절약\n\n'
                            '프로젝트 적용 경험\n'
                            '  "처음엔 모든 API를 실시간 호출했다가 성능 이슈로 캐싱을 도입했습니다."\n\n'
                            '  "이미지 캐싱만 적용해도 사용자 만족도가 크게 향상되었습니다.\n (이미지 프리로드 시간, 인디케이터 등이 사용되지 않기 때문입니다.)"\n\n'
                            '  "오프라인 캐싱으로 지하철에서도 앱을 사용할 수 있게 되었습니다. (아주 조금?.. 모든 것을 다 캐싱하지는 않습니다)"\n',
                      ),
                      SizedBox(height: widget.isMobile ? 80.h : 80),
                      MyStoryStart(
                        isMobile: widget.isMobile,
                        isBackgroundColorWhite: state.isBackgroundColorWhite,
                        codeExampleSectionKey: _codeExampleSectionKey,
                        textTitle: '이제부터는 제가 프로젝트에서 사용하는',
                        textSubTitle:
                            'MemoryCache & Dio Cache Interceptor 구현 방법을 소개합니다.',
                        textSubTitle2: '\n\n\n\n소개하는 코드는 제 프로젝트에서 구현한 코드입니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      //---------이제 내 이야기 시작------------------------
                      // 1번: Dio Cache Interceptor 다중 캐시 전략
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            'Dio Cache Interceptor 다중 캐시 전략\n  4가지 캐시 정책으로 API 응답 최적화',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '앱에서 API 호출 최적화는 필수입니다.\n'
                            '하지만 모든 API를 같은 방식으로 캐싱하면 문제가 발생합니다.\n\n'
                            '"실시간 데이터는 즉시 갱신되어야 하는데 캐시 때문에 오래된 데이터가 보인다면?"\n'
                            '"자주 바뀌지 않는 데이터는 매번 서버에서 가져올 필요가 있을까?"\n\n'
                            '이런 고민에서 4가지 캐시 전략을 설계했습니다.\n'
                            '실시간, 일반, 빈번 갱신, 장기 캐시로 API 특성에 맞는 최적화를 구현해봤습니다.\n\n'
                            '저는 굉장히 재미있는 방식으로 구현했습니다!',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml - Dio Cache Interceptor 의존성 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.3.2
  dio_cache_interceptor: ^3.4.2
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'dio_interceptor_cache.dart - 4가지 캐시 전략 설정',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

// 공유 MemCacheStore 인스턴스 생성
final sharedMemCacheStore = MemCacheStore();

// 1. 일반 캐시 (10시간) - 중요도 낮음
final cacheOptionsLow = CacheOptions(
  store: sharedMemCacheStore, 
  policy: CachePolicy.forceCache, 
  maxStale: const Duration(hours: 10), 
  hitCacheOnErrorExcept: [401, 403], 
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
);

// 2. 강제 새로고침 캐시 (10시간)
final cacheOptionsNoCache = CacheOptions(
  store: sharedMemCacheStore,
  policy: CachePolicy.refreshForceCache,
  maxStale: const Duration(hours: 10), 
  hitCacheOnErrorExcept: [401, 403], 
  keyBuilder: CacheOptions.defaultCacheKeyBuilder, 
);

// 3. 빈번 갱신 캐시 (5초) - 실시간 데이터용
final setupDioWithFrequentCache = CacheOptions(
  store: sharedMemCacheStore,
  policy: CachePolicy.forceCache,
  maxStale: const Duration(seconds: 5), 
  hitCacheOnErrorExcept: [401, 403], 
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
);

// 4. 장기 캐시 (20분) - 정적 데이터용
final cacheOptions10Minutes = CacheOptions(
  store: sharedMemCacheStore, 
  policy: CachePolicy.forceCache,
  maxStale: const Duration(minutes: 20), 
  hitCacheOnErrorExcept: [401, 403], 
  keyBuilder: CacheOptions.defaultCacheKeyBuilder, 
);

Future<Dio> setupDio(int useCache) async {
  final dio = Dio();

  switch (useCache) {
    case 0:
      dio.interceptors.add(DioCacheInterceptor(options: cacheOptionsLow));
      break;
    case 1:
      dio.interceptors.add(DioCacheInterceptor(options: cacheOptionsNoCache));
      break;
    case 2:
      dio.interceptors.add(DioCacheInterceptor(options: setupDioWithFrequentCache));
      break;
    case 3:
      dio.interceptors.add(DioCacheInterceptor(options: cacheOptions10Minutes));
      break;
  }

  return dio;
}

// 모든 메모리 캐시 초기화 
Future<void> clearAllMemoryCache() async {
  await sharedMemCacheStore.clean();
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현의 핵심은 "API 특성별 차별화된 캐싱"입니다.\n\n'
                            '• 일반 캐시 (10시간): 마켓 정보, 리뷰 등 자주 바뀌지 않는 데이터\n'
                            '• 강제 새로고침: 사용자가 당겨서 새로고침할 때 사용\n'
                            '• 빈번 갱신 (5초): 실시간성이 중요한 데이터\n'
                            '• 장기 캐시 (20분): 인기 검색어 같은 정적 데이터\n\n'
                            '저는 4가지의 정책을 통해 프로젝트를 구성한 경험이 참 재미있었습니다?... (머리 많이 아팠습니다..)',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '캐시 전략 사용 코드',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 마이페이지 데이터 - 일반 캐시 (10시간)
Future<Map<String, dynamic>> myPageData({int cacheMemory = 2}) async {
  Dio dio = await setupDio(cacheMemory);
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  var uri = '${dotenv.env['API_URL']}/v1/accounts/profiles';
  String? token = await storage.read(key: 'accessToken');
  
  if (token != null) {
    List<Cookie> cookies = [Cookie('accessToken', token)];
    cookieJar.saveFromResponse(Uri.parse(uri), cookies);
  }

  try {
    var response = await dio.get(uri, options: Options(extra: {
      'dio_cache_interceptor': cacheMemory,
    }));

    if (response.statusCode == 200 || response.statusCode == 304) {
      // 캐시에서 왔는지 확인
      bool isFromCache = response.statusCode == 304 || 
                        (response.extra['fromCache'] ?? false);
      print(isFromCache 
          ? 'dio4 - 캐시에서 데이터 가져옴' 
          : 'dio4 - 네트워크에서 데이터 가져옴');
      
      return response.data;
    } else {
      // 실패 시 강제 새로고침으로 재시도
      return await myPageData(cacheMemory: 1);
    }
  } catch (e) {
    print('API Error: $e');
    return {};
  }
}

// 인기 검색어 - 장기 캐시 (20분)
Future<List<Map<String, dynamic>>> popularSearches(
    {int cacheMemory = 3}) async {
  Dio dio = await setupDio(cacheMemory);
  var uri = '${dotenv.env['API_URL']}/v1/popular-search-word';
  
  Map<String, dynamic> sendData = {'size': '10'};

  try {
    var response = await dio.get(uri, queryParameters: sendData);

    if (response.statusCode == 200 || response.statusCode == 304) {
      bool isFromCache = response.statusCode == 304 || 
                        (response.extra['fromCache'] ?? false);
      print(isFromCache 
          ? 'dio98 - 캐시에서 데이터 가져옴' 
          : 'dio98 - 네트워크에서 데이터 가져옴');
      
      List<dynamic> data = response.data;
      List<Map<String, dynamic>> popularSearchesValue = [];
      
      for (var item in data) {
        Map<String, dynamic> value = {
          'searchWord': item['searchWord'],
          'rankChangeValue': item['rankChangeValue'],
        };
        popularSearchesValue.add(value);
      }
      return popularSearchesValue;
    } else {
      return [];
    }
  } catch (e) {
    print('인기 검색어 API Error: $e');
    return [];
  }
}''',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 2번: CachedNetworkImage 메모리 최적화
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            'CachedNetworkImage 메모리 최적화\n  DevicePixelRatio 기반 동적 캐시 크기 조정',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이미지 캐싱은 앱 성능의 핵심이라고 생각합니다.\n'
                            '하지만 단순히 CachedNetworkImage를 사용하는 것만으로는 부족합니다.\n\n'
                            '"메모리 사용량이 계속 늘어나서 앱이 크래시 된다면?"\n'
                            '"다양한 해상도의 기기에서 이미지 품질이 다르게 보인다면?"\n\n'
                            '이런 문제들을 해결하기 위해 DevicePixelRatio를 고려한\n'
                            '동적 캐시 크기 조정과 메모리 최적화 시스템을 구현했습니다.\n',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'pubspec.yaml - CachedNetworkImage 의존성 추가',
                        language: 'yaml',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
dependencies:
  flutter:
    sdk: flutter
  cached_network_image: ^3.3.0
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'DevicePixelRatio 기반 이미지 캐싱',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OptimizedCachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const OptimizedCachedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    // 화면 정보 가져오기
    final screenHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    
    // 최적화된 캐시 크기 계산
    final optimizedCacheHeight = ((height)  devicePixelRatio).round();
    final optimizedCacheWidth = ((width)  devicePixelRatio).round();

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          
          // 핵심: DevicePixelRatio를 고려한 메모리 캐시 크기 설정
          memCacheHeight: optimizedCacheHeight,
          memCacheWidth: optimizedCacheWidth,
          
          // 로딩 중 표시할 위젯
          placeholder: (context, url) => Container(
            color: Colors.grey.shade200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          
          // 에러 시 표시할 위젯
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade300,
            child: const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
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
                            '이 구현을 통해 얻고자 했던 목표는 명확했습니다.\n\n'
                            '• 메모리 사용량 최적화: 불필요하게 큰 원본 이미지를 그대로 캐싱하는 것을 방지\n'
                            '• 로딩 속도 향상: 각 기기에 맞는 적절한 크기로 캐싱하여 빠른 렌더링\n'
                            '• 앱 안정성 확보: 메모리 초과로 인한 크래시 가능성 감소\n'
                            '• 사용자 경험 개선: 다양한 해상도의 기기에서 일관된 이미지 품질 제공\n\n'
                            'DevicePixelRatio를 고려하는 간단한 로직 추가만으로도, 위와 같은 목표에 효과적으로 다가갈 수 있었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 3번: 공유 MemCacheStore 통합 관리
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title:
                            '공유 MemCacheStore 통합 관리\n  전역 인스턴스로 모든 API 캐시 일관성 유지',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '여러 캐시 전략을 사용하다 보면 새로운 문제가 생깁니다.\n'
                            '"각 캐시 정책마다 저장소가 다르면 어떻게 될까?"\n'
                            '"로그아웃할 때 모든 캐시를 한 번에 초기화할 수 있을까?"\n\n'
                            '캐시 저장소가 분리되어 있으면 데이터가 파편화되고 관리가 어려워집니다.\n'
                            '그래서 전역으로 공유되는 `sharedMemCacheStore` 인스턴스를 만들어서\n'
                            '모든 Dio Cache Interceptor가 동일한 메모리 저장소를 바라보도록 설계했습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title:
                            'dio_interceptor_cache.dart - 공유 MemCacheStore 생성',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

// 앱 전체에서 공유될 단일 MemCacheStore 인스턴스
final sharedMemCacheStore = MemCacheStore(
  maxSize: 10485760, // 10MB
  maxEntrySize: 524288, // 500KB
);

// 모든 캐시 옵션이 이 공유 저장소를 사용
final cacheOptionsLow = CacheOptions(
  store: sharedMemCacheStore,
  // ...
);
final cacheOptionsNoCache = CacheOptions(
  store: sharedMemCacheStore,
  // ...
);
// ... 다른 캐시 옵션들도 동일하게 설정
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현의 핵심은 "단일 인스턴스 공유"입니다.\n\n'
                            '이렇게 하면 어떤 캐시 정책으로 데이터를 저장하든, 모두 같은 `sharedMemCacheStore`에 저장됩니다.\n'
                            '이 코드로 인해 저는 캐시 데이터의 일관성을 유지하고,\n메모리 사용량을 예측 가능하게 관리할 수 있었다고 생각합니다.\n\n'
                            '또한, 아래처럼 모든 캐시를 한 번에 초기화하는 것도 매우 간단해집니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: '모든 캐시 초기화',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
// 모든 메모리 캐시 초기화 함수
Future<void> clearAllMemoryCache() async {
  await sharedMemCacheStore.clean();
  print('All memory caches have been cleared.');
}

// 사용 예시 (로그아웃 시)
Future<void> handleLogout() async {
  // ... 다른 로그아웃 로직 ...
  
  // 모든 API 캐시 즉시 삭제
  await clearAllMemoryCache();
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),

                      // 4번: 네이버 맵 아이콘 캐시 시스템
                      TitleTextTechBlog(
                        isMobile: widget.isMobile,
                        title: '네이버 맵 아이콘 캐시 시스템\n  위젯 기반 동적 아이콘 생성과 런타임 캐싱',
                        isBackgroundColor: state.isBackgroundColorWhite,
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '다른 프로젝트에서는 네이버 맵에 수많은 마커를 표시할 때 성능 저하가 발생했습니다.\n'
                            '특히, 같은 종류의 마커 아이콘을 매번 `OverlayImage.fromWidget`으로 생성하면서\n'
                            '불필요한 위젯 빌드와 이미지 변환이 반복되고 있었습니다.\n\n'
                            '"지도 스크롤이나 줌-인/아웃 시 마커가 버벅거린다면?"\n\n'
                            '이 문제를 해결하기 위해, 마커를 로드하는 시점에 아이콘을 동적으로 캐싱하는\n'
                            '런타임 캐시 시스템을 구현했습니다. 이를 통해 불필요한 객체 생성을 막고, 지도 성능을 크게 향상시킬 수 있었습니다.',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),

                      CodeBlock(
                        isMobile: widget.isMobile,
                        title: 'NaverMapApp_cubit.dart',
                        language: 'dart',
                        isBackgroundColor: state.isBackgroundColorWhite,
                        code: r'''
import 'package:flutter_naver_map/flutter_naver_map.dart';

Future<void> _loadMarkers(List<dynamic> stores) async {
  // 마커 로드 함수 내에서 사용할 로컬 아이콘 캐시
  final iconCache = <String, OverlayImage>{};
  final markers = <Marker>[];

  // 제휴 상점 데이터를 순회하며 마커 생성
  for (var store in stores) {
    final type = store['type'] as String;
    
    // 1. 캐시에 아이콘이 있는지 확인
    if (!iconCache.containsKey(type)) {
      // 2. 캐시에 없으면 최초 1회만 위젯으로부터 이미지 생성
      print('Creating new marker icon for type: $type');
      iconCache[type] = await OverlayImage.fromWidget(
        widget: MarkerWidget(type: type), // 마커 디자인을 담은 커스텀 위젯
        context: context,
      );
    }

    // 3. 캐시된 아이콘을 사용하여 마커 생성
    final marker = Marker(
      markerId: store['id'].toString(),
      position: LatLng(store['latitude'], store['longitude']),
      icon: iconCache[type]!, // 캐시에서 아이콘 가져오기
      // ...
    );
    markers.add(marker);
  }
  
  // 상태 업데이트로 지도에 마커 표시
  emit(state.copyWith(markers: markers));
}
''',
                      ),
                      SizedBox(height: widget.isMobile ? 30.h : 30),
                      StoryBlock(
                        isMobile: widget.isMobile,
                        isBackgroundColor: state.isBackgroundColorWhite,
                        story:
                            '이 구현의 핵심은 "필요한 시점에, 필요한 만큼만" 캐싱하는 것입니다.\n\n'
                            'Dio Cache처럼 앱 전역에 걸쳐 캐시를 유지하는 것이 아니라,\n'
                            '`_loadMarkers` 함수가 실행되는 동안에만 유효한 지역 캐시(iconCache)를 사용합니다.\n\n'
                            '만약 지도에 100개의 카페 마커가 있다면, `OverlayImage.fromWidget`은 단 한 번만 호출되고,\n'
                            '나머지 99개는 메모리에 이미 생성된 객체를 재사용합니다.\n\n'
                            '이 간단한?? 최적화만으로... 디자이너가 좋아했습니다.\n(디자이너 : 팀장님 우리 지도 엄청 부드러워졌는데요??)',
                      ),
                      SizedBox(height: widget.isMobile ? 250.h : 250),
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
