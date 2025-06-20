import 'package:flutter/material.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/widget/bottomSheet_classification_options.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/model/menus_option.dart';

class DetailBottomsheetClassification extends StatelessWidget {
  final MenuOptionsModel? menuOptions;
  final int? menuIndex;
  final CartModel? cartModel;

  const DetailBottomsheetClassification({
    super.key,
    required this.menuOptions,
    this.menuIndex,
    this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: menuOptions!.categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: screenWidth * 0.041, bottom: 7, top: 7),
              child: Row(
                children: [
                  Text(
                    menuOptions!.categories[index].classification,
                    style: const TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xfff5f5f5),
            ),
            DetailBottomsheetClassificationOptions(
              menuOptions: menuOptions,
              index: index,
              cartModel: cartModel,
              menuIndex: menuIndex,
            )
          ],
        );
      },
    );
  }
}
