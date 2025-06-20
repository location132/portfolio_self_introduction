import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/4.11_join_us.dart';
import 'package:my_dream/Page/4_main_page/components/main_container.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/mypage_filter_button.dart';
import 'package:my_dream/coreService/widget/paginationIndicator.dart';

import '../../../coreService/widget/searchbar.dart';

class DetailJoinUs extends StatefulWidget {
  const DetailJoinUs({super.key});

  @override
  State<DetailJoinUs> createState() => _DetailJoinUsState();
}

class _DetailJoinUsState extends State<DetailJoinUs> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  bool _showFloatingButton = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    if (_scrollController.offset > 30) {
      if (!_showFloatingButton) {
        setState(() {
          _showFloatingButton = true;
        });
      }
    } else {
      if (_showFloatingButton) {
        setState(() {
          _showFloatingButton = false;
        });
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // 상단 고정 부분
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.041,
                  ),
                  child: const Column(
                    children: [
                      CustomAppBar(title: '같이해요'),
                      Searchbar(textEditing: '같이 하고싶은 것을 검색해보세요.'),
                      SizedBox(height: 15),
                      MypageFilterButton(
                        selectedFilter: 1,
                        categoryType: 1,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                // 하단 내용 수정
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (index == 9) {
                        // 마지막 아이템일 경우 페이지네이션 표시
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                                left: screenWidth * 0.041,
                                right: screenWidth * 0.041,
                                bottom: 10,
                              ),
                              child: MainContainer(
                                height: screenHeight * 0.142,
                                content: const JoinUsContainer(),
                              ),
                            ),
                            PaginationIndicator(
                              currentPage: currentPage,
                              totalPages: 40,
                              onPageChanged: (page) {
                                setState(() {
                                  currentPage = page;
                                });
                                // TODO: 여기에 페이지 변경 시 데이터를 새로 불러오는 로직 추가
                              },
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).padding.bottom),
                          ],
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                          left: screenWidth * 0.041,
                          right: screenWidth * 0.041,
                          bottom: screenHeight * 0.012,
                          //bottom: 10,
                        ),
                        child: MainContainer(
                          height: screenHeight * 0.142,
                          content: const JoinUsContainer(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 420),
                opacity: _showFloatingButton ? 1.0 : 0.0,
                child: IgnorePointer(
                  ignoring: !_showFloatingButton,
                  child: FloatingActionButton(
                    heroTag: "fab1",
                    onPressed: () {
                      _scrollToTop();
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.arrow_upward,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              right: 20,
              bottom: _showFloatingButton ? 65 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 420),
                opacity: 1.0,
                child: FloatingActionButton(
                  heroTag: "fab2",
                  onPressed: () {
                    Navigator.pushNamed(context, '/JoinUsRequestPage');
                  },
                  backgroundColor: const Color(0xff6fbf8a),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
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
