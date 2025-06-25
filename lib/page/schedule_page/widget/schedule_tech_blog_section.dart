import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleTechBlogSection extends StatelessWidget {
  final bool isMobile;

  const ScheduleTechBlogSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? _buildMobileTechBlogSection()
        : _buildDesktopTechBlogSection();
  }

  Widget _buildDesktopTechBlogSection() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Text(
              '곧 업로드됩니다.\nFLutter 기술 블로그',
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
              '다른 블로그와 다르게 개념 20%, 프로젝트에 적용하며 직접 구현한 기술 80%로 이루어진\n기술블로그의 다음 이야기가 곧 업로드됩니다.',
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
                  _buildTechBlogScheduleItem(
                    '6월 30일 22:00',
                    '9번 ~ 13번 포스트 (업로드 중입니다.)',
                    [
                      '9. Isar 로컬 NoSQL DB (업로드 완료)',
                      '10. SharedPreferences & Flutter Secure Storage 로컬 캐싱',
                      '11. MemoryCache & Dio Cache Interceptor - 메모리 및 네트워크 캐싱',
                      '12. 네이버 로그인',
                      '13. 카카오 로그인',
                    ],
                    isGreen: true,
                  ),
                  _buildTechBlogScheduleItem('7월 1일', '14번 ~ 17번 포스트', [
                    '14. 화면 전환 (네비게이터)',
                    '15. Flutter 밑줄 선 (한글에서 안깨지는 방법)',
                    '16. 배경화면 블러처리, 패딩 제거',
                    '17. 네트워크 이미지 사용방법 (심화 x, 기초)',
                  ]),
                  _buildTechBlogScheduleItem('7월 5일', '18번 ~ 24번 포스트', [
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
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileTechBlogSection() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
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
              '다른 블로그와 다르게 개념 20%, 프로젝트에 적용하며 직접 구현한 기술 80%로 이루어진\n기술블로그의 다음 이야기가 곧 업로드됩니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTechBlogScheduleItemMobile(
                    '6월 30일 22:00',
                    '9번 ~ 13번 포스트(업로드 중입니다.)',
                    [
                      '9. Isar 로컬 NoSQL DB(업로드 완료)',
                      '10. SharedPreferences & Flutter Secure Storage 로컬 캐싱',
                      '11. MemoryCache & Dio Cache Interceptor - 메모리 및 네트워크 캐싱',
                      '12. 네이버 로그인',
                      '13. 카카오 로그인',
                    ],
                    isGreen: true,
                  ),
                  _buildTechBlogScheduleItemMobile('7월 1일', '14번 ~ 17번 포스트', [
                    '14. 화면 전환 (네비게이터)',
                    '15. Flutter 밑줄 선 (한글에서 안깨지는 방법)',
                    '16. 배경화면 블러처리, 패딩 제거',
                    '17. 네트워크 이미지 사용방법 (심화 x, 기초)',
                  ]),
                  _buildTechBlogScheduleItemMobile('7월 5일', '18번 ~ 24번 포스트', [
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
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTechBlogScheduleItem(
    String date,
    String title,
    List<String> posts, {
    bool isLast = false,
    bool isGreen = false,
  }) {
    final backgroundColor =
        isGreen ? Colors.green.shade600 : Colors.grey.shade600;
    final bulletColor = isGreen ? Colors.green.shade400 : Colors.grey.shade400;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
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
                              color: bulletColor,
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
    bool isGreen = false,
  }) {
    final backgroundColor =
        isGreen ? Colors.green.shade600 : Colors.grey.shade600;
    final bulletColor = isGreen ? Colors.green.shade400 : Colors.grey.shade400;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: backgroundColor,
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
                              color: bulletColor,
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
