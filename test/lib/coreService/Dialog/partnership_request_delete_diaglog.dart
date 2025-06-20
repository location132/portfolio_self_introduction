import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';

class PartnershipRequestDeleteDiaglog extends StatefulWidget {
  final int partnershipId;
  const PartnershipRequestDeleteDiaglog(
      {super.key, required this.partnershipId});

  @override
  State<PartnershipRequestDeleteDiaglog> createState() =>
      _PartnershipRequestDeleteDiaglogState();
}

class _PartnershipRequestDeleteDiaglogState
    extends State<PartnershipRequestDeleteDiaglog> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
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
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.047),
                      const Text(
                        '삭제된 내용은 복구할 수 없습니다.\n요청글을 삭제하시겠습니까?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff5b5b5b),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.035),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pop(context); // 모달창 닫기
                                },
                                child: Container(
                                  height: screenHeight * 0.047,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff5f5f5),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '취소',
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'PretendardSemiBold',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: screenHeight * 0.018),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var result =
                                      await partnershipGetDetailDataDelete(
                                          widget.partnershipId);

                                  if (result['status'] == 'true') {
                                    if (!context.mounted) return;

                                    Navigator.popUntil(context, (route) {
                                      return route.settings.name ==
                                              '/PartnershipRequestScreen' ||
                                          route.isFirst;
                                    }); //파트너쉽 요청 페이지로 돌아가기

// 첫 번째 라우트까지 도달했는데 PartnershipRequestScreen이 아니라면 강제로 PartnershipRequestScreen으로 이동
                                    // if (ModalRoute.of(context)?.settings.name !=
                                    //     '/PartnershipRequestScreen') {
                                    //   print(1234566788);
                                    //   Navigator.pushReplacementNamed(
                                    //       context, '/PartnershipRequestScreen');
                                    // }
                                    Navigator.pushReplacementNamed(context,
                                        '/PartnershipRequestScreen'); // 리로딩 작업
                                  }
                                },
                                child: Container(
                                  height: screenHeight * 0.047,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff5f5f5),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '확인',
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 16,
                                        fontFamily: 'PretendardSemiBold',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.024),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
