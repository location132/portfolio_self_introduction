import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

// 공유 MemCacheStore 인스턴스 생성
final sharedMemCacheStore = MemCacheStore();

// 캐시 설정 중요도 낮음
final cacheOptionsLow = CacheOptions(
  store: sharedMemCacheStore, // 공유 메모리 캐시 저장소 사용
  policy: CachePolicy.forceCache, // 캐시 우선 정책
  maxStale: const Duration(hours: 10), // 10시간 동안 캐시 설정
  hitCacheOnErrorExcept: [401, 403], // 인증 오류 제외
  keyBuilder: CacheOptions.defaultCacheKeyBuilder, // 캐시 키 생성
);

// 캐시 설정 없음(새로고침 용)
final cacheOptionsNoCache = CacheOptions(
  store: sharedMemCacheStore, // 공유 메모리 캐시 저장소 사용
  policy: CachePolicy.refreshForceCache, // 새로고침 후 캐쉬에 저장
  maxStale: const Duration(hours: 10), // 10시간 동안 캐시 설정
  hitCacheOnErrorExcept: [401, 403], // 인증 오류 제외
  keyBuilder: CacheOptions.defaultCacheKeyBuilder, // 캐시 키 생성
);

// 캐시 설정 10초 새로고침 자주 일어나야하는 부분
final setupDioWithFrequentCache = CacheOptions(
  store: sharedMemCacheStore, // 공유 메모리 캐시 저장소 사용
  policy: CachePolicy.forceCache,
  maxStale: const Duration(seconds: 5), // 5초 동안 캐시 설정
  hitCacheOnErrorExcept: [401, 403], // 인증 오류 제외
  keyBuilder: CacheOptions.defaultCacheKeyBuilder, // 캐시 키 생성
);

// 20분 주기 캐시 설정
final cacheOptions10Minutes = CacheOptions(
  store: sharedMemCacheStore, // 공유 메모리 캐시 저장소 사용
  policy: CachePolicy.forceCache, // 새로고침 후 캐시에 저장
  maxStale: const Duration(minutes: 20), // 10분 동안 캐시 설정
  hitCacheOnErrorExcept: [401, 403], // 인증 오류 제외
  keyBuilder: CacheOptions.defaultCacheKeyBuilder, // 캐시 키 생성
);

Future<Dio> setupDio(useCache) async {
  final dio = Dio();

  if (useCache == 0) {
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptionsLow));
  } else if (useCache == 1) {
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptionsNoCache));
  } else if (useCache == 2) {
    dio.interceptors
        .add(DioCacheInterceptor(options: setupDioWithFrequentCache));
  } else if (useCache == 3) {
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions10Minutes));
  }

  return dio;
}

// 모든 메모리 캐시 초기화 함수
Future<void> clearAllMemoryCache() async {
  await sharedMemCacheStore.clean();
}
