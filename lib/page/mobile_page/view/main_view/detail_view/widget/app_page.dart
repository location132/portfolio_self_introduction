import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/detail_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/pattern_card.dart';

class FirstAppPage extends StatelessWidget {
  final double width;

  const FirstAppPage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27),
          DetailDescription(),
          SizedBox(height: 30),
          PatternCardWithPattern(),
        ],
      ),
    );
  }
}



        // 코딩 & 개발 패턴
        // 상태관리
        // 라이브러리
        // 협업 툴
        // 애니메이션