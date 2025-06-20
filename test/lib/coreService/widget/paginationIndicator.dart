/*
페이지네이션 인디케이터
1 2 3 번 디폴트 이전페이지 다음페이지 다다음 페이지
 */

import 'package:flutter/material.dart';

class PaginationIndicator extends StatelessWidget {
  final int currentPage; // 현재 페이지
  final int totalPages; //
  final Function(int) onPageChanged; // 페이지 변경 함수

  const PaginationIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  // 상수 스타일 정의
  static const _iconSize = 20.0;
  static const _activeColor = Color(0xff6fbf8a);
  static const _inactiveColor = Colors.grey;
  static const _horizontalPadding = EdgeInsets.symmetric(horizontal: 8);
  static const _verticalPadding = EdgeInsets.symmetric(vertical: 10);

  // 표시할 페이지 번호 계산
  List<int> _getVisiblePages() {
    const visibleCount = 3;
    if (totalPages <= visibleCount) {
      return List.generate(totalPages, (i) => i + 1);
    }

    int start = currentPage - 1;
    if (start < 1) start = 1;
    if (start > totalPages - visibleCount + 1) {
      start = totalPages - visibleCount + 1;
    }

    return List.generate(visibleCount, (i) => start + i);
  }

  // 페이지 번호 아이템 위젯 수정
  Widget _buildPageNumberItem(int pageNumber) {
    final isCurrentPage = currentPage == pageNumber;

    return GestureDetector(
      onTap: () => onPageChanged(pageNumber),
      child: Container(
        padding: _horizontalPadding,
        child: Text(
          '$pageNumber',
          style: TextStyle(
            color: isCurrentPage ? _activeColor : _inactiveColor,
            fontWeight: isCurrentPage ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // 네비게이션 아이콘 위젯
  Widget _buildNavigationIcon({
    required IconData icon,
    required bool isEnabled,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Icon(
        icon,
        size: _iconSize,
        color: _inactiveColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visiblePages = _getVisiblePages();

    return Padding(
      padding: _verticalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 첫 페이지로 이동 (현재 페이지가 4 이상일 때만 표시)
          if (currentPage >= 4)
            _buildNavigationIcon(
              icon: Icons.keyboard_double_arrow_left_rounded,
              isEnabled: true,
              onTap: () => onPageChanged(1),
            ),

          // 이전 페이지
          if (currentPage > 1)
            _buildNavigationIcon(
              icon: Icons.chevron_left_rounded,
              isEnabled: true,
              onTap: () => onPageChanged(currentPage - 1),
            ),

          // 페이지 번호들
          ...visiblePages.map(_buildPageNumberItem),

          // 다음 페이지
          if (currentPage < totalPages)
            _buildNavigationIcon(
              icon: Icons.chevron_right_rounded,
              isEnabled: true,
              onTap: () => onPageChanged(currentPage + 1),
            ),

          // 마지막 페이지로 이동
          if (currentPage < totalPages - 2)
            _buildNavigationIcon(
              icon: Icons.keyboard_double_arrow_right_rounded,
              isEnabled: true,
              onTap: () => onPageChanged(totalPages),
            ),
        ],
      ),
    );
  }
}
