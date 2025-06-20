import 'package:flutter/material.dart';

class MypageFilterButton extends StatelessWidget {
  final int categoryType;
  final int selectedFilter;

  const MypageFilterButton({
    super.key,
    required this.selectedFilter,
    required this.categoryType,
  });

  static const Map<int, List<FilterItem>> categoryFilters = {
    1: [
      FilterItem('전체', 1),
      FilterItem('식사', 2),
      FilterItem('포장', 3),
    ],
    2: [
      FilterItem('식음료', 1),
      FilterItem('지식', 2),
      FilterItem('문화', 3),
    ],
    3: [
      FilterItem('전체', 1),
      FilterItem('음식점', 2),
      FilterItem('Bar', 3),
      FilterItem('카페', 4),
      FilterItem('생활/문화', 5),
      FilterItem('쇼핑', 6),
      FilterItem('여가', 7),
      FilterItem('숙박', 8),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final filters = categoryFilters[categoryType] ?? [];
    final needsScroll = filters.length > 4;

    return Row(
      children: [
        const Icon(Icons.tune_rounded, color: Color(0xff5b5b5b)),
        const SizedBox(width: 10),
        Expanded(
          child: needsScroll
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filters
                        .map((filter) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: _buildFilterButton(
                                  filter.label, filter.value),
                            ))
                        .toList(),
                  ),
                )
              : Row(
                  children: filters
                      .map((filter) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child:
                                _buildFilterButton(filter.label, filter.value),
                          ))
                      .toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String text, int filterValue) {
    final isSelected = selectedFilter == filterValue;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1.5,
          color: isSelected ? const Color(0xff6fbf8a) : const Color(0xff8e8e8e),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            color:
                isSelected ? const Color(0xff6fbf8a) : const Color(0xff393939),
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class FilterItem {
  final String label;
  final int value;

  const FilterItem(this.label, this.value);
}
