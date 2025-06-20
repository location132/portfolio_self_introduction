import 'package:flutter/material.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/widget/11.1_my_shopping_cart_storelistview.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_provider/my_shopping_cart_state.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/widget/recommended_side_menu.dart';
import 'package:my_dream/coreService/core/di/injector.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/shopping_cart_cubit.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/shopping_cart_state.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyShoppingCartPage extends StatelessWidget {
  const MyShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ShoppingCartCubit>(),
      child: const MyShoppingCartView(),
    );
  }
}

class MyShoppingCartView extends StatefulWidget {
  const MyShoppingCartView({super.key});

  @override
  State<MyShoppingCartView> createState() => _MyShoppingCartViewState();
}

class _MyShoppingCartViewState extends State<MyShoppingCartView> {
  @override
  void initState() {
    super.initState();
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    context.read<ShoppingCartCubit>().getMycart(
          loginStatus: loginStatus,
          cartProvider: cartProvider,
        );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    state.screenState != ScreenState.loaded
                        ? const SizedBox.shrink()
                        : AnimatedOpacity(
                            opacity: state.screenState == ScreenState.loaded
                                ? 1.0
                                : 0.0,
                            duration: const Duration(milliseconds: 420),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.041),
                                  child: Column(
                                    children: [
                                      const CustomAppBar(title: '장바구니'),
                                      Consumer<CartProvider>(
                                        builder:
                                            (context, cartProvider, child) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: SizedBox(
                                                  height: 25,
                                                  width: 25,
                                                  child: Checkbox(
                                                    value: cartProvider
                                                        .isAllSelected,
                                                    onChanged: (_) => cartProvider
                                                        .toggleAllSelection(),
                                                    activeColor:
                                                        const Color(0xff6fbf8a),
                                                    checkColor: Colors.white,
                                                    side: const BorderSide(
                                                      color: Color(0xffdbdbdb),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              GestureDetector(
                                                onTap: () => cartProvider
                                                    .toggleAllSelection(),
                                                child: Text(
                                                  '전체선택(${cartProvider.selectedItemCount}/${cartProvider.totalItemCount})',
                                                  style: const TextStyle(
                                                    color: Color(0xff8e8e8e),
                                                    fontSize: 16,
                                                    fontFamily: 'Pretendard',
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () async {
                                                  final loginStatus =
                                                      Provider.of<LoginModel>(
                                                          context,
                                                          listen: false);
                                                  final cartProvider =
                                                      Provider.of<CartProvider>(
                                                          context,
                                                          listen: false);
                                                  context
                                                      .read<ShoppingCartCubit>()
                                                      .deleteMyCart(
                                                        cartProvider
                                                            .selectedBasketIds,
                                                        loginStatus:
                                                            loginStatus,
                                                        cartProvider:
                                                            cartProvider,
                                                      );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  child: AnimatedOpacity(
                                                    opacity: cartProvider
                                                            .hasSelectedItems
                                                        ? 1.0
                                                        : 0.0,
                                                    duration: const Duration(
                                                        milliseconds: 220),
                                                    child: Text(
                                                      cartProvider.isAllSelected
                                                          ? '전체 삭제'
                                                          : '선택 삭제',
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff8e8e8e),
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Pretendard',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                StoreListView(
                                  onTap: (basketMenuIds) {
                                    final loginStatus = Provider.of<LoginModel>(
                                        context,
                                        listen: false);
                                    context
                                        .read<ShoppingCartCubit>()
                                        .deleteMyCart(
                                          basketMenuIds,
                                          loginStatus: loginStatus,
                                          cartProvider: cartProvider,
                                        );
                                  },
                                  screenWidth: screenWidth,
                                  myCartData: state.cartModel,
                                  refresh: () {
                                    final loginStatus = Provider.of<LoginModel>(
                                        context,
                                        listen: false);
                                    context.read<ShoppingCartCubit>().getMycart(
                                          loginStatus: loginStatus,
                                          cartProvider: cartProvider,
                                        );
                                  },
                                ),
                                const SizedBox(height: 30),
                                // 사이드 메뉴 추천
                                cartProvider.totalItemCount > 0
                                    ? RecommendedSideMenu(
                                        sideMenuList: state.recommendedSideMenu,
                                        marketId: state.cartModel[0].marketId,
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                    AnimatedOpacity(
                      opacity:
                          state.screenState == ScreenState.loading ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 420),
                      child: LodingGifIfsai(
                        isLoadingFinish:
                            state.screenState != ScreenState.loading,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        opacity: cartProvider.hasSelectedItems ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 220),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.035),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (priceFormatting(cartProvider
                                      .totalSelectedAmount
                                      .toStringAsFixed(0)) !=
                                  '0') {
                                print('0원이 아닐때 버튼 클릭');
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff6fbf8a),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${priceFormatting(cartProvider.totalSelectedAmount.toStringAsFixed(0))}원',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'PretendardBold',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' 주문하기',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
