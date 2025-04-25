import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class CommandScroll extends StatefulWidget {
  final MainPageState state;
  final Function(String) onScroll;
  const CommandScroll({super.key, required this.state, required this.onScroll});

  @override
  State<CommandScroll> createState() => _CommandScrollState();
}

class _CommandScrollState extends State<CommandScroll> {
  double _lastScrollPosition = 0;
  ScrollController? controller;
  int pageNumber = 1;

  late double initScrollPosition;

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
        controller!.jumpTo(initScrollPosition);
      }
    });
  }

  void checkPageNumber() {
    pageNumber = widget.state.profileModel.scrollCount;
    setState(() {});
    initScroll();
  }

  void _profileScrollListener() {
    final controller = widget.state.scrollModel.subScrollController;
    if (controller == null) return;

    double currentPosition = controller.position.pixels;
    double maxScroll = controller.position.maxScrollExtent;

    if (currentPosition > _lastScrollPosition) {
      if (currentPosition.toStringAsFixed(2) == maxScroll.toStringAsFixed(2)) {
        widget.onScroll('profile_isBottom');
      }
    } else if (currentPosition < _lastScrollPosition) {
      if (currentPosition.toStringAsFixed(2) == '0.00') {
        widget.onScroll('profile_isTop');
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
    if (pageNumber != widget.state.profileModel.scrollCount) {
      checkPageNumber();
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: SingleChildScrollView(
        physics: Conditions.isProfileViewScrollInactive(widget.state)
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        controller: widget.state.scrollModel.subScrollController,
        child: SizedBox(height: (MediaQuery.of(context).size.height + 10.sh)),
      ),
    );
  }
}
