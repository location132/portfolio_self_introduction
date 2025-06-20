/*
재사용

매장 상세 페이지 별점과, 리뷰에 관해서 재사용 가능한 위젯
*/

import 'package:flutter/material.dart';

class StoreRatingSummary extends StatelessWidget {
  final Map<String, dynamic> detailStoreInformation;
  final int marketId;

  const StoreRatingSummary({
    super.key,
    required this.detailStoreInformation,
    required this.marketId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 30,
          color: Color(0xfff7ce45),
        ),
        Text(
          ' ${detailStoreInformation['averageReviewScore'] != null ? ((detailStoreInformation['averageReviewScore'] as double) * 10).round() / 10 : '0'}',
          style: const TextStyle(
            color: Color(0xff282828),
            fontSize: 24,
            fontFamily: 'PretendardSemiBold',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/StoreReviewContainer',
                arguments: marketId);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            children: [
              Text(
                '리뷰 ${detailStoreInformation['reviewCount']}',
                style: const TextStyle(
                  color: Color(0xff8e8e8e),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
                color: Color(0xff8e8e8e),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
