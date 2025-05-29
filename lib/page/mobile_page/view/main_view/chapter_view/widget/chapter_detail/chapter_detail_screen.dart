import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/animation/chapter_detail_animation.dart';

class ChapterDetailScreen extends StatefulWidget {
  final ChapterModel chapterState;
  final VoidCallback onClose;

  const ChapterDetailScreen({
    super.key,
    required this.chapterState,
    required this.onClose,
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
        animation.show();
      } else {
        animation.hide();
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
          height: double.infinity,
          color: Colors.black,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: widget.onClose,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
