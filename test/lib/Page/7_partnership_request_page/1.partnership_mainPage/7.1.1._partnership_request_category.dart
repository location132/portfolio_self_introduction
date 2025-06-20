//파트너쉽 요청 페이지에서 나오는 hot new normal widget//

/*
1. hot 표시
2. 시간을 측정하는 timeElapsed()
3. 해당하는 hot위젯을 누르면 요청글 페이지(7.4)로 이동 이동
 */

import 'package:flutter/material.dart';
import 'package:my_dream/Page/7_partnership_request_page/1.partnership_mainPage/7.1.2_partnership_request_customContainerBoard.dart';
import 'package:my_dream/Page/7_partnership_request_page/4.partnership_detail_page/7.4_partnership_detail_page.dart';

class PartnershipRequestHot extends StatefulWidget {
  final List<Map<String, dynamic>> hotData;
  const PartnershipRequestHot({super.key, required this.hotData});

  @override
  State<PartnershipRequestHot> createState() => _PartnershipRequestHotState();
}

class _PartnershipRequestHotState extends State<PartnershipRequestHot> {
  Widget _buildHotItem(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPartnershipPage(
                serverData: widget.hotData[index],
                type: 'hot',
                time: timeElapsed(widget.hotData[index]['writeTime']),
              ),
            ),
          );
        },
        child: UnifiedCustomContainer(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          data: widget.hotData[index],
          time: timeElapsed(widget.hotData[index]['writeTime']),
          type: 'hot',
        ));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.34,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff5f5f5),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.041, right: screenWidth * 0.041),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.022),
            _buildHotItem(0),
            SizedBox(height: screenHeight * 0.0116),
            _buildHotItem(1),
            SizedBox(height: screenHeight * 0.022),
          ],
        ),
      ),
    );
  }
}

//-------------------------------------------------------------
//-------------------------------------------------------------
//-------------------------------------------------------------
//-------------------------------------------------------------

//파트너쉽 요청 페이지에서 나오는 new or normal widget//

/*
1. 시간을 측정하는 timeElapsed()
2. 해당하는 normal위젯을 누르면 요청글 페이지(7.4)로 이동
 */

class PartnershipRequestNewAndNormal extends StatefulWidget {
  final List<Map<String, dynamic>> serverData;
  const PartnershipRequestNewAndNormal({super.key, required this.serverData});

  @override
  State<PartnershipRequestNewAndNormal> createState() =>
      _PartnershipRequestNewAndNormalState();
}

class _PartnershipRequestNewAndNormalState
    extends State<PartnershipRequestNewAndNormal> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.041, right: screenWidth * 0.041),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.serverData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  getNewData(widget.serverData[index]['writeTime'])
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPartnershipPage(
                              serverData: widget.serverData[index],
                              type: 'new',
                              time: timeElapsed(
                                  widget.serverData[index]['writeTime']),
                            ),
                          ),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPartnershipPage(
                              serverData: widget.serverData[index],
                              type: 'normal',
                              time: timeElapsed(
                                  widget.serverData[index]['writeTime']),
                            ),
                          ),
                        );
                },
                child: getNewData(widget.serverData[index]['writeTime'])
                    ? UnifiedCustomContainer(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        data: widget.serverData[index],
                        time:
                            timeElapsed(widget.serverData[index]['writeTime']),
                        type: 'new',
                      )
                    : CustomContainerNormal(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        index: index,
                        serverData: widget.serverData,
                        time:
                            timeElapsed(widget.serverData[index]['writeTime']),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 파트너쉽 요청(7.1)페이지에서 나오는 hot, new, normal 위젯의 내용이 최대 2줄까지 나오도록 만들어주는 위젯//

/*
1. 만약 내용글이 한줄이라면 /n 추가해서 ui 통일시킴
*/

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final TextSpan textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        color: Color(0xff393939),
        fontSize: 14,
        fontFamily: 'Pretendard',
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);
    final int lineCount = textPainter.computeLineMetrics().length;

    final String displayText = lineCount == 1 ? '$text\n' : text;

    return Text(
      displayText,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Color(0xff393939),
        fontSize: 14,
        fontFamily: 'Pretendard',
      ),
    );
  }
}
