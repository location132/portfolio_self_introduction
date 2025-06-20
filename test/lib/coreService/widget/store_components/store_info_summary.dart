/*
재사용

매장 상세 페이지 주문금액, 영업시간, 조리시간,
매장위치, 전화번호에 관해서 재사용 가능한 위젯 
*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreInfoSummary extends StatelessWidget {
  final Map<String, dynamic> detailStoreInformation;
  const StoreInfoSummary({
    super.key,
    required this.detailStoreInformation,
  });

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '최소 주문금액',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '영업시간\n',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '조리시간',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '매장위치',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '전화번호',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // 서버에서 받아오는 값
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${detailStoreInformation['minimumOrderPrice']} 원',
                    style: const TextStyle(
                      color: Color(0xff393939),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${detailStoreInformation['openTime']} ~ ${detailStoreInformation['closeTime']}\n${detailStoreInformation['closeDays']}',
                    style: const TextStyle(
                      color: Color(0xff393939),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    '평균 40~50분 정도 소요',
                    style: TextStyle(
                      color: Color(0xff393939),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${detailStoreInformation['marketAddress']}',
                    style: const TextStyle(
                      color: Color(0xff393939),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Text(
                        '${detailStoreInformation['marketPhone']}',
                        style: const TextStyle(
                          color: Color(0xff393939),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 62,
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f5f5),
                          border: Border.all(
                            color: const Color(0xffdbdbdb),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () => _makePhoneCall(
                              detailStoreInformation['marketPhone']),
                          child: const Center(
                            child: Text(
                              '전화걸기',
                              style: TextStyle(
                                color: Color(0xff5b5b5b),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
