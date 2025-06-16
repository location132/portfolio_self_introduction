import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/background/background_feature_card.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/background/animation/background_grid_animation.dart';

class BackgroundFeaturesGrid extends StatefulWidget {
  final bool isBackgroundFeatureVisible;
  const BackgroundFeaturesGrid({
    super.key,
    required this.isBackgroundFeatureVisible,
  });

  @override
  State<BackgroundFeaturesGrid> createState() => _BackgroundFeaturesGridState();
}

class _BackgroundFeaturesGridState extends State<BackgroundFeaturesGrid>
    with TickerProviderStateMixin {
  late BackgroundGridAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animation = BackgroundGridAnimation();
    _animation.initialize(this);
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void _handleToggle() {
    setState(() {
      _animation.toggleExpanded();
    });
  }

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'title': '앱 시작 시 자동 초기화',
        'subtitle': '시스템 환경 설정 & 외부 서비스',
        'icon': Icons.settings_applications,
        'features': [
          '환경 변수 로드: API 키, 서버 URL 등 민감한 정보 백그라운드 불러오기',
          '화면 방향 고정: 세로 모드 전용 시스템 설정 변경',
          '보안 검사: 루팅/탈옥 기기 백그라운드 확인',
          '네이버 지도 SDK 준비: 지도 서비스 인증 및 초기화 작업',
          '카카오 SDK 준비: 카카오 로그인 및 지도 검색 API 초기화',
          '의존성 주입 시스템 구축: 앱 전체 서비스들을 메모리에 등록',
        ],
      },
      {
        'title': '데이터베이스 관리',
        'subtitle': 'Isar 로컬 DB & 버전 관리',
        'icon': Icons.storage,
        'features': [
          '데이터베이스 파일 생성: 앱 전용 로컬 DB 기기 저장소 설정',
          '스키마 등록: 앱 버전, 네이버 맵 데이터, 카테고리 테이블 구조 생성',
          '앱 버전 체크: 현재 버전 로컬 저장 및 업데이트 필요성 확인',
          '네이버 맵 데이터 버전 관리: 서버와 로컬 버전 비교하여 동기화 필요성 판단',
          '매장 데이터 업데이트: 서버 최신 제휴 매장 정보 로컬 저장',
          '카테고리 정보 갱신: 매장 카테고리 정보 추출하여 중복 제거 후 저장',
        ],
      },
      {
        'title': '위치 서비스 관리',
        'subtitle': '권한 모니터링 & 위치 정보',
        'icon': Icons.location_on,
        'features': [
          '위치 권한 확인: 사용자 위치 정보 사용 허용 백그라운드 확인',
          'GPS 상태 감지: 기기 GPS 활성화 상태 지속적 모니터링',
          '권한 요청 준비: 필요시 사용자에게 권한 요청할 수 있도록 준비',
          '현재 위치 획득: 사용자 현재 위치 백그라운드 정확 측정',
          '위치 정확도 설정: 배터리 효율성과 정확도 균형 맞춘 위치 설정 적용',
          '위치 기반 거리 계산: 사용자 위치와 매장 간 거리 자동 계산',
        ],
      },
      {
        'title': '검색 기능 처리',
        'subtitle': '검색 기록 & 인기 검색어',
        'icon': Icons.search,
        'features': [
          '로컬 검색 기록 저장: 사용자 검색 키워드 기기 자동 저장 (최대 10개)',
          '검색 기록 자동 정리: 오래된 검색 기록 자동 삭제로 저장 공간 관리',
          '검색 패턴 분석: 사용자 검색 패턴 분석하여 개인화된 서비스 제공',
          '실시간 인기 검색어 수집: 서버에서 현재 인기 검색어 목록 백그라운드 수집',
          '연관 검색어 생성: 입력 글자에 따른 연관 검색어 실시간 제공',
          '검색 결과 캐싱: 자주 검색되는 결과 미리 캐싱하여 빠른 응답 제공',
        ],
      },
      {
        'title': '네이버 맵 처리',
        'subtitle': '지도 데이터 & 렌더링 최적화',
        'icon': Icons.map,
        'features': [
          '매장 위치 정보 로딩: 모든 제휴 매장 위치 정보 백그라운드 미리 로딩',
          '카테고리별 분류: 매장 카테고리별 자동 분류로 필터링 기능 준비',
          '마커 아이콘 생성: 각 카테고리별 마커 아이콘 미리 생성하여 메모리 준비',
          '마커 클러스터링: 매장 밀집 지역 성능 최적화 마커 그룹화',
          '지도 애니메이션 준비: 부드러운 지도 이동과 줌 효과 애니메이션 설정',
          '오버레이 관리: 지도 위 표시되는 다양한 정보들을 효율적으로 관리',
        ],
      },
      {
        'title': '사용자 인증 관리',
        'subtitle': '토큰 관리 & 프로필 동기화',
        'icon': Icons.security,
        'features': [
          '보안 저장소 활용: 민감한 인증 토큰 암호화된 저장소 안전 보관',
          '토큰 자동 갱신: 토큰 만료 전 자동 갱신으로 끊김 없는 서비스 제공',
          '세션 유지: 앱 다시 실행해도 로그인 상태 유지할 수 있도록 관리',
          '프로필 정보 캐싱: 사용자 프로필 사진, 이메일, 학생 여부 로컬 캐싱',
          '상태 변경 감지: 사용자 정보 변경사항을 실시간으로 반영',
          '오프라인 모드 지원: 네트워크 없어도 기본 프로필 정보 표시 가능',
        ],
      },
      {
        'title': '장바구니 동기화',
        'subtitle': '장바구니 관리 & 메뉴 옵션',
        'icon': Icons.shopping_cart,
        'features': [
          '실시간 장바구니 개수 업데이트: 상품 추가/삭제 시마다 개수 자동 갱신',
          '서버 동기화: 로컬 장바구니 정보와 서버 정보 주기적 동기화',
          '추천 시스템: 사용자 장바구니 내용 분석하여 관련 상품 추천',
          '메뉴 옵션 정보 캐싱: 메뉴별 옵션 정보 미리 로딩으로 빠른 선택',
          '가격 계산: 옵션 선택에 따른 가격 변동 실시간 계산',
          '재고 상태 확인: 메뉴 및 옵션 판매 가능 여부 백그라운드 확인',
        ],
      },
      {
        'title': '성능 최적화',
        'subtitle': '메모리 관리 & 네트워크 최적화',
        'icon': Icons.speed,
        'features': [
          '이미지 캐싱: 자주 사용되는 이미지 메모리 캐싱으로 로딩 속도 향상',
          '데이터 압축: 네트워크 전송량 줄이기 위한 데이터 압축 처리',
          '메모리 정리: 사용하지 않는 리소스 자동 해제로 메모리 효율성 향상',
          'API 요청 큐잉: 여러 API 요청 효율적 관리로 서버 부하 분산',
          '캐시 전략: 자주 사용되는 데이터는 캐시에서 불러와 네트워크 사용량 절약',
          '재시도 메커니즘: 네트워크 오류 시 자동 재시도로 안정성 향상',
        ],
      },
      {
        'title': '서버 상태 모니터링',
        'subtitle': '연결 상태 확인 & 에러 처리',
        'icon': Icons.monitor_heart,
        'features': [
          '서버 접속 체크: 앱 시작 시 서버 정상 작동 백그라운드 확인',
          '점검 상태 감지: 서버 점검 중인지 확인하여 사용자 적절한 안내 제공',
          '네트워크 품질 측정: 사용자 네트워크 상태에 따른 데이터 로딩 전략 조정',
          '자동 오류 복구: 일시적 네트워크/서버 오류 시 자동 복구 시도',
          '오류 로깅: 발생한 오류들을 기록하여 향후 개선에 활용',
          '사용자 경험 보호: 오류 상황에서도 앱이 중단되지 않도록 안전장치 적용',
        ],
      },
    ];

    final visibleFeatures =
        _animation.isExpanded ? features : features.take(6).toList();

    return WidgetAnimation(
      isStart: widget.isBackgroundFeatureVisible,
      duration: 1000,
      beginDy: 0.05,
      child: Stack(
        children: [
          Column(
            children: [
              for (
                int row = 0;
                row < (visibleFeatures.length / 3).ceil();
                row++
              )
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int col = 0; col < 3; col++)
                        if (row * 3 + col < visibleFeatures.length)
                          Padding(
                            padding: EdgeInsets.only(right: col < 2 ? 24 : 0),
                            child: _animation.buildAnimatedCard(
                              child: BackgroundFeatureCard(
                                title:
                                    visibleFeatures[row * 3 + col]['title']
                                        as String,
                                subtitle:
                                    visibleFeatures[row * 3 + col]['subtitle']
                                        as String,
                                icon:
                                    visibleFeatures[row * 3 + col]['icon']
                                        as IconData,
                                features:
                                    visibleFeatures[row * 3 + col]['features']
                                        as List<String>,
                              ),
                              row: row,
                              shouldAnimate:
                                  _animation.isExpanded ? row >= 2 : false,
                            ),
                          ),
                    ],
                  ),
                ),

              const SizedBox(height: 24),
              _animation.buildExpandButton(onTap: _handleToggle),
            ],
          ),

          _animation.buildGradientOverlay(),
        ],
      ),
    );
  }
}
