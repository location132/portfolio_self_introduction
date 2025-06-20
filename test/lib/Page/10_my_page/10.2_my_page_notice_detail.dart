import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPageNoticeDetail extends StatefulWidget {
  const MyPageNoticeDetail({super.key});

  @override
  State<MyPageNoticeDetail> createState() => _MyPageNoticeDetailState();
}

class _MyPageNoticeDetailState extends State<MyPageNoticeDetail> {
  Map<String, dynamic> noticeDetail = {};
  bool _isScreenLoad = false;
  late int announceId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      announceId = ModalRoute.of(context)!.settings.arguments as int;
      getDioAnnounces();
    });
  }

  void getDioAnnounces() async {
    final result = await announcesDetail(announceId);
    setState(() {
      noticeDetail = result['status'] ?? {};
      _isScreenLoad = true;
    });
  }

  Widget _buildDescription(String description) {
    List<Widget> widgets = [];
    RegExp regexIMG = RegExp(r'\[이미지\](.*?)\[이미지\]');
    RegExp regexLINK = RegExp(r'\[링크\](.*?)\[링크\]');
    int lastIndex = 0;

    Iterable<RegExpMatch> imgMatches = regexIMG.allMatches(description);
    Iterable<RegExpMatch> linkMatches = regexLINK.allMatches(description);
    List<RegExpMatch> allMatches = [...imgMatches, ...linkMatches];

    allMatches.sort((a, b) => a.start.compareTo(b.start));

    for (var match in allMatches) {
      if (match.start > lastIndex) {
        widgets.add(Text(
          description.substring(lastIndex, match.start),
          style: const TextStyle(
            color: Color(0xff393939),
            fontFamily: 'Pretendard',
          ),
        ));
      }

      if (match.group(0)!.startsWith("[이미지]")) {
        String imageUrl = match.group(1)!;
        widgets.add(
          Image.network(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        );
      } else if (match.group(0)!.startsWith("[링크]")) {
        String linkUrl = match.group(1)!;
        widgets.add(
          GestureDetector(
            onTap: () async {
              String fullUrl =
                  linkUrl.startsWith('http') ? linkUrl : 'https://$linkUrl';
              Uri uri = Uri.parse(fullUrl);
              try {
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  throw '링크를 열 수 없습니다: $fullUrl';
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('오류: $e')),
                );
              }
            },
            child: Text(
              '[바로가기] $linkUrl',
              style: const TextStyle(
                color: Color(0xff6fbf8a),
                fontFamily: 'Pretendard',
              ),
            ),
          ),
        );
      }

      lastIndex = match.end;
    }

    if (lastIndex < description.length) {
      widgets.add(Text(
        description.substring(lastIndex),
        style: const TextStyle(
          color: Color(0xff393939),
          fontFamily: 'Pretendard',
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        bottom: F,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                  child: const CustomAppBar(title: '공지사항'),
                ),
                SizedBox(height: screenHeight * 0.014),
                const Divider(height: 1, color: Color(0xfff5f5f5)),
                SizedBox(height: screenHeight * 0.014),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _isScreenLoad
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.041),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              if (noticeDetail['important'] ==
                                                  true)
                                                const TextSpan(
                                                  text: '[중요] ',
                                                  style: TextStyle(
                                                    color: Color(0xfff64f4f),
                                                    fontSize: 18,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              TextSpan(
                                                text:
                                                    noticeDetail['title'] ?? '',
                                                style: const TextStyle(
                                                  color: Color(0xff393939),
                                                  fontSize: 18,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          noticeDetail['writeTime']
                                                  ?.substring(0, 16) ??
                                              '',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff8e8e8e),
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: screenHeight * 0.014),
                                  //const SizedBox(height: 20),
                                  const Divider(
                                      height: 1, color: Color(0xfff5f5f5)),
                                  SizedBox(height: screenHeight * 0.014),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.041),
                                    child: _buildDescription(
                                        noticeDetail['description'] ?? ''),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
}
