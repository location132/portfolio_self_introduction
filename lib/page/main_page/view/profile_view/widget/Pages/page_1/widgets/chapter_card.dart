import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/widgets/chapter_with_blur.dart';

class ChapterCard extends StatelessWidget {
  final Animation<Offset> leftSlide;
  final Animation<Offset> rightSlide;
  final Animation<double> fadeAnimation;
  final bool isUserClick;
  const ChapterCard({
    super.key,
    required this.leftSlide,
    required this.rightSlide,
    required this.fadeAnimation,
    required this.isUserClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: EdgeInsets.only(left: 130.sw, right: 130.sw, top: 110),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: leftSlide,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: const Text(
                      ProfilePage1Constants.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SlideTransition(
                  position: rightSlide,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: ChapterWithBlur(
                      isUserClick: isUserClick,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}
