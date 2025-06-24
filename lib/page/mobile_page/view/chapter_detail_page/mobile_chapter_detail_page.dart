import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_contents.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/close_button.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';

class MobileChapterDetailPage extends StatelessWidget {
  final int chapterIndex;

  const MobileChapterDetailPage({super.key, required this.chapterIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<MobileCubit>()..initChapterDetailPage(chapterIndex),
      child: _MobileChapterDetailContent(chapterIndex: chapterIndex),
    );
  }
}

class _MobileChapterDetailContent extends StatelessWidget {
  final int chapterIndex;

  const _MobileChapterDetailContent({required this.chapterIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileCubit, MobileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                // 챕터 컨텐츠 (전체 화면)
                ChapterContents(
                  state: state.chapterModel,
                  chapterDetailButtonClicked: () {
                    context.read<MobileCubit>().chapterDetailButtonClicked();
                  },
                ),
                // 플레이어 (뒤로가기 기능)
                Positioned(
                  bottom: 30.h,
                  left: 0,
                  right: 0,
                  child: Player(
                    isPlayerAniOpacity: true,
                    isPlayerText: '챕터 목록으로 돌아가기',
                    onTap: () {
                      context.pop();
                    },
                  ),
                ),
                // 닫기 버튼
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: CloseButtonWithIcon(
                    onClose: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
