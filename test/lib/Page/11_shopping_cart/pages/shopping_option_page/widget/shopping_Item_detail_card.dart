import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/store_components/store_quantity_controller.dart';
import 'package:my_dream/model/cart.dart';

class ShoppingItemDetailCard extends StatelessWidget {
  final List<CartModel> cartModel;
  final int index;
  // 수량 조절
  final Function() decreaseQuantity;
  final Function() increaseQuantity;
  final int quantity;

  const ShoppingItemDetailCard({
    super.key,
    required this.cartModel,
    required this.index,
    required this.decreaseQuantity,
    required this.increaseQuantity,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.106,
      margin: EdgeInsets.only(
          left: screenWidth * 0.032,
          right: screenWidth * 0.032,
          top: 10,
          bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c000000),
            offset: Offset(2, 0),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Color(0x0c000000),
            offset: Offset(-2, 0),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
        child: Row(
          children: [
            SizedBox(
              height: screenHeight * 0.07,
              width: screenWidth * 0.153,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: cartModel[0].menu[index].menuImageUrl,
                  fit: BoxFit.cover,
                  memCacheHeight: ((screenHeight * 0.11) *
                          MediaQuery.of(context).devicePixelRatio)
                      .round(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.038),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cartModel[0].marketName,
                    style: const TextStyle(
                      color: Color(0xff111111),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    children: [
                      Text(
                        cartModel[0].menu[index].menuName,
                        style: const TextStyle(
                          color: Color(0xff111111),
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //------------------수량----------------
            StoreQuantityController(
              onDecrease: () {
                decreaseQuantity();
              },
              onIncrease: () {
                increaseQuantity();
              },
              quantity: quantity,
            ),
            //------------------수량----------------
          ],
        ),
      ),
    );
  }
}
