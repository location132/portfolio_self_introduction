import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_option_page/widget/shopping_Item_detail_card.dart';
import 'package:my_dream/coreService/core/di/injector.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/coreService/widget/%08ifsai_button_components/wide_green_button.dart';

import 'package:my_dream/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_cubit.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_state.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/widget/bottomSheet_classification.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';

import 'package:provider/provider.dart';

class MyShoppingCartOptionPage extends StatelessWidget {
  final int index;
  const MyShoppingCartOptionPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ShoppingOptionCubit>(),
      child: _MyShoppingCartOptionView(index: index),
    );
  }
}

class _MyShoppingCartOptionView extends StatefulWidget {
  final int index;
  const _MyShoppingCartOptionView({required this.index});

  @override
  State<_MyShoppingCartOptionView> createState() =>
      _MyShoppingCartOptionViewState();
}

class _MyShoppingCartOptionViewState extends State<_MyShoppingCartOptionView> {
  @override
  void initState() {
    super.initState();
    context.read<ShoppingOptionCubit>().getMycart(context, widget.index);
  }

  @override
  Widget build(BuildContext context) {
    final menuPriceStatus = Provider.of<MenuPrice>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ShoppingOptionCubit, ShoppingOptionState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                state.screenState != ScreenState.loaded
                    ? const SizedBox.shrink()
                    : AnimatedOpacity(
                        opacity:
                            state.screenState == ScreenState.loaded ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 420),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.041),
                              child: const CustomAppBar(title: '옵션변경'),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  // 가게 정보
                                  ShoppingItemDetailCard(
                                    cartModel: state.cartModel!,
                                    index: widget.index,
                                    // 수량 조절
                                    decreaseQuantity: () => context
                                        .read<ShoppingOptionCubit>()
                                        .decreaseQuantity(context),
                                    increaseQuantity: () => context
                                        .read<ShoppingOptionCubit>()
                                        .increaseQuantity(context),
                                    quantity: state.quantity,
                                  ),
                                  const SizedBox(height: 15),
                                  //옵션
                                  Expanded(
                                    child: DetailBottomsheetClassification(
                                      menuOptions: state.menuOptionsModel,
                                      cartModel: state.cartModel![0],
                                      menuIndex: widget.index,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Bottom Button
                            Padding(
                              padding: EdgeInsets.all(screenWidth * 0.041),
                              child: WideGreenButton(
                                buttonText:
                                    ' ${priceFormatting(((menuPriceStatus.mainMenuPrice * menuPriceStatus.quantity) + menuPriceStatus.optionPrice).toString())}원으로 변경하기',
                                onPressed: () async {
                                  await context
                                      .read<ShoppingOptionCubit>()
                                      .putMyCartOption(
                                        context,
                                        state.cartModel![0].menu[widget.index]
                                            .basketMenuId,
                                        menuPriceStatus.quantity,
                                      );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                AnimatedOpacity(
                  opacity: state.screenState == ScreenState.loading ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 420),
                  child: LodingGifIfsai(
                    isLoadingFinish: state.screenState != ScreenState.loading,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
