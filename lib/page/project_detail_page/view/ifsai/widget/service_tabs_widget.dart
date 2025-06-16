import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/animation/service_tab_animation.dart';

class ServiceData {
  final String title;
  final String description;
  final List<String> features;

  const ServiceData({
    required this.title,
    required this.description,
    required this.features,
  });
}

class ServiceTabsWidget extends StatefulWidget {
  final bool isServiceTabVisible;
  const ServiceTabsWidget({super.key, required this.isServiceTabVisible});

  @override
  State<ServiceTabsWidget> createState() => _ServiceTabsWidgetState();
}

class _ServiceTabsWidgetState extends State<ServiceTabsWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ServiceTabAnimation _serviceTabAnimation;

  final List<ServiceData> services = const [
    ServiceData(
      title: 'Pick',
      description: '궁금한 Service 파일을 선택해주세요',
      features: [
        '',
        '',
        '핵심 기능과 설명을 상세히 볼 수 있습니다.',
        '- 함수를 구현하는 Cubit과 Service파일은 독립적인 관계입니다.',
      ],
    ),
    ServiceData(
      title: 'IsarInitService',
      description: 'Isar 로컬 데이터베이스 초기화',
      features: [
        '핵심 스키마 적용\n  앱버전, 네이버맵 버전, 데이터, 카테고리, 검색기록, 최근 방문',
        '데이터베이스 파일 경로 설정',
        '로컬 데이터 관리 최적화',
      ],
    ),
    ServiceData(
      title: 'LocationService',
      description: 'GPS 위치 기반 서비스',
      features: [
        '위치 권한 확인/요청: checkLocationPermission()',
        'GPS 서비스 상태 확인: checkGpsService()',
        '현재 위치 획득: getCurrentLocation()',
        '위치 권한 다이얼로그 표시: showDialogWithLocationPermission()',
      ],
    ),
    ServiceData(
      title: 'KakaoApiService',
      description: '카카오 API 연동 서비스',
      features: [
        '비즈니스 검색: searchBusinesses()',
        'REST API 키 기반 인증',
        '카카오 장소 검색 API 호출',
        '실시간 위치 기반 검색',
      ],
    ),
    ServiceData(
      title: 'AppVersionService',
      description: '앱 버전 관리 서비스',
      features: [
        '버전 조회: getAppVersionWithIsar()',
        '기본 버전 "1.0.0" 설정',
        '앱 업데이트 체크',
        '버전 호환성 관리',
      ],
    ),
    ServiceData(
      title: 'AffiliatedStoreRemoteService',
      description: '제휴 매장 관리 서비스',
      features: [
        '제휴 매장 조회: getAffiliatedStores()',
        '캐시 메모리 및 페이지네이션 지원',
        '매장 정보 실시간 업데이트',
        '네트워크 최적화',
      ],
    ),
    ServiceData(
      title: 'CartRemoteService',
      description: '장바구니 관리 서비스',
      features: [
        '장바구니 조회: getMyCartWithDio()',
        '사이드 메뉴 추천: getRecommendedSideMenu()',
        '주문 상태 관리',
        '실시간 동기화',
      ],
    ),
    ServiceData(
      title: 'MenuOptionRemoteService',
      description: '메뉴 옵션 관리 서비스',
      features: [
        '메뉴 옵션 조회: menusOptions()',
        '장바구니 옵션 수정: putMyCartOption()',
        '커스텀 옵션 처리',
        'API 상태 관리',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: services.length, vsync: this);
    _serviceTabAnimation = ServiceTabAnimation();
    _serviceTabAnimation.initialize(this);

    _tabController.addListener(_onTabChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _serviceTabAnimation.startAnimation();
    });
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      _serviceTabAnimation.startAnimation();
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _serviceTabAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '누구나 구현하는 UI\n나의 강점은 Service파일로부터',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/Images/ifsai_img/web_project_4.png',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 100),

              SizedBox(
                width: 400,
                child: WidgetAnimation(
                  isStart: widget.isServiceTabVisible,
                  beginDy: 0.1,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 140),
                      Text(
                        'Cubit을 도와주는 최고의 기술.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 74),
                      Text(
                        'UI와 계산을 도와주는 함수, 앱을 서포트하는 서비스의 조합.\n'
                        '싱글톤 패턴을 기반으로 구성되어 있어 어느 위치에서든\n'
                        '필요한 기능에 접근할 수 있습니다.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 140),
                      Text(
                        '- 함수를 구현하는 Cubit과 Service파일은 독립적인 관계입니다.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          Padding(
            padding: EdgeInsets.only(
              left:
                  MediaQuery.of(context).size.width > 1200
                      ? MediaQuery.of(context).size.width * 0.2
                      : 0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withValues(alpha: 0.6),
                indicatorColor: Colors.white,
                indicatorWeight: 2,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                tabs:
                    services
                        .map((service) => Tab(text: service.title))
                        .toList(),
              ),
            ),
          ),
          const SizedBox(height: 40),

          SizedBox(
            width: 800,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children:
                  services
                      .map((service) => _buildServiceCard(service))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(ServiceData service) {
    return FadeTransition(
      opacity: _serviceTabAnimation.fadeAnimation,
      child:
          service.title == 'Pick'
              ? _buildPickCard(service)
              : _buildNormalCard(service),
    );
  }

  Widget _buildPickCard(ServiceData service) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          service.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        Text(
          service.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 16,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 30),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
              service.features
                  .where((feature) => feature.isNotEmpty)
                  .map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        feature,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildNormalCard(ServiceData service) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            service.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            service.description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 30),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    service.features
                        .map(
                          (feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  margin: const EdgeInsets.only(
                                    top: 8,
                                    right: 12,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '• $feature',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
