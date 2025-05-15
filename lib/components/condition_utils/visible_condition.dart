// 위젯을 숨기거나, 보이게 하는 조건을 처리하는 유틸 클래스

class VisibleorOpacityCondition {
  // 사용중
  static double isOpacityWith0(int scrollCount) {
    return scrollCount != 0 ? 1.0 : 0.0;
  }

  static double isOpacityWith3(int scrollCount) {
    return scrollCount == 2 ||
            scrollCount == 3 ||
            scrollCount == 7 ||
            scrollCount == 8
        ? 1.0
        : 0.0;
  }

  // -- 조건 : 페이지 0 일때 visible == true
  static bool isVisibleWith0(int scrollCount) {
    return scrollCount != 0;
  }

  // -- 조건 : 페이지 1 일때 opacity == 1.0
  static double isOpacityWith1(int scrollCount) {
    return scrollCount == 1 ? 1.0 : 0.0;
  }

  // -- 조건 : 스크롤카운트가 맞을때 opacity == 1.0
  static double isImageTitleOpacity(int scrollCount, int scrollCount2) {
    return scrollCount == scrollCount2 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 0 또는 페이지 1 일때 opacity == 1.0
  static double isOpacityWith0And1(int scrollCount) {
    return (scrollCount == 0 ||
            scrollCount == 1 ||
            scrollCount == 4 ||
            scrollCount == 9 ||
            scrollCount == 10 ||
            scrollCount == 11 ||
            scrollCount == 12)
        ? 1.0
        : 0.0;
  }

  // -- 조건 : 페이지 3 일때 opacity == 1.0
  static double isOpacityWith4And5(int scrollCount) {
    return scrollCount == 4 || scrollCount == 5 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 4 일때 opacity == 1.0
  static double isOpacityWith4(int scrollCount) {
    return scrollCount == 4 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 4 일때 opacity == 1.0
  static double isOpacityWith5(int scrollCount) {
    return scrollCount == 5 ? 1.0 : 0.0;
  }

  //TODO: 삭제 예정

  // -- 조건 : 페이지 1 일때 opacity == 1.0
  static double isOpacityWith1_2(int scrollCount) {
    return scrollCount == 1 || scrollCount == 2 ? 1.0 : 0.0;
  }
}
