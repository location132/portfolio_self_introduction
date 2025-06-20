import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/widget/bottomSheet_title.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/widget/bottomSheet_classification.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/bottomSheet_menu_cubit.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/bottomSheet_menu_state.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_repository.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_service.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_source.dart';
import 'package:provider/provider.dart';

void menuShowModalBottomSheet(BuildContext context, int marketId,
    String imageUrl, int menyId, String menuName, bool bestMenu) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFFFDFDFD),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 600),
    ),
    builder: (BuildContext context) {
      return BottomSheetMenuPage(
        marketId: marketId,
        imageUrl: imageUrl,
        menuId: menyId,
        menuName: menuName,
        bestMenu: bestMenu,
      );
    },
  ).then((value) {
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);
    menuPriceStatus.clearAll();
  });
}

class BottomSheetMenuPage extends StatelessWidget {
  final int marketId;
  final String imageUrl;
  final int menuId;
  final String menuName;
  final bool bestMenu;
  const BottomSheetMenuPage(
      {super.key,
      required this.marketId,
      required this.imageUrl,
      required this.menuId,
      required this.menuName,
      required this.bestMenu});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomSheetMenuCubit(
          MenuOptionRemoteService(
              MenuOptionRemoteRepository(MenuOptionRemoteSource())),
          context),
      child: _BottomSheetMenuView(
        imageUrl: imageUrl,
        menuId: menuId,
        marketId: marketId,
        menuName: menuName,
        bestMenu: bestMenu,
      ),
    );
  }
}

class _BottomSheetMenuView extends StatefulWidget {
  final String imageUrl;
  final int menuId;
  final int marketId;
  final String menuName;
  final bool bestMenu;
  const _BottomSheetMenuView(
      {required this.imageUrl,
      required this.menuId,
      required this.marketId,
      required this.menuName,
      required this.bestMenu});

  @override
  State<_BottomSheetMenuView> createState() => _BottomSheetMenuViewState();
}

class _BottomSheetMenuViewState extends State<_BottomSheetMenuView> {
  @override
  void initState() {
    super.initState();
    context.read<BottomSheetMenuCubit>().getMenuOptions(widget.menuId);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final menuPriceStatus = Provider.of<MenuPrice>(context);

    return BlocBuilder<BottomSheetMenuCubit, BottomSheetMenuState>(
      builder: (context, state) {
        return Stack(
          children: [
            state.screenState == ScreenState.loaded
                ? SizedBox(
                    height: screenHeight * 0.92,
                    width: double.infinity,
                    child: Column(
                      children: [
                        DetailBottomsheetTitle(
                          // 메뉴 정보
                          imageUrl: widget.imageUrl,
                          menuName: widget.menuName,
                          bestMenu: widget.bestMenu,
                          // 수량 조절
                          decreaseQuantity: () => context
                              .read<BottomSheetMenuCubit>()
                              .decreaseQuantity(),
                          increaseQuantity: () => context
                              .read<BottomSheetMenuCubit>()
                              .increaseQuantity(),
                          quantity: state.quantity,
                        ),
                        Expanded(
                          child: DetailBottomsheetClassification(
                            menuOptions: state.menuOptionsModel,
                          ),
                        ),
                        const SizedBox(height: 85),
                      ],
                    ),
                  )
                : const SizedBox(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: state.screenState == ScreenState.loaded
                  ? GestureDetector(
                      onTap: () async {
                        context.read<BottomSheetMenuCubit>().handleAddToCart(
                              context,
                              widget.marketId,
                              widget.menuId,
                              menuPriceStatus.quantity,
                            );
                      },
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const Divider(
                              color: Color(0xfff5f5f5),
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.041,
                                  right: screenWidth * 0.041,
                                  top: 15,
                                  bottom: 45),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xff6fbf8a),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${(menuPriceStatus.mainMenuPrice * menuPriceStatus.quantity) + menuPriceStatus.optionPrice}원 장바구니에 담기',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              height: screenHeight * 0.92,
              width: double.infinity,
              child: AnimatedOpacity(
                opacity: state.screenState == ScreenState.loading ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 420),
                child: LodingGifIfsai(
                  isLoadingFinish: state.screenState != ScreenState.loading,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
