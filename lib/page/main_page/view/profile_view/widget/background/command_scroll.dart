/*
사용자의 스크롤을 감지해 다음 화면, 또는 이전화면으로 이동하는 기능을 담당하는 위젯
 */

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/profile_view_condition_utils.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class CommandScroll extends StatefulWidget {
  final MainPageState state;
  final MainPageCubit cubit;
  final Function() onTap;
  const CommandScroll(
      {super.key,
      required this.state,
      required this.cubit,
      required this.onTap});

  @override
  State<CommandScroll> createState() => _CommandScrollState();
}

class _CommandScrollState extends State<CommandScroll> {
  double _lastScrollPosition = 0;
  ScrollController? controller;

  double? initScrollPosition;

  @override
  void initState() {
    widget.state.scrollModel.subScrollController
        ?.addListener(_profileScrollListener);

    initScroll();

    super.initState();
  }

  void initScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller = widget.state.scrollModel.subScrollController;

      if (controller != null && controller!.hasClients) {
        initScrollPosition = controller!.position.maxScrollExtent / 2;
        controller!.jumpTo(initScrollPosition!);
      }
    });
  }

  void _profileScrollListener() async {
    final controller = widget.state.scrollModel.subScrollController;
    if (controller == null || widget.state.scrollModel.isScrollWaiting) {
      return;
    }

    double currentPosition = controller.position.pixels;
    double maxScroll = controller.position.maxScrollExtent;

    if (currentPosition > _lastScrollPosition) {
      // 스크롤 아래로 내려갔을 때
      if (currentPosition.toStringAsFixed(2) == maxScroll.toStringAsFixed(2)) {
        await widget.cubit.profileIsBottomScroll();
        initScroll();
      }
    } else if (currentPosition < _lastScrollPosition) {
      // 스크롤 위로 올려갔을 때
      if (currentPosition.toStringAsFixed(2) == '0.00') {
        await widget.cubit.profileIsTopScroll();
        initScroll();
      }
    }

    _lastScrollPosition = currentPosition;
  }

  @override
  void dispose() {
    widget.state.scrollModel.subScrollController
        ?.removeListener(_profileScrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.state.profileModel.scrollCount == 1) {
          widget.onTap();
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: ProfileViewConditionUtils.isProfileViewScrollInactive(
                  widget.state)
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          controller: widget.state.scrollModel.subScrollController,
          child: SizedBox(
            height: (MediaQuery.of(context).size.height + 10.sh),
          ),
        ),
      ),
    );
  }
}
