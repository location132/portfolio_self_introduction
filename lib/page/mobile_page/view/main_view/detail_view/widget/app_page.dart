import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/detail_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/pattern_card.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class FirstAppPage extends StatefulWidget {
  final double width;
  final bool isAppPageScrollStart;
  final Function()? onReachedBottom;
  final Function()? onReachedTop;

  const FirstAppPage({
    super.key,
    required this.width,
    required this.isAppPageScrollStart,
    this.onReachedBottom,
    this.onReachedTop,
  });

  @override
  State<FirstAppPage> createState() => _FirstAppPageState();
}

class _FirstAppPageState extends State<FirstAppPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAtBottom = false;
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final isAtBottom =
        _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 10;

    final isAtTop = _scrollController.position.pixels <= 10;

    if (isAtBottom != _isAtBottom) {
      setState(() {
        _isAtBottom = isAtBottom;
      });
    }

    if (isAtTop != _isAtTop) {
      setState(() {
        _isAtTop = isAtTop;
      });
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (_isAtTop &&
        notification is ScrollUpdateNotification &&
        notification.scrollDelta! < 0) {
      widget.onReachedTop?.call();
      return false;
    }

    if (_isAtBottom &&
        notification is ScrollUpdateNotification &&
        notification.scrollDelta! > 0) {
      widget.onReachedBottom?.call();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotification,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics:
            widget.isAppPageScrollStart
                ? const ClampingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailDescription(),
            SizedBox(height: 30),
            // 개발 & 패턴
            TechCardSection(constantsType: PatternTextConstants),
            SizedBox(height: 30),
            // 상태관리
            TechCardSection(constantsType: StateManagementConstants),
            SizedBox(height: 30),
            // 생명주기
            TechCardSection(constantsType: LifecycleConstants),
            SizedBox(height: 30),
            // 애니메이션
            TechCardSection(constantsType: AnimationConstants),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
