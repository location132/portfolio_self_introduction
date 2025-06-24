import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/detail_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/pattern_card.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class FirstAppPage extends StatefulWidget {
  final double width;
  final bool isAppPageScrollStart;
  final Function()? onReachedBottom; // 바닥에 도달했을 때 호출될 콜백
  final Function()? onReachedTop; // 최상단에서 위로 스크롤할 때 호출될 콜백

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
  bool _isAtTop = true; // 초기에는 최상단에 있음

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
        _scrollController.position.maxScrollExtent - 10; // 10px 여유분

    final isAtTop = _scrollController.position.pixels <= 10; // 10px 여유분

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
    // 최상단에서 위로 스크롤하려고 하는 경우
    if (_isAtTop &&
        notification is ScrollUpdateNotification &&
        notification.scrollDelta! < 0) {
      // 음수는 위로 스크롤
      widget.onReachedTop?.call();
      return false; // 이벤트를 상위로 전달
    }

    // 스크롤이 끝에 도달했고, 더 아래로 스크롤하려고 하는 경우
    if (_isAtBottom &&
        notification is ScrollUpdateNotification &&
        notification.scrollDelta! > 0) {
      // 양수는 아래로 스크롤
      widget.onReachedBottom?.call();
      return false; // 이벤트를 상위로 전달
    }

    return true; // 이벤트를 소비하지 않음
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
            SizedBox(height: 50), // 바닥에 여유 공간 추가
          ],
        ),
      ),
    );
  }
}



        // 코딩 & 개발 패턴
        // 상태관리
        // 라이브러리
        // 협업 툴
        // 애니메이션