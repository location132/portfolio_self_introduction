import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dream/Page/13_join_us/13.1_join_us_detail_page.dart';
import 'package:my_dream/Page/4_main_page/components/main_SmoothPageIndicator.dart';
import 'package:my_dream/Page/4_main_page/components/main_container.dart';
import 'package:my_dream/Page/4_main_page/components/main_title_overview.dart';

class JoinUs extends StatelessWidget {
  JoinUs({super.key});

  final PageController _controller = PageController();

  final List<Map<String, dynamic>> serverResult = [{}, {}, {}];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        MainTitleOverview(
          title: '같이 하고싶은게 있다면?',
          onTap: () {
            Navigator.pushNamed(context, '/DetailJoinUs');
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 6),
          child: SizedBox(
            height: screenWidth * 0.387,
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                // 첫 번째 컨테이너
                if (serverResult.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.032,
                      right: screenWidth * 0.032,
                      top: 10,
                      bottom: 10,
                    ),
                    child: const MainContainer(
                      content: JoinUsContainer(),
                    ),
                  ),

                // 두 번째 컨테이너
                if (serverResult.length > 1)
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.032,
                        right: screenWidth * 0.032,
                        top: 10,
                        bottom: 10),
                    child: const MainContainer(
                      content: JoinUsContainer(),
                    ),
                  ),
                // 세 번째 컨테이너
                if (serverResult.length > 2)
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.032,
                        right: screenWidth * 0.032,
                        top: 10,
                        bottom: 10),
                    child: const MainContainer(
                      content: JoinUsContainer(),
                    ),
                  ),
              ],
            ),
          ),
        ),
        MainSmoothPageIndicator(
          controller: _controller,
          count: 3,
        ),
      ],
    );
  }
}

// 함께해요 컨테이너
class JoinUsContainer extends StatelessWidget {
  const JoinUsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const JoinUsDetailPage(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.039,
          vertical: screenWidth * 0.013,
        ),
        child: Column(
          children: [
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '태권치킨 같이 포장할 사람(1/2)',
                    style: TextStyle(
                      color: Color(0xff282828),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '10분 전',
                    style: TextStyle(
                      color: Color(0xffc1c1c1),
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            const Expanded(
              child: Text(
                '태권치킨 시키려고 하는데 배달비 아까워서 같이 시키실 분 있나요? 저는 모시래 기숙사에요!..태권치킨 시키려고 하는데 배달비 아까워서 같이 시키실 분 있나요? 저는 모시래 기숙사에요태권치킨 시키려고 하는데 배달비 아까워서 같이 시키실 분 있나요? 저는 모시래 기숙사에요태권치킨 시키려고 하는데 배달비 아까워서 같이 시키실 분 있나요? 저는 모시래 기숙사에요태권치킨 시키려고 하는데 배달비 아까워서 같이 시키실 분 있나요? 저는 모시래 기숙사에요.',
                style: TextStyle(
                  color: Color(0xff8e8e8e),
                  fontFamily: 'Pretendard',
                  height: 1.2,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.thumb_up_off_alt_outlined,
                      size: 20, color: Color(0xffc1c1c1)
                      // : const Color(0xff6fbf8a),
                      ),
                  SizedBox(width: screenWidth * 0.013),
                  const Text(
                    '1',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.039),
                  SvgPicture.asset(
                    'assets/images/chat.svg',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: screenWidth * 0.013),
                  const Text(
                    '2',
                    style: TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
