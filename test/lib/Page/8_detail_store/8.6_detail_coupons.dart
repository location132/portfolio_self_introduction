import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/8_detail_store/detail_store_dio/detail_dio.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class DetailCoupons extends StatefulWidget {
  final Map<String, dynamic> couponsData;
  final int severResult;
  final Function loadCoupons;

  const DetailCoupons(
      {super.key,
      required this.couponsData,
      required this.loadCoupons,
      required this.severResult});

  @override
  State<DetailCoupons> createState() => _DetailCouponsState();
}

class _DetailCouponsState extends State<DetailCoupons> {
  bool isAllCouponsDownloaded = true; // 기본값을 true로 설정
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    checkCouponsDownloadStatus();
  }

  // 쿠폰 다운로드 상태 확인
  void checkCouponsDownloadStatus() {
    var couponsList = widget.couponsData['coupon'];
    bool allDownloaded = true;
    for (var coupon in couponsList) {
      if (coupon['download'] == false) {
        allDownloaded = false;
        break;
      }
    }

    setState(() {
      isAllCouponsDownloaded = allDownloaded;
      _isLoading = false;
    });
  }

  // 쿠폰 개별 받기
  Future<void> downloadSingleCoupon(int couponId, int index) async {
    bool result = await downLoadCoupon(couponId);
    if (result) {
      updateCouponStatus(index, true);
    }
    Provider.of<ResetStorePage>(context, listen: false)
        .toggleCouponse(widget.severResult, true);
  }

  // 쿠폰 한번에 받기
  void handleCouponDownloadOrLogin(BuildContext context) async {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    if (loginStatus.loginStatus && !isAllCouponsDownloaded) {
      // 로그인시 모든 쿠폰 다운로드
      bool isSuccess = await downLoadCouponAll(widget.severResult);
      if (isSuccess) {
        await widget.loadCoupons(widget.severResult);
        setState(() {
          for (var coupon in widget.couponsData['coupon']) {
            coupon['download'] = true;
          }
          isAllCouponsDownloaded = true;
        });
      }
      Provider.of<ResetStorePage>(context, listen: false)
          .toggleCouponse(widget.severResult, true);
    } else if (!loginStatus.loginStatus) {
      // 비 로그인시 로그인 모달창 이동
      pageRoutesStatus.setPageController('/StoreDetail');
      Navigator.pop(context);
      showLoginDialog(context, LoginDialogType.login);
    } else {
      // 모든 경우 비활성화
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return !_isLoading
        ? BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
            child: Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.only(left: 30, right: 30),
              child: Wrap(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 6, bottom: 6, right: 4, left: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.transparent,
                                ),
                                onPressed: () {},
                              ),
                              const Text(
                                '쿠폰받기',
                                style: TextStyle(
                                  color: Color(0xff5b5b5b),
                                  fontSize: 16,
                                  fontFamily: 'PretendardSemiBold',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Color(0xffc1c1c1),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        //-------------------------------
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: screenHeight * 0.43),
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.couponsData['couponLength'],
                              itemBuilder: (context, index) {
                                //조건문 1. 로그인ok , 학생인증ok , 다운로드가능
                                final bool condition =
                                    loginStatus.loginStatus &&
                                        loginStatus.isStudent &&
                                        widget.couponsData["coupon"][index]
                                                ["download"] ==
                                            false;
                                //조건문 1. 로그인ok , 다운로드 불가능
                                final bool condition1 =
                                    loginStatus.loginStatus &&
                                        widget.couponsData["coupon"][index]
                                                ["download"] ==
                                            true;
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.038,
                                          right: screenWidth * 0.038),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x19000000),
                                              offset: Offset(0, 2),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    top: 19,
                                                    bottom: 19),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      widget.couponsData[
                                                              'coupon'][index]
                                                          ['couponName'],
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff111111),
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'Pretendard',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const Text(
                                                      '[브랜드 쿠폰]',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff5b5b5b),
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'PretendardSemiBold',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      widget.couponsData[
                                                              'coupon'][index]
                                                          ['couponDescription'],
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff8e8e8e),
                                                        fontSize: 13,
                                                        fontFamily:
                                                            'Pretendard',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: screenWidth * 0.2,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xfff5f5f5),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: Icon(widget.couponsData[
                                                                        'coupon']
                                                                    [index]
                                                                ['download'] ==
                                                            true
                                                        ? Icons
                                                            .task_alt_outlined
                                                        : Icons
                                                            .file_download_outlined),
                                                    onPressed: () async {
                                                      if (condition) {
                                                        await downloadSingleCoupon(
                                                            widget.couponsData[
                                                                        'coupon']
                                                                    [index]
                                                                ['couponId'],
                                                            index);
                                                      } else if (condition1) {
                                                        null;
                                                      } else {
                                                        pageRoutesStatus
                                                            .setPageController(
                                                                '/StoreDetail');
                                                        Navigator.pop(context);
                                                        if (!loginStatus
                                                            .loginStatus) {
                                                          showLoginDialog(
                                                              context,
                                                              LoginDialogType
                                                                  .login);
                                                        } else if (!loginStatus
                                                            .isStudent) {
                                                          showLoginDialog(
                                                              context,
                                                              LoginDialogType
                                                                  .studentAuth);
                                                        }
                                                      }
                                                    },
                                                    color: widget.couponsData[
                                                                        'coupon']
                                                                    [index]
                                                                ['download'] ==
                                                            true
                                                        ? const Color(
                                                            0xffc1c1c1)
                                                        : const Color(
                                                            0xff6fbf8a),
                                                    iconSize: 40,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        //-------------------------------
                        const SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.038,
                            right: screenWidth * 0.038,
                            bottom: 15,
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (loginStatus.loginStatus &&
                                  loginStatus.isStudent) {
                                handleCouponDownloadOrLogin(context);
                              } else if (!loginStatus.loginStatus) {
                                Navigator.pop(context);
                                showLoginDialog(context, LoginDialogType.login);
                              } else if (!loginStatus.isStudent) {
                                Navigator.pop(context);
                                showLoginDialog(
                                    context, LoginDialogType.studentAuth);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: !isAllCouponsDownloaded
                                    ? const Color(
                                        0xff6fbf8a) // 다운로드 가능한 쿠폰이 있으면 초록색
                                    : const Color(
                                        0xff8e8e8e), // 모든 쿠폰이 다운로드 불가능하면 회색
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '한번에 받기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  void updateCouponStatus(int index, bool downloaded) {
    setState(() {
      widget.couponsData['coupon'][index]['download'] = downloaded;
      checkCouponsDownloadStatus();
    });
  }
}
