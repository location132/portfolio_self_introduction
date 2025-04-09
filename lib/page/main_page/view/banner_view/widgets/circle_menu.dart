import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class CircleMenu extends StatelessWidget {
  const CircleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9FAFB), // 배경톤 살짝 들어간 화이트
      padding: EdgeInsets.symmetric(vertical: 80.sh, horizontal: 40.sh),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 타이틀
          Text(
            'My Identity',
            style: TextStyle(
              fontSize: 40.sh,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
              color: const Color(0xFF1F2937), // 진한 그레이
            ),
          ),
          SizedBox(height: 40.sh),

          // 카드 영역
          Wrap(
            spacing: 32.sh,
            runSpacing: 32.sh,
            alignment: WrapAlignment.center,
            children: [
              _buildGeometricCard(
                title: 'About Me',
                description: '저의 철학과 성향을 담아낸 짧은 소개입니다.',
                icon: Icons.person,
                index: 0,
              ),
              _buildGeometricCard(
                title: 'Detail',
                description: '프로젝트 경험과 기술 스택에 대해 설명합니다.',
                icon: Icons.code,
                index: 1,
              ),
              _buildGeometricCard(
                title: 'Process',
                description: '문제를 해결해온 사고 흐름과 접근 방식을 공유합니다.',
                icon: Icons.timeline,
                index: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGeometricCard({
    required String title,
    required String description,
    required IconData icon,
    required int index,
  }) {
    final colors = [Colors.indigo, Colors.teal, Colors.deepOrange];
    final color = colors[index % colors.length];

    return Container(
      width: 300.sh,
      height: 480.sh,
      margin: EdgeInsets.symmetric(horizontal: 14.sh),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32.sh),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Stack(
        children: [
          // 배경 도형
          Positioned(
            right: -30.sh,
            top: -30.sh,
            child: Container(
              width: 100.sh,
              height: 100.sh,
              decoration: BoxDecoration(
                color: color.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(28.sh),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단 인덱스 넘버
                Text(
                  '#0${index + 1}',
                  style: TextStyle(
                    fontSize: 14.sh,
                    color: color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 12.sh),
                // 아이콘
                Container(
                  width: 50.sh,
                  height: 50.sh,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.sh),
                  ),
                  child: Icon(icon, color: color, size: 28.sh),
                ),
                SizedBox(height: 28.sh),
                // 타이틀
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.sh,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF222222),
                  ),
                ),
                SizedBox(height: 18.sh),
                // 설명
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.sh,
                    height: 1.7,
                    color: const Color(0xFF666666),
                  ),
                ),
                const Spacer(),
                // 하단 라인
                Container(
                  height: 1,
                  color: color.withOpacity(0.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
