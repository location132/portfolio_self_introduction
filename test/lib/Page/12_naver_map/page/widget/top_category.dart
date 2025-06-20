import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';

class NaverMapTopCategory extends StatelessWidget {
  final List<NaverMapCategoryContent> naverMapCategory;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  const NaverMapTopCategory({
    super.key,
    required this.naverMapCategory,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 9.8.sw),
        _buildFilterButton('전체', selectedCategory, onCategorySelected),
        SizedBox(width: 9.8.sw),
        SizedBox(
          height: 30.sh,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: naverMapCategory.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  _buildFilterButton(
                    naverMapCategory[index].category!,
                    selectedCategory,
                    onCategorySelected,
                  ),
                  SizedBox(width: 9.8.sw),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String text, String selectedCategory,
      Function(String) onCategorySelected) {
    bool isSelected = text == selectedCategory;
    return GestureDetector(
      onTap: () {
        onCategorySelected(text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.5,
            color:
                isSelected ? const Color(0xff6fbf8a) : const Color(0xff8e8e8e),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xff6fbf8a)
                  : const Color(0xff393939),
              fontFamily: 'Pretendard',
            ),
          ),
        ),
      ),
    );
  }
}
