/*
  검색창과 카테고리를 보여주는 클래스 위젯입니다.
*/

import 'package:flutter/material.dart';
import 'package:my_dream/Page/12_naver_map/page/widget/top_category.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/coreService/widget/searchbar.dart';

class SearchCategorySection extends StatelessWidget {
  // 검색창
  final bool isNaverMap;
  final String textBarText;
  final ValueChanged<String>? onEnter;
  //카테고리
  final List<NaverMapCategoryContent> naverMapCategory;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final VoidCallback onTap;

  const SearchCategorySection({
    super.key,
    required this.isNaverMap,
    required this.textBarText,
    required this.naverMapCategory,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onTap,
    required this.onEnter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sw),
          child: Searchbar(
            textEditing: textBarText,
            isNaverMap: isNaverMap,
            onTap: onTap,
            onEnter: onEnter,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 16.sw),
          child: Row(
            children: [
              const Icon(Icons.tune_rounded, color: Color(0xff5b5b5b)),
              SizedBox(width: 10.sw),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NaverMapTopCategory(
                    naverMapCategory: naverMapCategory,
                    selectedCategory: selectedCategory,
                    onCategorySelected: onCategorySelected,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
