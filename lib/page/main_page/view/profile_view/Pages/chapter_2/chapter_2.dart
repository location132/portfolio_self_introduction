import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model/profile_chapter2_model.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/widgets/image_part.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/widgets/text_part.dart';

class Chapter2 extends StatefulWidget {
  final int scrollCount;
  final ProfileChapter2Model profileChapter2Model;

  const Chapter2(
      {super.key,
      required this.scrollCount,
      required this.profileChapter2Model});

  @override
  State<Chapter2> createState() => _Chapter2State();
}

class _Chapter2State extends State<Chapter2> with TickerProviderStateMixin {
  @override
  void didUpdateWidget(Chapter2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 10) {}
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.scrollCount == 9 ||
              widget.scrollCount == 10 ||
              widget.scrollCount == 11
          ? 1
          : 0,
      duration: const Duration(milliseconds: 720),
      child: Padding(
        padding: EdgeInsets.only(
          top: 100.sh,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //-- ImagePart
            AnimatedContainer(
              duration: const Duration(milliseconds: 620),
              width: (widget.scrollCount == 8 || widget.scrollCount == 9)
                  ? MediaQuery.of(context).size.width * 0.9
                  : (MediaQuery.of(context).size.width * 0.9) * 0.55,
              height: (widget.scrollCount == 8 || widget.scrollCount == 9)
                  ? MediaQuery.of(context).size.height * 0.55
                  : MediaQuery.of(context).size.height * 0.4,
              child: ImagePart(
                scrollCount: widget.scrollCount,
              ),
            ),
            //-- TextPart
            AnimatedContainer(
              duration: const Duration(milliseconds: 620),
              width: widget.scrollCount != 8 && widget.scrollCount != 9
                  ? (MediaQuery.of(context).size.width * 0.9) * 0.45
                  : 0,
              child: Visibility(
                visible: widget.scrollCount == 10,
                child: TextPart(
                  scrollCount: widget.scrollCount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
