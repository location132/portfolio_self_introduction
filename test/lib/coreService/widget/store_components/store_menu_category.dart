/*
재사용

매장 메뉴 카테고리 위젯(메뉴 위에 카테고리 입니다. 메뉴는 따로 위젯 있습니다.)
*/

import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/store_components/store_menu_category_detail.dart';

class StoreMenuCategory extends StatelessWidget {
  final int? marketId;
  final Map<String, dynamic> detailStoreMenu;
  final Map<String, GlobalKey>? categoryKeys;
  final bool naverMap;
  const StoreMenuCategory({
    super.key,
    required this.detailStoreMenu,
    this.marketId,
    this.categoryKeys,
    this.naverMap = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      cacheExtent: double.infinity,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero, // 리스트뷰의 기본 패딩 제거
      itemCount: int.parse(detailStoreMenu['titleCount']),
      itemBuilder: (context, index) {
        var categoryTitle =
            detailStoreMenu['menuCategories'][index]['classification'];
        return Column(
          key: categoryKeys?[categoryTitle],
          children: [
            Text(
              '$categoryTitle',
              style: const TextStyle(
                color: Color(0xff111111),
                fontSize: 20,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.041, right: screenWidth * 0.041),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(2, 0),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(-2, 0),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: StoreMenuCategoryDetail(
                  detailStoreMenu: detailStoreMenu,
                  index: index,
                  marketId: marketId,
                  naverMap: naverMap,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
