import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemAnalysisSection extends StatelessWidget {
  final bool isMobile;
  const ProblemAnalysisSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          '문제 원인 분석',
          style: TextStyle(
            fontSize: isMobile ? 28.sp : 28,
            fontWeight: FontWeight.bold,
            color: Colors.grey[100],
            height: 1.3,
          ),
        ),
        SizedBox(height: isMobile ? 20.h : 20),
        Container(width: double.infinity, height: 2, color: Colors.grey[600]),
        SizedBox(height: isMobile ? 40.h : 40),

        Container(
          padding: EdgeInsets.all(isMobile ? 24.w : 24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700]!, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '원인이라 생각하는 부분',
                    style: TextStyle(
                      fontSize: isMobile ? 22.sp : 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 20.h : 20),

              Text(
                '1. 한글 조합형 입력 시스템',
                style: TextStyle(
                  fontSize: isMobile ? 18.sp : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[100],
                  height: 1.4,
                ),
              ),
              SizedBox(height: isMobile ? 12.h : 12),
              Text(
                '"안녕" 입력 시 \'ㅇ\' → \'아\' → \'안\' → \'안ㄴ\' → \'안녀\' → \'안녕\' 순으로 6번의 onChange 이벤트가 발생하는 것을 확인했습니다.',
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 16,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
              ),
              SizedBox(height: isMobile ? 20.h : 20),

              Text(
                '2. setState 호출 패턴',
                style: TextStyle(
                  fontSize: isMobile ? 18.sp : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[100],
                  height: 1.4,
                ),
              ),
              SizedBox(height: isMobile ? 12.h : 12),
              Text(
                '각 입력 이벤트마다 즉시 setState()가 호출되어 화면 갱신이 발생하는 구조임을 코드 분석을 통해 확인했습니다.',
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 16,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: isMobile ? 30.h : 30),

        // 가능성이 있다고 보는 부분
        Container(
          padding: EdgeInsets.all(isMobile ? 24.w : 24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700]!, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '가능성이 있다고 보는 부분',
                    style: TextStyle(
                      fontSize: isMobile ? 22.sp : 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 20.h : 20),

              Text(
                '1. API 호출 Race Condition',
                style: TextStyle(
                  fontSize: isMobile ? 18.sp : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[100],
                  height: 1.4,
                ),
              ),
              SizedBox(height: isMobile ? 12.h : 12),
              Text(
                '서버 응답 속도 차이로 인해 나중 요청이 먼저 도착하는 경우, 이전 결과가 덮어쓰여지면서 화면이 깜빡일 가능성이 있습니다.',
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 16,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
              ),
              SizedBox(height: isMobile ? 20.h : 20),

              Text(
                '2. UI 상태 관리 복잡성',
                style: TextStyle(
                  fontSize: isMobile ? 18.sp : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[100],
                  height: 1.4,
                ),
              ),
              SizedBox(height: isMobile ? 12.h : 12),
              Text(
                '검색 결과 리스트의 표시/숨김, 로딩 상태 전환에서 중간 상태가 노출되면서 깜빡임이 발생하는 것으로 추정됩니다.',
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 16,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
              ),
              SizedBox(height: isMobile ? 20.h : 20),

              Text(
                '3. 렌더링 성능 이슈',
                style: TextStyle(
                  fontSize: isMobile ? 18.sp : 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[100],
                  height: 1.4,
                ),
              ),
              SizedBox(height: isMobile ? 12.h : 12),
              Text(
                '위젯 트리의 불필요한 재구성이나 리스트 아이템의 빈번한 추가/제거가 성능에 영향을 미칠 가능성이 있습니다.',
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 16,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
