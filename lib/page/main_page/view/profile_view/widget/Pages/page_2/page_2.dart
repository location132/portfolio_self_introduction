import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_2/widgets/ImageTitleWith3.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_2/widgets/ImageTitleWith4.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_2/widgets/chapter_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_2/widgets/ImageTitleWith2.dart';

class Page2 extends StatelessWidget {
  final MainPageState state;
  const Page2({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: VisibleorOpacityCondition.isOpacityWith2And3(
          state.profileModel.scrollCount),
      duration: const Duration(milliseconds: 720),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                const ChapterTitle(),
                ImageTitleWith2(state: state),
                ImageTitleWith3(state: state),
                ImageTitleWith4(state: state),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
