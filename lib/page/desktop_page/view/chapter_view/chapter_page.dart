import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
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
        SizedBox(height: 80.sh),
        VisibilityDetector(
          key: const Key('chapter-view'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.4 &&
                !state.chapterModel.isBlackBackgroundColor) {
              context.read<DesktopCubit>().blackBackgroundActive(true);
            } else if (info.visibleFraction < 0.4 &&
                state.chapterModel.isBlackBackgroundColor) {
              context.read<DesktopCubit>().blackBackgroundActive(false);
            }
          },
          child: DesktopChapterView(
            onCardTap: (int index) {
              print('Chapter $index clicked');
            },
            state: state,
            onDescriptionActive: (bool isActive) {
              context.read<DesktopCubit>().descriptionButton(
                'profile',
                isActive,
              );
            },
          ),
        ),
      ],
    );
  }
}
