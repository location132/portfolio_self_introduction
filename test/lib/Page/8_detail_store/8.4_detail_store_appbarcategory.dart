import 'package:flutter/material.dart';

class DetailStoreAppbarcategory extends StatefulWidget {
  final Map<String, dynamic> detailStoreMenu;
  final Map<String, GlobalKey> categoryKeys;
  final ScrollController scrollController;

  const DetailStoreAppbarcategory({
    super.key,
    required this.detailStoreMenu,
    required this.categoryKeys,
    required this.scrollController,
  });

  @override
  State<DetailStoreAppbarcategory> createState() =>
      _DetailStoreAppbarcategoryState();
}

class _DetailStoreAppbarcategoryState extends State<DetailStoreAppbarcategory> {
  int _currentCategoryIndex = 0;
  final ScrollController _buttonScrollController = ScrollController();
  final List<GlobalKey> _buttonKeys = [];

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateCurrentCategory);
    _buttonKeys.addAll(List.generate(
      int.parse(widget.detailStoreMenu['titleCount']),
      (index) => GlobalKey(),
    ));
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateCurrentCategory);
    super.dispose();
  }

  // 색상 업데이트 및 버튼 스크롤
  void _updateCurrentCategory() {
    final categories = widget.detailStoreMenu['menuCategories'];
    int newIndex = -1;

    // 스크롤이 최하단에 도달했는지 확인
    bool isAtBottom = widget.scrollController.position.pixels >=
        widget.scrollController.position.maxScrollExtent - 140;

    if (isAtBottom) {
      // 스크롤이 최하단에 있으면 마지막 카테고리 선택
      newIndex = categories.length - 1;
    } else {
      for (int i = 0; i < categories.length; i++) {
        final categoryKey =
            widget.categoryKeys[categories[i]['classification']];
        if (categoryKey?.currentContext != null) {
          final RenderBox renderBox =
              categoryKey!.currentContext!.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);

          if (position.dy - 210 > 0) {
            newIndex = i > 0 ? i - 1 : 0;
            break;
          }
        }
      }

      // 모든 카테고리를 순회했지만 newIndex가 설정되지 않은 경우
      if (newIndex == -1) {
        newIndex = categories.length - 1;
      }
    }

    // 인덱스가 변경된 경우에만 업데이트
    if (_currentCategoryIndex != newIndex) {
      setState(() {
        _currentCategoryIndex = newIndex;
      });

      // 버튼 스크롤 처리
      _scrollButtonToLeft(_currentCategoryIndex);
    }
  }

  void _scrollButtonToLeft(int index) {
    if (index != -1 && index < _buttonKeys.length) {
      final buttonRenderBox =
          _buttonKeys[index].currentContext!.findRenderObject() as RenderBox;
      final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);
      final buttonOffset = _buttonScrollController.offset +
          buttonPosition.dx -
          MediaQuery.of(context).size.width * 0.041; // 왼쪽 패딩만큼 빼줌

      _buttonScrollController.animateTo(
        buttonOffset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  // 스크롤 자동이동 로직
  void _scrollToCategory(String categoryTitle) {
    final categoryKey = widget.categoryKeys[categoryTitle];
    if (categoryKey?.currentContext != null) {
      final RenderBox renderBox =
          categoryKey!.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      int index = widget.detailStoreMenu['menuCategories'].indexWhere(
          (category) => category['classification'] == categoryTitle);

      // 스크롤 컨트롤러의 리스너를 일시적으로 제거
      widget.scrollController.removeListener(_updateCurrentCategory);

      final scrollOffset = widget.scrollController.offset +
          position.dy -
          MediaQuery.of(context).padding.top -
          kToolbarHeight -
          65;

      widget.scrollController
          .animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      )
          .then((_) {
        // 스크롤이 완료된 후 리스너를 다시 추가
        widget.scrollController.addListener(_updateCurrentCategory);

        // 상태 업데이트
        setState(() {
          _currentCategoryIndex = index;
        });
        _scrollButtonToLeft(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.041),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                controller: _buttonScrollController,
                child: Row(
                  children: List.generate(
                    int.parse(widget.detailStoreMenu['titleCount']),
                    (index) {
                      var categoryTitle =
                          widget.detailStoreMenu['menuCategories'][index]
                              ['classification'];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                        child: TextButton(
                          key: _buttonKeys[index], // GlobalKey를 각 버튼에 할당
                          onPressed: () => _scrollToCategory(categoryTitle),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              side: BorderSide(
                                  width: 1.5,
                                  color: _currentCategoryIndex == index
                                      ? const Color(0xff6fbf8a)
                                      : Colors.grey),
                              visualDensity: VisualDensity.compact),
                          child: Text(
                            '$categoryTitle',
                            style: const TextStyle(
                              color: Color(0xff393939),
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
