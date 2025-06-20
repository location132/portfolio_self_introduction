import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/widget/store_components/store_quantity_controller.dart';

class DetailBottomsheetTitle extends StatelessWidget {
  // 매장 정보
  final String menuName;
  final String imageUrl;
  final bool bestMenu;
  // 수량 조절 함수
  final Function() decreaseQuantity;
  final Function() increaseQuantity;
  final int quantity;

  const DetailBottomsheetTitle(
      {super.key,
      required this.menuName,
      required this.imageUrl,
      required this.bestMenu,
      required this.decreaseQuantity,
      required this.increaseQuantity,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 10),
        // 상단 바
        Container(
          height: 3,
          width: screenWidth * 0.12,
          decoration: const BoxDecoration(
            color: Color(0xffd9d9d9),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Row(
            children: [
              SizedBox(
                height: screenWidth * 0.16,
                width: screenWidth * 0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    memCacheHeight: ((screenWidth * 0.16) *
                            MediaQuery.of(context).devicePixelRatio)
                        .round(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(width: 10.sw),
              Expanded(
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color(0xff393939),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      if (bestMenu)
                        const TextSpan(
                          text: '[BEST] ',
                          style: TextStyle(
                            color: Color(0xff6fbf8a),
                          ),
                        ),
                      TextSpan(
                        text: menuName,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              //------------------수량----------------
              StoreQuantityController(
                onDecrease: decreaseQuantity,
                onIncrease: increaseQuantity,
                quantity: quantity,
              ),
              //------------------수량----------------
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color(0xffdbdbdb),
          thickness: 2,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
