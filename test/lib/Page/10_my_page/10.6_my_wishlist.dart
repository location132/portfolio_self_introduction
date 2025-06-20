import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/mypage_filter_button.dart';
import 'package:my_dream/coreService/widget/store_container.dart';
import 'package:provider/provider.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  bool _isScreenLoad = false;
  final int _selectedFilter = 0;
  Map<String, dynamic> myFavorite = {'status': []};
  bool _isEditing = false;
  bool _isCheckBoxOpacoty = false;
  List<bool> _checkedItems = [];
  bool _isAllSelected = false;
  int favoriteCount = 0;
  int _lastMarketId = 0;
  final int _pageSize = 10;
  bool _hasMore = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        favoriteCount = ModalRoute.of(context)!.settings.arguments as int? ?? 0;
      });
      _loadFavorites();
    });
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMoreFavorites();
    }
  }

  // 찜한 목록 불러오기
  Future<void> _loadFavorites(
      {bool isInitial = true, int cacheMemory = 0}) async {
    if (!_hasMore) return;
    if (favoriteCount != 0) {
      var result =
          await getFavorite(_lastMarketId, _pageSize, cacheMemory: cacheMemory);
      if (result['status'].isEmpty && favoriteCount > 1 && cacheMemory == 0) {
        _loadFavorites(cacheMemory: 1);
      } else if (favoriteCount <= 10 &&
          favoriteCount != result['status'].length &&
          cacheMemory == 0) {
        _loadFavorites(cacheMemory: 1);
      } else {
        if (result['status'] != null && result['status'].isNotEmpty) {
          setState(() {
            if (isInitial) {
              myFavorite['status'] = result['status'];
            } else {
              myFavorite['status'].addAll(result['status']);
            }
            // 마지막 항목의 marketId를 저장
            _lastMarketId = myFavorite['status'].last['marketId'];
            _hasMore = result['status'].length == _pageSize;
            _checkedItems =
                List.generate(myFavorite['status'].length, (_) => false);
            _isScreenLoad = true;
          });
        } else {
          setState(() {
            _hasMore = false;
            _isScreenLoad = true;
          });
        }
      }
    } else {
      setState(() {
        _hasMore = false;
        _isScreenLoad = true;
        myFavorite['status'] = [];
      });
    }
  }

  Future<void> _loadMoreFavorites() async {
    if (!_hasMore || _isEditing) return;
    await _loadFavorites(isInitial: false);
  }

  // 찜한 목록 편집 모드 토글
  void _toggleEditing() async {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        _checkedItems =
            List.generate(myFavorite['status'].length, (_) => false);
        _isAllSelected = false;
      }
    });
    if (_isEditing) {
      await Future.delayed(const Duration(milliseconds: 300));
      _isCheckBoxOpacoty = !_isCheckBoxOpacoty;
    }
  }

  // 전체 선택 토글
  void _toggleAllSelection() {
    setState(() {
      _isAllSelected = !_isAllSelected;
      _checkedItems =
          List.generate(myFavorite['status'].length, (_) => _isAllSelected);
    });
  }

  // 선택된 아이템 삭제
  Future<void> _deleteSelectedItems() async {
    List<int> selectedIds = [];
    for (int i = 0; i < _checkedItems.length; i++) {
      if (_checkedItems[i]) {
        selectedIds.add(myFavorite['status'][i]['marketId']);
      }
    }

    if (selectedIds.isNotEmpty) {
      bool success = await deleteAllMarketFavorites(selectedIds);
      if (success && mounted) {
        setState(() {
          favoriteCount -= selectedIds.length;
          myFavorite['status']
              .removeWhere((item) => selectedIds.contains(item['marketId']));
          _checkedItems =
              List.generate(myFavorite['status'].length, (_) => false);
          _isEditing = false;
          _isAllSelected = false;
          _lastMarketId = 0; // 마지막 marketId를 0으로 초기화
          _hasMore = true; // 더 불러올 항목이 있다고 가정
        });

        Provider.of<ResetMyPage>(context, listen: false)
            .setFavoriteCount(favoriteCount);

        if (myFavorite['status'].isEmpty ||
            myFavorite['status'].length < _pageSize) {
          setState(() {
            _isScreenLoad = false;
          });
          await _loadFavorites(isInitial: true, cacheMemory: 1);
        }

        setState(() {
          _isScreenLoad = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final resetStorePage = Provider.of<ResetStorePage>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _isScreenLoad
                ? AnimatedOpacity(
                    opacity: _isScreenLoad ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 420),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child: Column(
                            children: [
                              CustomAppBar(
                                title: '찜한 목록',
                                edit: true,
                                isEditing: _isEditing,
                                onEditPressed: _toggleEditing,
                              ),
                              MypageFilterButton(
                                selectedFilter: _selectedFilter,
                                categoryType: 3,
                              ),
                              const SizedBox(height: 20),
                              Stack(
                                children: [
                                  Row(
                                    children: [
                                      AnimatedOpacity(
                                        opacity: !_isEditing ? 1.0 : 0.0,
                                        duration:
                                            const Duration(milliseconds: 420),
                                        child: Text(
                                          '전체 $favoriteCount개',
                                          style: const TextStyle(
                                            color: Color(0xff8e8e8e),
                                            fontSize: 15,
                                            fontFamily: 'PretendardSemiBold',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AnimatedOpacity(
                                    opacity: _isEditing ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Row(
                                      children: [
                                        Text(
                                          '선택(${_checkedItems.where((item) => item).length}/${myFavorite['status'].length})',
                                          style: const TextStyle(
                                            color: Color(0xff8e8e8e),
                                            fontSize: 15,
                                            fontFamily: 'PretendardSemiBold',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: _toggleAllSelection,
                                          child: const Text(
                                            '전체선택  ',
                                            style: TextStyle(
                                              color: Color(0xff8e8e8e),
                                              fontSize: 15,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                          width: 1.5,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffc1c1c1),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _deleteSelectedItems,
                                          child: const Text(
                                            '  삭제',
                                            style: TextStyle(
                                              color: Color(0xff8e8e8e),
                                              fontSize: 15,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Expanded(
                          child: myFavorite['status'].isNotEmpty
                              ? ListView.builder(
                                  controller: _scrollController,
                                  itemCount: myFavorite['status'].length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == myFavorite['status'].length) {
                                      return _hasMore && !_isEditing
                                          ? const SizedBox(
                                              width: 200,
                                              height: 200,
                                              child: LodingGifIfsaiTop(
                                                isLoadingFinish: false,
                                              ),
                                            )
                                          : const SizedBox();
                                    }

                                    final store = myFavorite['status'][index];
                                    final marketId = store['marketId'];

                                    final shouldShow = !resetStorePage
                                        .shouldRefreshFavoriteMypage(marketId);

                                    if (!shouldShow) {
                                      return const SizedBox.shrink();
                                    }

                                    return Stack(
                                      children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          padding: EdgeInsets.only(
                                              left: _isEditing ? 40 : 0),
                                          child: GestureDetector(
                                            onTap: _isEditing
                                                ? () {
                                                    setState(() {
                                                      _checkedItems[index] =
                                                          !_checkedItems[index];
                                                      _isAllSelected =
                                                          _checkedItems.every(
                                                              (item) => item);
                                                    });
                                                  }
                                                : () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      '/StoreDetail',
                                                      arguments: {
                                                        'marketId':
                                                            myFavorite['status']
                                                                    [index]
                                                                ['marketId'],
                                                        'isFavorite': true,
                                                      },
                                                    );
                                                  },
                                            child: StoreContainer(
                                              store: myFavorite['status']
                                                  [index],
                                              isNewStore: false,
                                              isEditing: _isEditing,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 0,
                                          bottom: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: AnimatedOpacity(
                                              opacity: _isEditing ? 1.0 : 0.0,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              child: Checkbox(
                                                value: _checkedItems[index],
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _checkedItems[index] =
                                                        value ?? false;
                                                    _isAllSelected =
                                                        _checkedItems.every(
                                                            (item) => item);
                                                  });
                                                },
                                                activeColor:
                                                    const Color(0xff6fbf8a),
                                                checkColor: Colors.white,
                                                side: const BorderSide(
                                                  color: Color(0xffdbdbdb),
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '찜한 목록이 없습니다.',
                                      style: TextStyle(
                                        color: Color(0xff8e8e8e),
                                        fontSize: 15,
                                        fontFamily: 'PretendardSemiBold',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.21),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            AnimatedOpacity(
              opacity: !_isScreenLoad ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: LodingGifIfsai(
                isLoadingFinish: _isScreenLoad,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
