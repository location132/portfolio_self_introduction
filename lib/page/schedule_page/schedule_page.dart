import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_cubit.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ScheduleCubit>()..initializePage(),
      child: const _ScheduleView(),
    );
  }
}

class _ScheduleView extends StatelessWidget {
  const _ScheduleView();

  @override
  Widget build(BuildContext context) {
    final isMobile = MainService().isMobileDevice();
    final width = MediaQuery.of(context).size.width;
    final deviceType = MainService().setScreenSize(width);

    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    TopNavBar(
                      deviceType: deviceType,
                      onPressed:
                          () => context.read<ScheduleCubit>().toggleMenu(),
                      onHomePressed: () {},
                      isMenuClicked: state.isMenuClicked,
                    ),

                    if (isMobile)
                      _buildMobileContent(context)
                    else
                      _buildDesktopContent(context),
                  ],
                ),
              ),

              if (isMobile) MenuScreen(isMenuClicked: state.isMenuClicked),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),

            const Text(
              '포트폴리오 웹사이트 리모델링과 함께\n더욱 많은 프로젝트들을 소개하겠습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 60),

            const Text(
              '현재는 잎사이 프로젝트만 자세한 프로젝트를 보실 수 있습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey, height: 1.6),
            ),
            const SizedBox(height: 40),

            _buildIfsaiProjectButton(context),
            const SizedBox(height: 80),

            _buildTechBlogSection(),
            const SizedBox(height: 80),

            _buildProjectOpenSection(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),

            Text(
              '포트폴리오 웹사이트 리모델링과 함께\n더욱 많은 프로젝트 그리고 기술블로그를 소개하겠습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            SizedBox(height: 40.h),

            Text(
              '현재는 잎사이 프로젝트만 자세한 프로젝트를 보실 수 있습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                height: 1.6,
              ),
            ),
            SizedBox(height: 30.h),

            _buildIfsaiProjectButtonMobile(context),
            SizedBox(height: 60.h),

            _buildTechBlogSectionMobile(),
            SizedBox(height: 60.h),

            _buildProjectOpenSectionMobile(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildIfsaiProjectButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.purple.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.pushNamed(context, '/ifsai');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: Column(
              children: [
                const Text(
                  '신입인데 강력한 퍼포먼스를 보실 수 있는',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                const Text(
                  '잎사이 프로젝트 링크',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIfsaiProjectButtonMobile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.purple.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            Navigator.pushNamed(context, '/ifsai');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  '신입인데 강력한 퍼포먼스를 보실 수 있는',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp, color: Colors.white70),
                ),
                SizedBox(height: 6.h),
                Text(
                  '잎사이 프로젝트 링크',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechBlogSection() {
    return Column(
      children: [
        const Text(
          '곧 오픈됩니다.\n기술 블로그',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          '다른 블로그와 다르게 개념 20퍼센트, 내 기술 80퍼센트로 이루어진\n기술블로그의 다음 이야기가 업로드됩니다.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.6),
        ),
        const SizedBox(height: 40),

        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTechBlogScheduleItem('6월 25일 22:00', '9번 ~ 13번 포스트', [
                '9. Isar 로컬 NoSQL DB',
                '10. SharedPreferences & Flutter Secure Storage 로컬 캐싱',
                '11. MemoryCache & Dio Cache Interceptor - 메모리 및 네트워크 캐싱',
                '12. 네이버 로그인',
                '13. 카카오 로그인',
              ]),
              _buildTechBlogScheduleItem('6월 28일', '14번 ~ 17번 포스트', [
                '14. 화면 전환 (네비게이터)',
                '15. Flutter 밑줄 선 (한글에서 안깨지는 방법)',
                '16. 배경화면 블러처리, 패딩 제거',
                '17. 네트워크 이미지 사용방법 (심화 x, 기초)',
              ]),
              _buildTechBlogScheduleItem('7월 2일', '18번 ~ 24번 포스트', [
                '18. 카카오 맵 사용방법',
                '19. 자동 스크롤 (글로벌키, 고정 스크롤)',
                '20. 다이아로그 함수 (Page-view)',
                '21. 랜덤 함수',
                '22. 부모 위젯 사이즈 설정(x) 자식이 따라가기',
                '23. 부모위젯 최소 자유 최대 x',
                '24. 서버와 연결 (쿠키, secure_storage, dio)',
              ]),
              _buildTechBlogScheduleItem('7월 7일', '25번 ~ 32번 포스트', [
                '25. Flutter 생명주기 정리',
                '26. 서버 데이터 가공 연습',
                '27. 스크롤 관련',
                '28. FutureBuilder',
                '29. 바텀 모달시트',
                '30. 드롭다운 버튼',
                '31. 날짜 변환',
                '32. 하이브 로컬 저장',
              ]),
              _buildTechBlogScheduleItem('7월 10일', '33번 ~ 42번 포스트', [
                '33. 다이나믹 아일랜드',
                '34. 아이콘 클릭 이벤트 애니메이션',
                '35. Flutter 화면 스크롤 감지',
                '36. PopupMenuButton',
                '37. CachedNetworkImage',
                '38. dio 캐시 처리',
                '39. 캘린더 라이브러리',
                '40. NaverMap with Flutter',
                '41. 바텀 네비게이션 바 (구글)',
                '42. 물결 애니메이션',
              ], isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechBlogSectionMobile() {
    return Column(
      children: [
        Text(
          '곧 오픈됩니다.\n기술 블로그',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          '다른 블로그와 다르게 개념 20퍼센트, 내 기술 80퍼센트로 이루어진\n기술블로그의 다음 이야기가 업로드됩니다.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey, height: 1.6),
        ),
        SizedBox(height: 30.h),

        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTechBlogScheduleItemMobile('6월 25일 22:00', '9번 ~ 13번 포스트', [
                '9. Isar 로컬 NoSQL DB',
                '10. SharedPreferences & Flutter Secure Storage 로컬 캐싱',
                '11. MemoryCache & Dio Cache Interceptor - 메모리 및 네트워크 캐싱',
                '12. 네이버 로그인',
                '13. 카카오 로그인',
              ]),
              _buildTechBlogScheduleItemMobile('6월 28일', '14번 ~ 17번 포스트', [
                '14. 화면 전환 (네비게이터)',
                '15. Flutter 밑줄 선 (한글에서 안깨지는 방법)',
                '16. 배경화면 블러처리, 패딩 제거',
                '17. 네트워크 이미지 사용방법 (심화 x, 기초)',
              ]),
              _buildTechBlogScheduleItemMobile('7월 2일', '18번 ~ 24번 포스트', [
                '18. 카카오 맵 사용방법',
                '19. 자동 스크롤 (글로벌키, 고정 스크롤)',
                '20. 다이아로그 함수 (Page-view)',
                '21. 랜덤 함수',
                '22. 부모 위젯 사이즈 설정(x) 자식이 따라가기',
                '23. 부모위젯 최소 자유 최대 x',
                '24. 서버와 연결 (쿠키, secure_storage, dio)',
              ]),
              _buildTechBlogScheduleItemMobile('7월 7일', '25번 ~ 32번 포스트', [
                '25. Flutter 생명주기 정리',
                '26. 서버 데이터 가공 연습',
                '27. 스크롤 관련',
                '28. FutureBuilder',
                '29. 바텀 모달시트',
                '30. 드롭다운 버튼',
                '31. 날짜 변환',
                '32. 하이브 로컬 저장',
              ]),
              _buildTechBlogScheduleItemMobile('7월 10일', '33번 ~ 42번 포스트', [
                '33. 다이나믹 아일랜드',
                '34. 아이콘 클릭 이벤트 애니메이션',
                '35. Flutter 화면 스크롤 감지',
                '36. PopupMenuButton',
                '37. CachedNetworkImage',
                '38. dio 캐시 처리',
                '39. 캘린더 라이브러리',
                '40. NaverMap with Flutter',
                '41. 바텀 네비게이션 바 (구글)',
                '42. 물결 애니메이션',
              ], isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectOpenSection() {
    return Column(
      children: [
        const Text(
          '잎사이 프로젝트처럼 화려하게.\n신입이라고는 생각할 수 없는 디자인과 퍼포먼스를 가진\n프로젝트 페이지가 곧 오픈됩니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 50),

        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: Column(
            children: [
              _buildProjectScheduleItem(
                '7월 16일',
                'NaverMap',
                '서비스 패턴과 클러스터링, 오버레이와 최적화까지. 곧 찾아뵙겠습니다',
              ),
              _buildProjectScheduleItem(
                '8월 20일',
                'KLANG',
                '16명의 다른 전공을 가진 팀원들과 하나의 팀으로.\n커뮤니케이션의 능력과 협업 능력을 올려준 프로젝트 8월 20일에 오픈됩니다.',
              ),
              _buildProjectScheduleItem(
                '9월 14일',
                '구름 × 카카오 × 인프런',
                '웹과 앱 그리고 서버개발자가 하나의 팀으로.\n부트캠프에서 우수상까지 올라간 나의 Flutter 첫 프로젝트. 9월 14일에 오픈됩니다.',
              ),
              _buildProjectScheduleItem(
                '10월 1일',
                'Flutter Web',
                'Flutter로 웹과 웹앱 서로 단순한 반응형을 넘어 다른 서로 다른 스타일의 화면을\n가지고 있는 첫 Flutter 웹프로젝트 10월 1일에 오픈됩니다.',
              ),
              _buildProjectScheduleItem(
                '10월 7일',
                'Rive Animation',
                'Flutter 개발자가 Rive애니메이션까지?\n직접만든 Rive 애니메이션 10월 7일에 오픈됩니다.',
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectOpenSectionMobile() {
    return Column(
      children: [
        Text(
          '잎사이 프로젝트처럼 화려하게.\n신입이라고는 생각할 수 없는 디자인과 퍼포먼스를 가진\n프로젝트 페이지가 곧 오픈됩니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        SizedBox(height: 30.h),

        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: Column(
            children: [
              _buildProjectScheduleItemMobile(
                '7월 16일',
                'NaverMap',
                '서비스 패턴과 클러스터링, 오버레이와 최적화까지. 곧 찾아뵙겠습니다',
              ),
              _buildProjectScheduleItemMobile(
                '8월 20일',
                'KLANG',
                '16명의 다른 전공을 가진 팀원들과 하나의 팀으로.\n커뮤니케이션의 능력과 협업 능력을 올려준 프로젝트 8월 20일에 오픈됩니다.',
              ),
              _buildProjectScheduleItemMobile(
                '9월 14일',
                '구름 × 카카오 × 인프런',
                '웹과 앱 그리고 서버개발자가 하나의 팀으로.\n부트캠프에서 우수상까지 올라간 나의 Flutter 첫 프로젝트. 9월 14일에 오픈됩니다.',
              ),
              _buildProjectScheduleItemMobile(
                '10월 1일',
                'Flutter Web',
                'Flutter로 웹과 웹앱 서로 단순한 반응형을 넘어 다른 서로 다른 스타일의 화면을\n가지고 있는 첫 Flutter 웹프로젝트 10월 1일에 오픈됩니다.',
              ),
              _buildProjectScheduleItemMobile(
                '10월 7일',
                'Rive Animation',
                'Flutter 개발자가 Rive애니메이션까지?\n직접만든 Rive 애니메이션 10월 7일에 오픈됩니다.',
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleItem(String date, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItemMobile(String date, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectScheduleItem(
    String date,
    String title,
    String description, {
    bool isLast = false,
  }) {
    String _getProjectImage(String title) {
      switch (title) {
        case 'NaverMap':
          return 'assets/Images/project_img/naver_map_1.png';
        case 'KLANG':
          return 'assets/Images/project_img/Klang_1.png';
        case '구름 × 카카오 × 인프런':
          return 'assets/Images/project_img/groom_1.png';
        case 'Flutter Web':
          return 'assets/Images/project_img/web_project_1.png';
        case 'Rive Animation':
          return 'assets/Images/project_img/rive_flutter.png';
        default:
          return 'assets/Images/project_img/rive_flutter.png';
      }
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                date,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            _ProjectThumbnail(title: title),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProjectScheduleItemMobile(
    String date,
    String title,
    String description, {
    bool isLast = false,
  }) {
    String _getProjectImage(String title) {
      switch (title) {
        case 'NaverMap':
          return 'assets/Images/project_img/naver_map_1.png';
        case 'KLANG':
          return 'assets/Images/project_img/Klang_1.png';
        case '구름 × 카카오 × 인프런':
          return 'assets/Images/project_img/groom_1.png';
        case 'Flutter Web':
          return 'assets/Images/project_img/web_project_1.png';
        case 'Rive Animation':
          return 'assets/Images/project_img/rive_flutter.png';
        default:
          return 'assets/Images/project_img/rive_flutter.png';
      }
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.w,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            _ProjectThumbnailMobile(title: title),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildTechBlogScheduleItem(
    String date,
    String title,
    List<String> posts, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                date,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...posts.map(
                    (post) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            margin: const EdgeInsets.only(top: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Colors.green.shade400,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              post,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTechBlogScheduleItemMobile(
    String date,
    String title,
    List<String> posts, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ...posts.map(
                    (post) => Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 3.w,
                            height: 3.h,
                            margin: EdgeInsets.only(top: 6.h, right: 6.w),
                            decoration: BoxDecoration(
                              color: Colors.green.shade400,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              post,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.grey,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) SizedBox(height: 24.h),
      ],
    );
  }
}

class _ProjectThumbnail extends StatefulWidget {
  final String title;

  const _ProjectThumbnail({required this.title});

  @override
  State<_ProjectThumbnail> createState() => _ProjectThumbnailState();
}

class _ProjectThumbnailState extends State<_ProjectThumbnail> {
  bool _isHovered = false;
  int _gifInstanceKey = 0;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (isHovered && widget.title == 'NaverMap') {
        _gifInstanceKey++;
      }
    });
  }

  String _getImagePath(bool isHovered) {
    switch (widget.title) {
      case 'NaverMap':
        return isHovered
            ? 'assets/Images/project_img/naver_map_2.gif'
            : 'assets/Images/project_img/naver_map_1.png';
      case 'KLANG':
        return isHovered
            ? 'assets/Images/project_img/Klang_2.png'
            : 'assets/Images/project_img/Klang_1.png';
      case '구름 × 카카오 × 인프런':
        return isHovered
            ? 'assets/Images/project_img/groom_2.png'
            : 'assets/Images/project_img/groom_1.png';
      case 'Flutter Web':
        return isHovered
            ? 'assets/Images/project_img/web_project_2.png'
            : 'assets/Images/project_img/web_project_1.png';
      case 'Rive Animation':
        return 'assets/Images/project_img/rive_flutter.png';
      default:
        return 'assets/Images/project_img/rive_flutter.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: _isHovered ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(false),
                  key: ValueKey('${widget.title}_default'),
                  fit: BoxFit.contain,
                ),
              ),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(true),
                  key: ValueKey('${widget.title}_hover_$_gifInstanceKey'),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectThumbnailMobile extends StatefulWidget {
  final String title;

  const _ProjectThumbnailMobile({required this.title});

  @override
  State<_ProjectThumbnailMobile> createState() =>
      _ProjectThumbnailMobileState();
}

class _ProjectThumbnailMobileState extends State<_ProjectThumbnailMobile> {
  bool _isHovered = false;
  int _gifInstanceKey = 0;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (isHovered && widget.title == 'NaverMap') {
        _gifInstanceKey++;
      }
    });
  }

  String _getImagePath(bool isHovered) {
    switch (widget.title) {
      case 'NaverMap':
        return isHovered
            ? 'assets/Images/project_img/naver_map_2.gif'
            : 'assets/Images/project_img/naver_map_1.png';
      case 'KLANG':
        return isHovered
            ? 'assets/Images/project_img/Klang_2.png'
            : 'assets/Images/project_img/Klang_1.png';
      case '구름 × 카카오 × 인프런':
        return isHovered
            ? 'assets/Images/project_img/groom_2.png'
            : 'assets/Images/project_img/groom_1.png';
      case 'Flutter Web':
        return isHovered
            ? 'assets/Images/project_img/web_project_2.png'
            : 'assets/Images/project_img/web_project_1.png';
      case 'Rive Animation':
        return 'assets/Images/project_img/rive_flutter.png';
      default:
        return 'assets/Images/project_img/rive_flutter.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onHover(true),
      onTapUp: (_) => _onHover(false),
      onTapCancel: () => _onHover(false),
      child: Container(
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: _isHovered ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(false),
                  key: ValueKey('${widget.title}_default'),
                  fit: BoxFit.contain,
                ),
              ),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(true),
                  key: ValueKey('${widget.title}_hover_$_gifInstanceKey'),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
