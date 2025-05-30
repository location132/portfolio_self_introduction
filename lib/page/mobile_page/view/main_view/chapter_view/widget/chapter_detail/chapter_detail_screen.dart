import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/animation/chapter_detail_animation.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_contents.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/close_button.dart';

class ChapterDetailScreen extends StatefulWidget {
  final ChapterModel chapterState;
  final VoidCallback onClose;
  final Function() chapterDetailButtonClicked;

  const ChapterDetailScreen({
    super.key,
    required this.chapterState,
    required this.onClose,
    required this.chapterDetailButtonClicked,
  });

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen>
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
  void didUpdateWidget(ChapterDetailScreen oldWidget) {
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
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.85),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                ChapterContents(
                  state: widget.chapterState,
                  chapterDetailButtonClicked: () {
                    widget.chapterDetailButtonClicked();
                  },
                ),
                CloseButtonWithIcon(onClose: widget.onClose),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
