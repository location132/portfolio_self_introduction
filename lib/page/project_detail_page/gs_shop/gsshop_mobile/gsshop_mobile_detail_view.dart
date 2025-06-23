import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/service/main_service.dart';
import '../gsshop_cubit.dart';
import '../gsshop_state.dart';

class GsShopMobileDetailView extends StatelessWidget {
  const GsShopMobileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<GsShopCubit>(),
      child: const _GsShopMobileDetailViewContent(),
    );
  }
}

class _GsShopMobileDetailViewContent extends StatelessWidget {
  const _GsShopMobileDetailViewContent();

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<GsShopCubit, GsShopState>(
      builder: (context, state) {
        return Stack(
          children: [
            // 검정색 배경
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
            ),

            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Navigation Bar
                    TopNavBar(
                      deviceType: deviceType,
                      isMenuClicked: state.isMenuClicked,
                      onPressed: () {
                        context.read<GsShopCubit>().toggleMenu();
                      },
                      onHomePressed: () {
                        context.go('/');
                      },
                    ),

                    // Main Content - 중앙배치 왼쪽 정렬
                    Center(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 600.w),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),

                            // Title Section
                            Text(
                              'GS Shop 검색바 개선 프로젝트',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(height: 20.h),

                            // GitHub Link
                            Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: Colors.grey[700]!),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.link, color: Colors.grey[400]),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'GitHub Repository',
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          'https://github.com/location132/GsShop-searchBar-Upgrade',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 30.h),

                            // 목표 Section
                            _buildGoalSection(),

                            SizedBox(height: 30.h),

                            // 문제 발생 Section
                            _buildProblemSection(),

                            SizedBox(height: 30.h),

                            // 문제 해결 Section
                            _buildSolutionSection(),

                            SizedBox(height: 30.h),

                            // 결과 Section
                            _buildResultSection(),

                            SizedBox(height: 30.h),

                            // 리뷰 Section
                            _buildReviewSection(),

                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGoalSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb, color: Colors.grey[400]),
              SizedBox(width: 8.w),
              Text(
                '목표',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '현업에서 활약하고 있는 개발 선배님들의 실력 따라잡기',
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '문제 발생',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          '사용자가 검색을 시도할 때, 데이터베이스에서 연관 검색어를 받아와 표시하는 과정에서 화면의 번쩍임 현상이 발생하였습니다.',
          style: TextStyle(
            fontSize: 14.sp,
            height: 1.6,
            color: Colors.grey[400],
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: Text(
            '이 문제는 사용자가 "안녕"이라는 단어를 검색할 때, \'ㅇ\', \'ㅏ\', \'ㄴ\', \'ㄴ\', \'ㅕ\', \'ㅇ\' 총 6번의 화면이 setState 되는 문제였습니다. 이로 인해 사용자는 과도한 번쩍거림 현상을 경험하게 되어 UX가 저하되는 문제가 발생하였습니다.',
            style: TextStyle(
              fontSize: 13.sp,
              height: 1.5,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSolutionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '문제 해결',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 16.h),

        // 잘못된 접근 방법
        _buildApproachCard(
          title: '❌ 잘못된 접근 방법',
          subtitle: '애니메이션 사용',
          content:
              'Flutter의 AnimatedOpacity 위젯을 사용해 연관검색어 리스트의 표시를 부드럽게 전환하려했습니다. 하지만 서버에서 값을 새로 받아왔다면 state의 생명주기 setState를 통해 새로고침하는 순간 애니메이션보다 화면의 새로고침되는 번쩍임이 우선순위였기 때문입니다.',
          backgroundColor: Colors.grey[850]!,
          borderColor: Colors.grey[700]!,
        ),

        SizedBox(height: 16.h),

        // 올바른 접근 방법
        _buildApproachCard(
          title: '✅ 올바른 접근 방법',
          subtitle: '1. 상태관리 개선',
          content:
              '검색어 입력 시 매번 화면을 갱신하는 대신 FutureBuilder와 Provider를 통해 상태 관리를 개선했습니다. 사용자가 입력한 값을 리스트에 담아 사용자가 다음 초성을 입력했을 시, 리스트에 없다면 서버에 다시 한번 요청, 리스트에 있다면 리스트안에 있는 값을 재사용해 불필요한 서버와의 연결을 최소화했습니다.',
          backgroundColor: Colors.grey[800]!,
          borderColor: Colors.grey[600]!,
        ),

        SizedBox(height: 12.h),

        _buildApproachCard(
          title: '',
          subtitle: '2. 데이터 캐싱',
          content:
              '검색어가 비어있거나 연관 검색어가 없을 경우 이전 검색어 히스토리를 표시하도록 하여 불필요한 API 호출을 줄였습니다. 이를 통해 불필요한 화면 갱신을 방지했습니다.',
          backgroundColor: Colors.grey[800]!,
          borderColor: Colors.grey[600]!,
        ),

        SizedBox(height: 12.h),

        _buildApproachCard(
          title: '',
          subtitle: '3. 생명주기 개선',
          content:
              'didChangeDependencies 메서드를 사용해 초기 로딩 상태를 제어했습니다. 초기 화면 로딩 시 _isFirstSearchBar 변수를 false로 설정해 FutureBuilder에서 로딩 상태를 정확히 관리할 수 있도록 했습니다.',
          backgroundColor: Colors.grey[800]!,
          borderColor: Colors.grey[600]!,
        ),

        SizedBox(height: 16.h),

        // 코드 예시
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter 코드 예시:',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '''@override
void didChangeDependencies() {
  super.didChangeDependencies();
  _isFirstSearchBar = false;
}

if (snapshot.connectionState == ConnectionState.waiting && _isFirstSearchBar) {
  return const SizedBox();
}''',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'monospace',
                  height: 1.4,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApproachCard({
    required String title,
    required String subtitle,
    required String content,
    required Color backgroundColor,
    required Color borderColor,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 4.h),
          ],
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 12.sp,
              height: 1.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '결과',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: Column(
            children: [
              Icon(Icons.check_circle, color: Colors.grey[400], size: 48.sp),
              SizedBox(height: 12.h),
              Text(
                '검색 시 번쩍임 현상 완전 해결',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                '사용자 경험이 크게 개선되었으며, 부드러운 검색 인터페이스를 구현했습니다.',
                style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.5,
                  color: Colors.grey[400],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '리뷰',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: Text(
            'Flutter 개발 중 너무 중요하지만 깊게 고민해보지 못했던 문제를 여러 관점에서 정말 많은 시간 고민해보았습니다.\n\n답을 알고 난 뒤에는 너무 간단하고 쉽게 접근할 수 있는 문제였지만, 그 해결 과정을 도출해내는 과정은 너무나 힘들고 괴로운 시간이었습니다. 그러나 여러 가지 관점으로 접근하고 도전하는 계기를 제공한 대기업 앱의 재해석 공부방법은 뿌듯함과 함께 한층 더 성장할 수 있는 기회를 얻을 수 있었습니다.',
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.6,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }
}
