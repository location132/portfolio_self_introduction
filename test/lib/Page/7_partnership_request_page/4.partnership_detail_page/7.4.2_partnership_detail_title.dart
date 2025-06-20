// 요청글 페이지에서 제목 왼쪽에 hot, new, normal을 표시하기 위해서 따로 만든 위젯들 //

import 'package:flutter/material.dart';

Widget hotDetailRequest(Map<String, dynamic> serverDetailData) {
  return Row(
    children: [
      Padding(
        padding:
            const EdgeInsets.only(right: 10, top: 11, bottom: 11, left: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(2),
          ),
          child: const Text(
            'HOT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Text(
        serverDetailData['title'],
        style: const TextStyle(
            color: Color(0xff111111),
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
    ],
  );
}

Widget newDetailRequest(Map<String, dynamic> serverDetailData) {
  return Row(
    children: [
      Padding(
        padding:
            const EdgeInsets.only(right: 10, top: 11, bottom: 11, left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: const Text(
            'NEW',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Text(
        serverDetailData['title'],
        style: const TextStyle(
            color: Color(0xff111111),
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
    ],
  );
}

Widget normalDetailRequest(Map<String, dynamic> serverDetailData) {
  return Row(
    children: [
      Padding(
        padding:
            const EdgeInsets.only(right: 10, top: 11, bottom: 11, left: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            serverDetailData['title'],
            style: const TextStyle(
                color: Color(0xff111111),
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ),
      ),
    ],
  );
}
