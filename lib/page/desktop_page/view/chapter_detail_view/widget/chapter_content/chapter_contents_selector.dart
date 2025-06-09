import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/first_contents.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/second_contents.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/third_contents.dart';

class ChapterContentsSelector extends StatelessWidget {
  final ChapterModel state;

  const ChapterContentsSelector({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.selectedChapterIndex == 0) {
      return FirstContents(state: state);
    } else if (state.selectedChapterIndex == 1) {
      return SecondContents(state: state);
    } else if (state.selectedChapterIndex == 2) {
      return ThirdContents(state: state);
    }
    return const SizedBox.shrink();
  }
}
