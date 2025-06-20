import 'dart:ui';

import 'package:flutter/material.dart';

class PartnershipRequestEmail extends StatefulWidget {
  final String keword;
  const PartnershipRequestEmail({super.key, required this.keword});

  @override
  State<PartnershipRequestEmail> createState() =>
      _PartnershipRequestEmailState();
}

class _PartnershipRequestEmailState extends State<PartnershipRequestEmail>
    with WidgetsBindingObserver {
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
                      Text(
                        '글쓴이만 ${widget.keword}할 수 있습니다.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xff5b5b5b),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.035),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context); // 모달창 닫기
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
