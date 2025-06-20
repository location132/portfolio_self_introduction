import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/Page/10_my_page/10.10_my_page_review_write_comp.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

// 마이페이지 리뷰쓰기 - 앱바, 리뷰등록하기 버튼 포함, 10.10 리뷰 작성 양식 컴포넌트 불러와 사용

class MyPageReviewWriteBack extends StatelessWidget {
  const MyPageReviewWriteBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Column(
          children: [
            // 커스텀 앱바
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: const CustomAppBar(
                title: '리뷰쓰기',
              ),
            ),

            // 리뷰 작성 컴포넌트
            Expanded(
              child: SingleChildScrollView(
                child: const MyPageReviewWriteComp(),
              ),
            ),

            // 리뷰 등록하기 버튼
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: 리뷰 등록 로직 구현

                    // 뒤로 가기
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E8E8E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '리뷰 등록하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
