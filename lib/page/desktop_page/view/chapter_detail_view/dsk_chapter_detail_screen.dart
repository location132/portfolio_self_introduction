import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/animation/chapter_detail_animation.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/dsk_chapter_contents.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_close_button.dart';

class DskChapterDetailScreen extends StatefulWidget {
  final ChapterModel chapterState;
  final VoidCallback onClose;
  final Function() chapterDetailButtonClicked;

  const DskChapterDetailScreen({
    super.key,
    required this.chapterState,
    required this.onClose,
    required this.chapterDetailButtonClicked,
  });

  @override
  State<DskChapterDetailScreen> createState() => _DskChapterDetailScreenState();
}

class _DskChapterDetailScreenState extends State<DskChapterDetailScreen>
    with TickerProviderStateMixin {
  late ChapterDetailAnimation animation;

  @override
  void initState() {
    super.initState();
    animation = ChapterDetailAnimation(vsync: this);

    if (widget.chapterState.isChapterDetailAni) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        animation.show();
      });
    }
  }

  @override
  void didUpdateWidget(DskChapterDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.chapterState.isChapterDetailAni !=
        oldWidget.chapterState.isChapterDetailAni) {
      if (widget.chapterState.isChapterDetailAni) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          animation.show();
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          animation.hide();
        });
      }
    }
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.chapterState.isChapterDetailVisible) {
      return const SizedBox.shrink();
    }

    return SlideTransition(
      position: animation.slideAnimation,
      child: FadeTransition(
        opacity: animation.opacityAnimation,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.85),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                DskChapterContents(
                  state: widget.chapterState,
                  chapterDetailButtonClicked: () {
                    widget.chapterDetailButtonClicked();
                  },
                ),
                DskCloseButtonWithIcon(onClose: widget.onClose),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
