/*
재사용

매장 메뉴 카테고리 내부 메뉴 위젯 (StoreMenuCategory의 자식 위젯입니다)
*/

import 'package:flutter/material.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/bottomSheet_menu_page.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:provider/provider.dart';

class StoreMenuCategoryDetail extends StatelessWidget {
  final int? marketId;
  final Map<String, dynamic> detailStoreMenu;
  final int index;
  final bool naverMap;

  const StoreMenuCategoryDetail({
    super.key,
    required this.detailStoreMenu,
    required this.index,
    this.marketId,
    required this.naverMap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);

    return ListView.builder(
      cacheExtent: double.infinity,
      shrinkWrap: true,
      padding: EdgeInsets.zero, // 리스트뷰의 기본 패딩 제거

      physics: const NeverScrollableScrollPhysics(),
      itemCount: detailStoreMenu['menuCategories'][index]['menus'].length,
      itemBuilder: (context, menuIndex) {
        var menuCategory = detailStoreMenu['menuCategories'][index]['menus'];
        var formattedPrice =
            priceFormatting(menuCategory[menuIndex]['price'].toString());
        return
            //-----------------------
            menuCategory[menuIndex]['imageUrl'] != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loginStatus.loginStatus &&
                            loginStatus.isStudent &&
                            marketId != null) {
                          await menuPriceStatus.clearAll();
                          menuShowModalBottomSheet(
                            context,
                            marketId!,
                            menuCategory[menuIndex]['imageUrl'].toString(),
                            menuCategory[menuIndex]['menuId'],
                            menuCategory[menuIndex]['menuName'],
                            menuCategory[menuIndex]['bestMenu'],
                          );
                          menuPriceStatus
                              .setFinalPrice(menuCategory[menuIndex]['price']);
                        } else if (!loginStatus.loginStatus) {
                          pageRoutesStatus.setPageController('/StoreDetail');
                          showLoginDialog(context, LoginDialogType.login);
                        } else {
                          showLoginDialog(context, LoginDialogType.studentAuth);
                        }
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: screenWidth * 0.264,
                                width: screenWidth * 0.264,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    menuCategory[menuIndex]['imageUrl']
                                        .toString(),
                                    fit: BoxFit.cover,
                                    cacheWidth: (screenWidth *
                                            0.264 *
                                            MediaQuery.of(context)
                                                .devicePixelRatio)
                                        .round(),
                                    cacheHeight: (screenWidth *
                                            0.264 *
                                            MediaQuery.of(context)
                                                .devicePixelRatio)
                                        .round(),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${menuCategory[menuIndex]['menuName']}',
                                          style: const TextStyle(
                                            color: Color(0xff393939),
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // 베스트 메뉴 추가
                                        if (menuCategory[menuIndex]
                                                ['bestMenu'] ==
                                            true) ...[
                                          SizedBox(width: 5.sw),
                                          Container(
                                            width: 50.sw,
                                            height: 18.sh,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff6fbf8a),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'BEST',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        //---------------
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    naverMap
                                        ? const SizedBox.shrink()
                                        : SizedBox(
                                            width: screenWidth * 0.54,
                                            child: menuCategory[menuIndex]
                                                            ['description'] ==
                                                        null ||
                                                    menuCategory[menuIndex]
                                                            ['description'] ==
                                                        'null'
                                                ? const SizedBox()
                                                : Text(
                                                    '${menuCategory[menuIndex]['description']}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: Color(0xff8e8e8e),
                                                      fontFamily: 'Pretendard',
                                                    ),
                                                  ),
                                          ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '$formattedPrice원',
                                      style: const TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          if (menuIndex <
                              detailStoreMenu['menuCategories'][index]['menus']
                                      .length -
                                  1)
                            const SizedBox(height: 14),
                          if (menuIndex <
                              detailStoreMenu['menuCategories'][index]['menus']
                                      .length -
                                  1)
                            const Divider(
                              color: Color(0xfff5f5f5),
                              height: 1.5,
                            ),
                        ],
                      ),
                    ),
                  )
                //---------------음료/ 주류---------------
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${menuCategory[menuIndex]['menuName']}',
                                      style: const TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '$formattedPrice원',
                                      style: const TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                          ],
                        ),
                      ),
                      if (menuIndex <
                          detailStoreMenu['menuCategories'][index]['menus']
                                  .length -
                              1)
                        const Divider(
                          color: Color(0xfff5f5f5),
                          height: 1.5,
                        ),
                    ],
                  );
      },
    );
  }
}
