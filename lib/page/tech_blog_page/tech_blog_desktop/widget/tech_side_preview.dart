import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechSidePreview extends StatelessWidget {
  final bool sidePreviewOpacity;
  const TechSidePreview({super.key, required this.sidePreviewOpacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/Images/tech_img/tech_img.png',
              fit: BoxFit.cover,
            ),
            AnimatedOpacity(
              opacity: sidePreviewOpacity ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/Images/profile_card.png',
                      width: 340,

                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      right: 105,
                      top: 172,
                      child: Container(
                        width: 360,
                        height: 200,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Flutter NOTE',
                              style: GoogleFonts.pacifico(
                                fontSize: 28,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 105,
                      bottom: 132,
                      child: Container(
                        width: 360,
                        height: 200,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('@Flutter_이정원'),
                              SizedBox(height: 4),
                              Text('마우스를 호버하면 프리뷰를 볼 수 있어요'),
                              SizedBox(height: 4),
                              Text('#기술 블로그. #이정원. #Flutter'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 텍스트로 Flutter NOTE (날림체 구글 폰트 사용)
                        //
                        //
                        SizedBox(height: 40),
                        Center(
                          child: Container(
                            width: 360,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Flutter - 이정원',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('아직까지는 신입'),
                                SizedBox(height: 12),
                                Text('궁금한 기술정리 목록에 마우스를 올려주세요!'),
                                Text('해당 공간을 통해 어떤 내용인지 미리볼 수 있게 도와드릴게요'),
                                SizedBox(height: 32),
                                Text('하루하루 쌓아가는 지식들'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
