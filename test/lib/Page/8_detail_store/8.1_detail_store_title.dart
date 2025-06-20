import 'package:flutter/material.dart';
import 'package:my_dream/Page/8_detail_store/detail_store_dio/detail_dio.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/store_components/store_rating_summary.dart';
import 'package:provider/provider.dart';

class DetailStoreTitle extends StatefulWidget {
  final Function handleCouponsDialog;
  final Map<String, dynamic> detailStoreInformation;
  final int marketId;
  final bool myPage;
  const DetailStoreTitle(
      {super.key,
      required this.detailStoreInformation,
      required this.handleCouponsDialog,
      required this.marketId,
      required this.myPage});

  @override
  State<DetailStoreTitle> createState() => _DetailStoreTitleState();
}

class _DetailStoreTitleState extends State<DetailStoreTitle> {
  bool isFavorite = false;
  late bool _isFavorite; // 값 비교 변수

  @override
  void initState() {
    isFavorite = widget.detailStoreInformation['favorite'];
    _isFavorite = isFavorite; // 불변하는 값
    super.initState();
  }

  Future<void> toggleFavorite() async {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    if (loginStatus.loginStatus && loginStatus.isStudent) {
      setState(() {
        isFavorite = !isFavorite;
      });
      if (mounted) {
        if (_isFavorite != isFavorite) {
          Provider.of<ResetStorePage>(context, listen: false)
              .toggleFavorite(widget.marketId, true);
          // 마이페이지라면 새로고침
          if (widget.myPage && !isFavorite) {
            Provider.of<ResetStorePage>(context, listen: false)
                .toggleFavoriteMypage(widget.marketId, true);
          }
        } else {
          Provider.of<ResetStorePage>(context, listen: false)
              .toggleFavorite(widget.marketId, false);
          // 마이페이지라면 새로고침
          if (widget.myPage && isFavorite) {
            Provider.of<ResetStorePage>(context, listen: false)
                .toggleFavoriteMypage(widget.marketId, false);
          }
        }
      }
    } else {
      // 비로그인 상태일 때 로그인 모달 표시
      pageRoutesStatus.setPageController('/StoreDetail');
      if (!loginStatus.loginStatus) {
        showLoginDialog(context, LoginDialogType.login);
      } else if (loginStatus.loginStatus && !loginStatus.isStudent) {
        showLoginDialog(context, LoginDialogType.studentAuth);
      }
    }
  }

  // 서버에 정보 반영 화면을 벗어났을 때만 반영
  Future<void> updateFavoriteOnServer() async {
    if (isFavorite != _isFavorite) {
      await addFavoriteStore(widget.marketId);
    }
  }

  @override
  void dispose() {
    updateFavoriteOnServer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.65,
                    child: Text(
                      '${widget.detailStoreInformation['marketName']}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff111111),
                        fontSize: 30,
                        fontFamily: 'PretendardSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.black),
                    iconSize: 24,
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      highlightColor: Colors.transparent,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                    iconSize: 24,
                    onPressed: () {
                      toggleFavorite();
                    },
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      highlightColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              StoreRatingSummary(
                detailStoreInformation: widget.detailStoreInformation,
                marketId: widget.marketId,
              ),
              const SizedBox(height: 5),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  widget.handleCouponsDialog();
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xff6fbf8a),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '쿠폰받기',
                          style: TextStyle(
                            color: Color(0xff6fbf8a),
                            fontSize: 16,
                            fontFamily: 'PretendardSemiBold',
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.file_download_outlined,
                          size: 20,
                          color: Color(0xff6fbf8a),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
