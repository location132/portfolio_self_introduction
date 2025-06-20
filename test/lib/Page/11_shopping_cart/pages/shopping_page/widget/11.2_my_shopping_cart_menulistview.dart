import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_provider/my_shopping_cart_state.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/model/cart.dart';
import 'package:provider/provider.dart';

class MenuListView extends StatelessWidget {
  final List<CartModel> myCartData;
  final double screenWidth;
  final int storeId;
  final Function(List<int>) onTap;
  final Function() refresh;
  const MenuListView({
    super.key,
    required this.screenWidth,
    required this.myCartData,
    required this.storeId,
    required this.onTap,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final basketId = int.parse(storeId.toString());
        final menuList = myCartData[0].menu;

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menuList.length,
          separatorBuilder: (context, indexDex) {
            return const Divider(color: Color(0xfff5f5f5));
          },
          itemBuilder: (context, menuIndex) {
            final menuItem = menuList[menuIndex];

            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                cartProvider.toggleItemSelection(basketId, menuIndex);
              },
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: cartProvider.isItemSelected(basketId, menuIndex),
                        onChanged: (bool? value) {
                          cartProvider.toggleItemSelection(basketId, menuIndex);
                        },
                        activeColor: const Color(0xff6fbf8a),
                        checkColor: Colors.white,
                        side: const BorderSide(
                          color: Color(0xffdbdbdb),
                          width: 1.5,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.255,
                        height: screenWidth * 0.255,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          child: CachedNetworkImage(
                            imageUrl: menuItem.menuImageUrl,
                            fit: BoxFit.cover,
                            memCacheHeight: ((screenHeight * 0.11) *
                                    MediaQuery.of(context).devicePixelRatio)
                                .round(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.42,
                                  child: Text(
                                    menuItem.menuName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xff111111),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final basketMenuId = menuItem.basketMenuId;
                                    onTap([basketMenuId]);
                                  },
                                  child: const Icon(Icons.close,
                                      color: Colors.grey, size: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                menuItem.options.length,
                                (optionsIndex) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // optionsIndex가 0일 때만 표시되는 텍스트
                                      if (optionsIndex == 0)
                                        Row(
                                          children: [
                                            Text(
                                              "옵션 : ${menuItem.options[optionsIndex].optionDescription}",
                                              style: const TextStyle(
                                                color: Color(0xff8e8e8e),
                                                fontFamily: 'Pretendard',
                                              ),
                                            ),
                                          ],
                                        ),
                                      // optionsIndex가 0이든 아니든 항상 표시되는 텍스트
                                      if (optionsIndex > 0)
                                        Row(
                                          children: [
                                            const Opacity(
                                              opacity: 0,
                                              child: Text(
                                                "옵션 : ",
                                                style: TextStyle(
                                                  color: Color(0xff8e8e8e),
                                                  fontFamily: 'Pretendard',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150.sw,
                                              child: Text(
                                                menuItem.options[optionsIndex]
                                                    .optionDescription,
                                                style: const TextStyle(
                                                  color: Color(0xff8e8e8e),
                                                  fontFamily: 'Pretendard',
                                                ),
                                                softWrap: true,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '수량 : ${menuItem.amount}',
                              style: const TextStyle(
                                color: Color(0xff8e8e8e),
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              height: 27,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xffdbdbdb),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.pushNamed(
                                    context,
                                    '/MyShoppingCartOption',
                                    arguments: menuIndex,
                                  );
                                  refresh();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 2,
                                  ),
                                  child: Text(
                                    '옵션변경',
                                    style: TextStyle(
                                      color: Color(0xff5b5b5b),
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: menuItem.discountAvailability ? 1 : 0,
                          child: const Text(
                            '서버에서 전달해주는 값',
                            style: TextStyle(
                              color: Color(0xfff64f4f),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${priceFormatting(menuItem.totalPrice.toString())}원',
                          style: const TextStyle(
                            color: Color(0xff111111),
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
