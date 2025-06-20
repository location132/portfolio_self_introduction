import 'package:flutter/material.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/widget/11.2_my_shopping_cart_menulistview.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_provider/my_shopping_cart_state.dart';
import 'package:my_dream/model/cart.dart';
import 'package:provider/provider.dart';

class StoreListView extends StatelessWidget {
  final List<CartModel> myCartData;
  final Function(List<int>) onTap;
  final Function() refresh;
  final double screenWidth;

  const StoreListView({
    super.key,
    required this.screenWidth,
    required this.myCartData,
    required this.onTap,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    if (myCartData.isEmpty) return const SizedBox.shrink();

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final store = myCartData[0];
        final basketId = store.basketId;
        final marketName = store.marketName;

        if (basketId == null) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(2, 0),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(-2, 0),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartProvider.toggleAllItemsInStore(basketId);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, bottom: 0, top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                marketName,
                                style: const TextStyle(
                                  color: Color(0xff282828),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(color: Color(0xffdbdbdb)),
                    ),
                    MenuListView(
                      onTap: onTap,
                      screenWidth: screenWidth,
                      myCartData: myCartData,
                      storeId: basketId,
                      refresh: refresh,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
