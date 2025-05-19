import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/profile_model.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/widgets/image_part.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/widgets/text_part.dart';

class Chapter2 extends StatefulWidget {
  final ProfileModel profileModel;
  const Chapter2({
    super.key,
    required this.profileModel,
  });

  @override
  State<Chapter2> createState() => _Chapter2State();
}

class _Chapter2State extends State<Chapter2> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.profileModel.scrollCount == 9 ||
              widget.profileModel.scrollCount == 10 ||
              widget.profileModel.scrollCount == 11 ||
              widget.profileModel.scrollCount == 12
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
              duration: const Duration(milliseconds: 520),
              width: (widget.profileModel.scrollCount == 8 ||
                      widget.profileModel.scrollCount == 9 ||
                      widget.profileModel.scrollCount == 12)
                  ? MediaQuery.of(context).size.width * 0.9
                  : (MediaQuery.of(context).size.width * 0.9) * 0.55,
              height: (widget.profileModel.scrollCount == 8 ||
                      widget.profileModel.scrollCount == 9 ||
                      widget.profileModel.scrollCount == 12)
                  ? MediaQuery.of(context).size.height * 0.55
                  : MediaQuery.of(context).size.height * 0.4,
              child: Visibility(
                visible: widget
                    .profileModel.profileChapter2Model.isImagePartReverseActive,
                child: ImagePart(
                  scrollCount: widget.profileModel.scrollCount,
                ),
              ),
            ),
            //-- TextPart
            AnimatedContainer(
              duration: const Duration(milliseconds: 520),
              width: widget.profileModel.scrollCount != 8 &&
                      widget.profileModel.scrollCount != 9 &&
                      widget.profileModel.scrollCount != 12
                  ? (MediaQuery.of(context).size.width * 0.9) * 0.45
                  : 0,
              child: Visibility(
                visible: widget
                    .profileModel.profileChapter2Model.isTextPartReverseActive,
                child: TextPart(
                  scrollCount: widget.profileModel.scrollCount,
                  previousCount: widget.profileModel.previousCount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
