import 'package:flutter/material.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/store_container.dart';

class DetailNewStore extends StatefulWidget {
  const DetailNewStore({super.key});

  @override
  State<DetailNewStore> createState() => _DetailNewStoreState();
}

class _DetailNewStoreState extends State<DetailNewStore> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Map<String, dynamic>> newStore = [];
  List<Map<String, dynamic>> originalStore = []; // 원래의 스토어 리스트 백업
  String page = '0';
  int storeCount = 0;
  bool _isLoadingFinish = false;
  bool _opacityText = false;
  bool _isFirstScreen = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  void _loadData() {
    final List<Map<String, dynamic>> severResult = ModalRoute.of(context)!
        .settings
        .arguments as List<Map<String, dynamic>>;
    newStoreToDio(severResult);
  }

  void newStoreToDio(var severResult) async {
    originalStore = severResult;
    newStore = List.from(originalStore); // 원래의 스토어 리스트 백업
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      storeCount = newStore.length;
      _isLoadingFinish = true;
    });
  }

  //검색 완료 후
  void isUserSearch(String value) async {
    if (value.isEmpty) {
      setState(() {
        _isFirstScreen = true;
        _opacityText = false;
        newStore = List.from(originalStore); // 원래 리스트로 복원
      });
    } else {
      List<Map<String, dynamic>> filteredStores = originalStore.where((store) {
        String name = store['marketName'].toString();
        String description = store['marketDescription'].toString();
        return _matchesSearch(name, value) ||
            _matchesSearch(description, value);
      }).toList();

      setState(() {
        newStore = filteredStores;
        _opacityText = true;
        _isFirstScreen = false;
      });
    }
  }

  bool _matchesSearch(String text, String search) {
    text = text.toLowerCase();
    search = search.toLowerCase();

    // 완전 일치 검색
    if (text.contains(search)) {
      return true;
    }

    // 초성 검색
    String textChosung = _getChosung(text);
    String searchChosung = _getChosung(search);
    if (textChosung.contains(searchChosung)) {
      return true;
    }

    // 부분 일치 검색 (2글자 이상일 때)
    if (search.length >= 2) {
      for (int i = 0; i < search.length - 1; i++) {
        if (text.contains(search.substring(i, i + 2))) {
          return true;
        }
      }
    }

    return false;
  }

  String _getChosung(String text) {
    const chosungList = [
      'ㄱ',
      'ㄲ',
      'ㄴ',
      'ㄷ',
      'ㄸ',
      'ㄹ',
      'ㅁ',
      'ㅂ',
      'ㅃ',
      'ㅅ',
      'ㅆ',
      'ㅇ',
      'ㅈ',
      'ㅉ',
      'ㅊ',
      'ㅋ',
      'ㅌ',
      'ㅍ',
      'ㅎ'
    ];
    String result = '';
    for (int i = 0; i < text.length; i++) {
      int code = text.codeUnitAt(i);
      if (code >= 44032 && code <= 55203) {
        int chosung = ((code - 44032) ~/ 588);
        result += chosungList[chosung];
      } else {
        result += text[i];
      }
    }
    return result;
  }

  //뒤로가기 로직
  void reSetScreen() {
    if (_opacityText) {
      setState(() {
        _textEditingController.text = '';
        _isFirstScreen = true;
        _opacityText = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.03, right: screenWidth * 0.041),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.064,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back_ios_rounded,
                                      size: 24),
                                  onPressed: () {
                                    reSetScreen();
                                  },
                                  style: TextButton.styleFrom(
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      '신규 스토어',
                                      style: TextStyle(
                                        color: Color(0xff111111),
                                        fontSize: 20,
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 24),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 1),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.011),
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: _textEditingController,
                                cursorHeight: 20,
                                textAlignVertical:
                                    const TextAlignVertical(y: 0.3),
                                maxLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  filled: true,
                                  fillColor: const Color(0xfff5f5f5),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 17),
                                    child: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: const Icon(
                                        Icons.search,
                                        size: 30,
                                        color: Color(0xff6fbf8a),
                                      ),
                                    ),
                                  ),
                                  hintText: '원하는 스토어를 검색해보세요',
                                  hintStyle: const TextStyle(
                                      color: Color(0xffc1c1c1),
                                      fontFamily: 'Pretendard'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onFieldSubmitted: (value) {
                                  isUserSearch(value);
                                },
                                onChanged: (value) {
                                  isUserSearch(value);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      // 처음 스크린
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 420),
                        opacity: _isFirstScreen ? 1.0 : 0.0,
                        child: IgnorePointer(
                          ignoring: !_isFirstScreen,
                          child: ListView.builder(
                            itemCount: originalStore.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/StoreDetail',
                                    arguments: {
                                      'marketId': originalStore[index]
                                          ['marketId'],
                                      'isFavorite': false,
                                    },
                                  );
                                },
                                child: StoreContainer(
                                  store: originalStore[index],
                                  isNewStore: true,
                                  isEditing: false,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      //두번째 스크린
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 420),
                        opacity: !_isFirstScreen ? 1.0 : 0.0,
                        child: IgnorePointer(
                          ignoring: _isFirstScreen,
                          child: ListView.builder(
                            itemCount: newStore.length + 1,
                            itemBuilder: (context, index) {
                              if (index == newStore.length) {
                                return IgnorePointer(
                                  ignoring: _opacityText,
                                  child: AnimatedOpacity(
                                    opacity: !_opacityText ? 0.0 : 1.0,
                                    duration: const Duration(milliseconds: 20),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.031),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '원하는 업체가 없으신가요?',
                                            style: TextStyle(
                                              color: Color(0xffc1c1c1),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          Text(
                                            '파트너십 요청하러 가기',
                                            style: TextStyle(
                                              color: Color(0xff8e8e8e),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return StoreContainer(
                                store: originalStore[index],
                                isNewStore: true,
                                isEditing: false,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //로딩 효과 애니메이션
            LodingGifIfsai(
              isLoadingFinish: _isLoadingFinish,
            ),
          ],
        ),
      ),
    );
  }
}
