// 위젯을 숨기거나, 보이게 하는 조건을 처리하는 유틸 클래스

class VisibleorOpacityCondition {
  // -- 조건 : 페이지 2 또는 페이지 3 일때 visible == true
  static bool isVisibleWith2And3(int scrollCount) {
    return scrollCount == 2 || scrollCount == 3;
  }

  // -- 조건 : 페이지 3 또는 페이지 4 일때 visible == true
  static bool isVisibleWith3And4(int scrollCount) {
    return scrollCount == 3 || scrollCount == 4;
  }

  // -- 조건 : 페이지 2 또는 페이지 3 일때 opacity == 1.0
  static double isOpacityWith2And3(int scrollCount) {
    return scrollCount == 2 || scrollCount == 3 || scrollCount == 4 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 0 또는 페이지 1 또는 페이지 2 일때 visible == true
  static bool isVisibleWith0between2(int scrollCount) {
    return scrollCount == 0 || scrollCount == 1 || scrollCount == 2;
  }

  // -- 조건 : 페이지 0 일때 visible == true
  static bool isVisibleWith0(int scrollCount) {
    return scrollCount != 0;
  }

  // -- 조건 : 페이지 1 일때 opacity == 1.0
  static double isOpacityWith1(int scrollCount) {
    return scrollCount == 1 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 2 일때 opacity == 1.0
  static double isOpacityWith2(int scrollCount) {
    return scrollCount == 2 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 0 또는 페이지 1 일때 opacity == 1.0
  static double isOpacityWith0And1(int scrollCount) {
    return scrollCount != 0 && scrollCount != 1 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 3 일때 opacity == 1.0
  static double isOpacityWith3(int scrollCount) {
    return scrollCount == 3 ? 1.0 : 0.0;
  }

  // -- 조건 : 페이지 4 일때 opacity == 1.0
  static double isOpacityWith4(int scrollCount) {
    return scrollCount == 4 ? 1.0 : 0.0;
  }
}
