import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'mobile_service_data.dart';
import 'mobile_service_card.dart';

class MobileServiceView extends StatefulWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const MobileServiceView({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  State<MobileServiceView> createState() => _MobileServiceViewState();
}

class _MobileServiceViewState extends State<MobileServiceView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<MobileServiceData> services = const [
    MobileServiceData(
      title: 'Pick',
      description: '궁금한 Service 파일을 선택해주세요',
      features: [
        '',
        '',
        '핵심 기능과 설명을 상세히 볼 수 있습니다.',
        '- 함수를 구현하는 Cubit과 Service파일은 독립적인 관계입니다.',
      ],
    ),
    MobileServiceData(
      title: 'IsarInitService',
      description: 'Isar 로컬 데이터베이스 초기화',
      features: [
        '핵심 스키마 적용\n  앱버전, 네이버맵 버전, 데이터, 카테고리, 검색기록, 최근 방문',
        '데이터베이스 파일 경로 설정',
        '로컬 데이터 관리 최적화',
      ],
    ),
    MobileServiceData(
      title: 'LocationService',
      description: 'GPS 위치 기반 서비스',
      features: [
        '위치 권한 확인/요청: checkLocationPermission()',
        'GPS 서비스 상태 확인: checkGpsService()',
        '현재 위치 획득: getCurrentLocation()',
        '위치 권한 다이얼로그 표시: showDialogWithLocationPermission()',
      ],
    ),
    MobileServiceData(
      title: 'KakaoApiService',
      description: '카카오 API 연동 서비스',
      features: [
        '비즈니스 검색: searchBusinesses()',
        'REST API 키 기반 인증',
        '카카오 장소 검색 API 호출',
        '실시간 위치 기반 검색',
      ],
    ),
    MobileServiceData(
      title: 'AppVersionService',
      description: '앱 버전 관리 서비스',
      features: [
        '버전 조회: getAppVersionWithIsar()',
        '기본 버전 "1.0.0" 설정',
        '앱 업데이트 체크',
        '버전 호환성 관리',
      ],
    ),
    MobileServiceData(
      title: 'AffiliatedStoreRemoteService',
      description: '제휴 매장 관리 서비스',
      features: [
        '제휴 매장 조회: getAffiliatedStores()',
        '캐시 메모리 및 페이지네이션 지원',
        '매장 정보 실시간 업데이트',
        '네트워크 최적화',
      ],
    ),
    MobileServiceData(
      title: 'CartRemoteService',
      description: '장바구니 관리 서비스',
      features: [
        '장바구니 조회: getMyCartWithDio()',
        '사이드 메뉴 추천: getRecommendedSideMenu()',
        '주문 상태 관리',
        '실시간 동기화',
      ],
    ),
    MobileServiceData(
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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Text(
            '누구나 구현하는 UI\n나의 강점은 Service파일로부터',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: 250.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset('assets/Images/ifsai_img/web_project_4.png'),
            ),
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              Text(
                'Cubit을 도와주는 최고의 기술.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'UI와 계산을 도와주는 함수, 앱을 서포트하는 서비스의 조합.\n'
                '싱글톤 패턴을 기반으로 구성되어 있어 어느 위치에서든\n'
                '필요한 기능에 접근할 수 있습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                '- 함수를 구현하는 Cubit과 Service파일은 독립적인 관계입니다.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          _buildTabBar(),
          SizedBox(height: 20.h),
          SizedBox(
            height: 300.h,
            child: TabBarView(
              controller: _tabController,
              children:
                  services
                      .map((service) => MobileServiceCard(service: service))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      width: double.infinity,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withValues(alpha: 0.6),
        indicatorColor: Colors.white,
        indicatorWeight: 2.h,
        labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
        tabs: services.map((service) => Tab(text: service.title)).toList(),
      ),
    );
  }
}
