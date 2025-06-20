import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class MyPageNotice extends StatefulWidget {
  const MyPageNotice({super.key});

  @override
  State<MyPageNotice> createState() => _MyPageNoticeState();
}

class _MyPageNoticeState extends State<MyPageNotice> {
  int pageNum = 1;
  int standartNum = 0;
  int saveNum = 0;
  bool _isScreenLoad = false;

// 공지사항 가져오기
  Map<String, dynamic> announcesGetImportant = {};
  Map<String, dynamic> announcesGet = {};

  List<dynamic> importantAnnouncements = [];
  List<dynamic> regularAnnouncements = [];
  int currentPage = 1;
  int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    getDioAnnounces();
  }

// 모든 공지하상 가져오기
  void getDioAnnounces() async {
    announcesGetImportant = await announces(true);
    announcesGet = await announces(false);

    setState(() {
      importantAnnouncements = announcesGetImportant['status'] ?? [];
      regularAnnouncements = announcesGet['status'] ?? [];
      _isScreenLoad = true;
    });
  }

  bool nextPage(int page) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _isScreenLoad
                ? AnimatedOpacity(
                    opacity: _isScreenLoad ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 420),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child: const Column(
                            children: [
                              CustomAppBar(title: '공지사항'),
                              Divider(height: 1, color: Color(0xfff5f5f5)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // 중요 공지사항
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: importantAnnouncements.length,
                                  itemBuilder: (context, index) {
                                    final announcement =
                                        importantAnnouncements[index];
                                    return _buildAnnouncementItem(
                                        announcement, true);
                                  },
                                ),
                                Container(
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xfff5f5f5),
                                  ),
                                ),
                                // 일반 공지사항
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _getPagedAnnouncementsCount(),
                                  itemBuilder: (context, index) {
                                    final announcement =
                                        _getPagedAnnouncement(index);
                                    return _buildAnnouncementItem(
                                        announcement, false);
                                  },
                                ),
                                const SizedBox(height: 20),
                                _buildPagination(),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            AnimatedOpacity(
              opacity: !_isScreenLoad ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: LodingGifIfsai(
                isLoadingFinish: _isScreenLoad,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementItem(dynamic announcement, bool isImportant) {
    return SizedBox(
      height: 79.5,
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/MyPageNoticeDetail',
                  arguments: announcement['announceId'],
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    if (isImportant) ...[
                      Transform.translate(
                        offset: const Offset(0, -9),
                        child: const Icon(
                          Icons.push_pin_outlined,
                          color: Color(0xff6fbf8a),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 9),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                if (isImportant)
                                  const TextSpan(
                                    text: '[중요] ',
                                    style: TextStyle(
                                        color: Color(0xfff64f4f),
                                        fontFamily: 'Pretendard-SemiBold',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                TextSpan(
                                  text: announcement['title'],
                                  style: const TextStyle(
                                    color: Color(0xff393939),
                                    fontFamily: 'Pretendard',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            announcement['writeTime']
                                .substring(0, 10)
                                .replaceAll('-', '.'), // YYYY-MM-DD 형식으로 표시
                            style: const TextStyle(
                              color: Color(0xff8e8e8e),
                              fontFamily: 'Pretendard',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff8e8e8e),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xfff5f5f5)),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    int totalPages = (regularAnnouncements.length / itemsPerPage).ceil();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPageButton(Icons.keyboard_arrow_left, () {
          if (currentPage > 1) {
            setState(() {
              currentPage--;
            });
          }
        }),
        ...List.generate(
          totalPages,
          (index) => _buildPageNumberButton(index + 1),
        ),
        _buildPageButton(Icons.keyboard_arrow_right, () {
          if (currentPage < totalPages) {
            setState(() {
              currentPage++;
            });
          }
        }),
      ],
    );
  }

  Widget _buildPageButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Icon(
        icon,
        size: 20,
        color: const Color(0xffc1c1c1),
      ),
    );
  }

  Widget _buildPageNumberButton(int pageNumber) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          currentPage = pageNumber;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          '$pageNumber',
          style: TextStyle(
            color: currentPage == pageNumber
                ? const Color(0xff6fbf8a)
                : const Color(0xff8e8e8e),
            fontSize: 14,
            fontFamily: 'Pretendard',
          ),
        ),
      ),
    );
  }

  int _getPagedAnnouncementsCount() {
    int startIndex = (currentPage - 1) * itemsPerPage;
    return min(itemsPerPage, regularAnnouncements.length - startIndex);
  }

  dynamic _getPagedAnnouncement(int index) {
    int startIndex = (currentPage - 1) * itemsPerPage;
    return regularAnnouncements[startIndex + index];
  }
}
