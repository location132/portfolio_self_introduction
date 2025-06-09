import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChapterPage extends StatelessWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;
  const ChapterPage({
    super.key,
    required this.state,
    required this.desktopCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VisibilityDetector(
          key: const Key('chapter-view'),
          onVisibilityChanged: (VisibilityInfo info) async {
            context.read<DesktopCubit>().setBackgroundForSection(
              'chapter',
              info.visibleFraction > 0.5,
            );

            if (info.visibleFraction > 0.5 &&
                !state.chapterModel.isBlackBackgroundColor) {
              await Future.delayed(const Duration(seconds: 1));
              if (context.mounted) {
                context.read<DesktopCubit>().viewListener('chapter');
              }
            }
          },
          child: DesktopChapterView(
            onCardTap: (int index) {
              print('Chapter $index clicked');
            },
            state: state,

            desktopCubit: desktopCubit,
          ),
        ),
      ],
    );
  }
}
