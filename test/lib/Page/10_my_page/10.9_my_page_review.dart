import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/10.9.1_my_page_review_write_list.dart';
import 'package:my_dream/Page/10_my_page/10.9.2_my_page_review_already_write_list.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

// 마이페이지 리뷰관리 - 앱바, 리뷰쓰기 탭, 작성한리뷰 탭만 포함한 화면. 해당 화면에서 10.9.1, 10.9.2 불러와 사용

class MyPageReview extends StatefulWidget {
  const MyPageReview({super.key});

  @override
  State<MyPageReview> createState() => _MyPageReviewState();
}

class _MyPageReviewState extends State<MyPageReview>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: const CustomAppBar(title: '리뷰관리'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF282828),
                unselectedLabelColor: const Color(0xFFC1C1C1),
                indicatorColor: const Color(0xFF6FBF8A),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.sw,
                    color: Color(0xFF6FBF8A),
                  ),
                ),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: '리뷰 쓰기(4)'),
                  Tab(text: '작성한 리뷰(3)'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  MyPageReviewWriteList(),
                  MyPageReviewAlreadyWriteList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
