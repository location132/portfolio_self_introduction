/*
재사용

매장 상세 페이지 수량 조절 위젯
- ?개 + 버튼을 보여주는 위젯
*/

import 'package:flutter/material.dart';

class StoreQuantityController extends StatelessWidget {
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final int quantity;

  const StoreQuantityController({
    super.key,
    required this.onDecrease,
    required this.onIncrease,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrease,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(
                color: const Color(0xfff5f5f5),
                width: 2,
              ),
            ),
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, -6),
                child: const Icon(
                  Icons.minimize,
                  size: 20,
                  color: Color(0xff8e8e8e),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          '$quantity개',
          style: const TextStyle(
            color: Color(0xff282828),
            fontSize: 16,
            fontFamily: 'PretendardSemiBold',
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: onIncrease,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(
                color: const Color(0xfff5f5f5),
                width: 2,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 20,
                color: Color(0xff8e8e8e),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
