import 'package:flutter/material.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/bottomSheet_menu_page.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/model/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendedSideMenu extends StatelessWidget {
  final int marketId;
  final List<SideMenuModel> sideMenuList;
  const RecommendedSideMenu(
      {super.key, required this.sideMenuList, required this.marketId});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: sideMenuList.isNotEmpty,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: const Text(
                '같이 먹으면 좋은 사이드메뉴',
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.sh),
          SizedBox(
            height: 140.sh,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                itemCount: sideMenuList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 12.sw : 0,
                      right: index == 4 - 1 ? 12.sw : 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      menuShowModalBottomSheet(
                        context,
                        marketId,
                        sideMenuList[index].imageUrl,
                        sideMenuList[index].menuId,
                        sideMenuList[index].menuName,
                        sideMenuList[index].bestMenu,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.sw),
                      child: Container(
                        height: 130.sh,
                        width: 112.sw,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: sideMenuList[index].imageUrl,
                                height: 80.sh,
                                width: 112.sw,
                                fit: BoxFit.cover,
                                memCacheHeight: (80 *
                                        MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(height: 5.sh),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sw),
                              child: SizedBox(
                                height: 40.sh,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sideMenuList[index].bestMenu
                                          ? '[BEST] ${sideMenuList[index].menuName}'
                                          : sideMenuList[index].menuName,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${priceFormatting(sideMenuList[index].price.toString())}원',
                                      style: const TextStyle(
                                        color: Color(0xff393939),
                                        fontFamily: 'PretendardSemiBold',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
