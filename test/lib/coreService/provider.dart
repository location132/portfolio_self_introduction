import 'package:flutter/material.dart';

// 로그인 모델
class LoginModel with ChangeNotifier {
  bool _loginStatus = false; // 로그인 확인
  bool _isStudent = false; // 학생 여부
  String _studentEmail = ''; // 학생 이메일
  String _onProfileImageReceived = ''; // 사용자 프로필 이미지
  int _basketCount = 0; // 장바구니 개수

  bool get isStudent => _isStudent;
  String get studentEmail => _studentEmail;
  String get onProfileImageReceived => _onProfileImageReceived;
  bool get loginStatus => _loginStatus;
  int get basketCount => _basketCount;

  // 로그인 상태 확인
  void setloginStatus(bool loginStatus) {
    _loginStatus = loginStatus;
    notifyListeners();
  }

  // 사용자 프로필 이미지 확인
  void setOnProfileImageReceived(String profileImage) {
    _onProfileImageReceived = profileImage;
    notifyListeners();
  }

  // 학생 이메일 확인
  void setStudentEmail(String studentEmail) {
    _studentEmail = studentEmail;
    notifyListeners();
  }

  // 학생 여부 확인
  void setIsStudent(bool isStudent) {
    _isStudent = isStudent;
    print('학생 : $_isStudent');
    notifyListeners();
  }

  // 장바구니 개수 확인
  void setBasketCount(int basketCount) {
    _basketCount = basketCount;
    print('장바구니 개수 : $_basketCount');
    notifyListeners();
  }
}

// 회원가입 모델
class JoinModel with ChangeNotifier {
  bool _isEmailState = false; // 이메일 성공 여부
  bool _isRetypeEmail = false; // 모달창 이메일 재 입력
  String _isUserEmail = ''; // 유저 이메일
  bool _isFirstClickSNSLogin = true;
  // 사용자가 처음으로 sns 로그인을 클릭 (로그인 중 다른 sns버튼 클릭시 2개 로그인 되는 현상 버그)
  bool _istryEmailCode = false; // 인증번호 입력 키보드 올리기

  bool get isEmailState => _isEmailState;
  bool get isRetypeEmail => _isRetypeEmail;
  String get isUserEmail => _isUserEmail;
  bool get isFirstClickSNSLogin => _isFirstClickSNSLogin;
  bool get istryEmailCode => _istryEmailCode;

  void setEmailStatus(bool emailStatus) {
    _isEmailState = emailStatus;
    notifyListeners();
  }

  void setRetypeEmail(bool reTypeEmail) {
    _isRetypeEmail = reTypeEmail;
    notifyListeners();
  }

  void setUserEmailStatus(String userEmail) {
    _isUserEmail = userEmail;
    notifyListeners();
  }

  void setIsFirstClickSNSLogin(bool isFirst) {
    _isFirstClickSNSLogin = isFirst;
    notifyListeners();
  }

  void setIstryEmailCode(bool istryEmailCode) {
    _istryEmailCode = istryEmailCode;
    notifyListeners();
  }
}

class SearchBarModel with ChangeNotifier {
  bool _isFirstTab = true; // 검색창 처음 클릭
  bool _isSearchScreen = false; // 검색 화면
  bool _isRemoveSearchHistory = false; // 검색 기록 모두 삭제
  bool _isSearchResultsScreen = false; // 검색 후 화면
  bool _isresultSearchAni = true; // 검색화면 애니메이션 작동 중이면 true로 사용자 클릭 막기
  String _isUserTextController = ''; // 사용자가 검색한 값

  bool get isFirstTab => _isFirstTab;
  bool get isSearchScreen => _isSearchScreen;
  bool get isRemoveSearchHistory => _isRemoveSearchHistory;
  bool get isSearchResultsScreen => _isSearchResultsScreen;
  bool get isresultSearchAni => _isresultSearchAni;
  String get isUserTextController => _isUserTextController;

  void setFirstTabStatus(bool firstTab) {
    _isFirstTab = firstTab;
    notifyListeners();
  }

  void setSearchScreenStaus(bool searchScreen) {
    _isSearchScreen = searchScreen;
    notifyListeners();
  }

  void setRemoveSearchHistory(bool searchHistory) {
    _isRemoveSearchHistory = searchHistory;
    notifyListeners();
  }

  void setSearchResultsScreen(bool resultsScreen) {
    _isSearchResultsScreen = resultsScreen;
    notifyListeners();
  }

  void setresultSearchAni(bool resultAni) {
    _isresultSearchAni = resultAni;
    notifyListeners();
  }

  void setSearchController(String searchController) {
    _isUserTextController = searchController;
    notifyListeners();
  }
}

class SearchBarModel2 with ChangeNotifier {
  String _userInputForRelatedSearch = ''; // 사용자 입력 (초성 포함) 연관 검색어용
  List<String> _previousValue = []; // 이전 연관기록 저장

  String get userInputForRelatedSearch => _userInputForRelatedSearch;
  List<String> get previousValue => _previousValue;

  void setUserInputForRelatedSearch(String input) {
    _userInputForRelatedSearch = input;
    // print(_userInputForRelatedSearch);
    notifyListeners();
  }

  // 사용자 겁색 기록 저장
  void previousValueHistory(
    List<String> issevervaildate,
  ) {
    _previousValue = issevervaildate;
  }
}

class SearchScreenModel with ChangeNotifier {
  List<Map<String, dynamic>>? _searchHistory; // 검색 히스토리
  List<Map<String, dynamic>>? _popularSearches; // 인기 검색어

  List<Map<String, dynamic>>? get searchHistory => _searchHistory;
  List<Map<String, dynamic>>? get popularSearches => _popularSearches;

  void setStartSearch(List<Map<String, dynamic>> searchHistory) {
    _searchHistory = searchHistory;
    notifyListeners();
  }

  void setPopularSearches(List<Map<String, dynamic>> popularSearches) {
    _popularSearches = popularSearches;
    notifyListeners();
  }
}

class PartnershipRequestModel with ChangeNotifier {
  String? _selectedBusinessName;
  String? _selectedBusinessAddress;
  String? _selectedBusinessDetailAddress;
  String? _selectedBusinessPhone;
  double? _selectedLatitude;
  double? _selectedLongitude;
  dynamic _selectedImage;

  String? get selectedBusinessName => _selectedBusinessName;
  String? get selectedBusinessAddress => _selectedBusinessAddress;
  String? get selectedBusinessDetailAddress => _selectedBusinessDetailAddress;
  String? get selectedBusinessPhone => _selectedBusinessPhone;
  double? get selectedLatitude => _selectedLatitude;
  double? get selectedLongitude => _selectedLongitude;
  dynamic get selectedImage => _selectedImage;

  void setSelectedBusiness(String name, String address, String detailAddress,
      String phone, double latitude, double longitude) {
    _selectedBusinessName = name;
    _selectedBusinessAddress = address;
    _selectedBusinessDetailAddress = detailAddress;
    _selectedBusinessPhone = phone;
    _selectedLatitude = latitude;
    _selectedLongitude = longitude;
    notifyListeners();
  }

  void setBusinessImage(dynamic image) {
    _selectedImage = image;
    notifyListeners();
  }

  void setBusinessName(String name) {
    _selectedBusinessName = name;
    notifyListeners();
  }

  void setBusinessAddress(String address) {
    _selectedBusinessAddress = address;
    notifyListeners();
  }

  void setBusinessDetailAddress(String detailAddress) {
    _selectedBusinessDetailAddress = detailAddress;
    notifyListeners();
  }

  void setBusinessPhone(String phone) {
    _selectedBusinessPhone = phone;
    notifyListeners();
  }

  void clearSelectedBusiness() {
    _selectedBusinessName = null;
    _selectedBusinessAddress = null;
    _selectedBusinessDetailAddress = null;
    _selectedBusinessPhone = null;
    _selectedLatitude = null;
    _selectedLongitude = null;
    notifyListeners();
  }
}

// 파트너쉽 수정 페이지에서 데이터 관리하기 위해 생성함
class PartnershipRequestChangeModel with ChangeNotifier {
  String? _selectedBusinessName;
  String? _selectedBusinessAddress;
  String? _selectedBusinessDetailAddress;
  String? _selectedBusinessPhone;
  double? _selectedLatitude;
  double? _selectedLongitude;
  dynamic _selectedImage;

  String? get selectedBusinessName => _selectedBusinessName;
  String? get selectedBusinessAddress => _selectedBusinessAddress;
  String? get selectedBusinessDetailAddress => _selectedBusinessDetailAddress;
  String? get selectedBusinessPhone => _selectedBusinessPhone;
  double? get selectedLatitude => _selectedLatitude;
  double? get selectedLongitude => _selectedLongitude;
  dynamic get selectedImage => _selectedImage;

  void setSelectedBusiness(String name, String address, String detailAddress,
      String phone, double latitude, double longitude) {
    _selectedBusinessName = name;
    _selectedBusinessAddress = address;
    _selectedBusinessDetailAddress = detailAddress;
    _selectedBusinessPhone = phone;
    _selectedLatitude = latitude;
    _selectedLongitude = longitude;
    notifyListeners();
  }

  void setBusinessImage(dynamic image) {
    _selectedImage = image;
    notifyListeners();
  }

  void setBusinessName(String name) {
    _selectedBusinessName = name;
    notifyListeners();
  }

  void setBusinessAddress(String address) {
    _selectedBusinessAddress = address;
    notifyListeners();
  }

  void setBusinessDetailAddress(String detailAddress) {
    _selectedBusinessDetailAddress = detailAddress;
    notifyListeners();
  }

  void setBusinessPhone(String phone) {
    _selectedBusinessPhone = phone;
    notifyListeners();
  }

  void clearSelectedBusiness() {
    _selectedBusinessName = null;
    _selectedBusinessAddress = null;
    _selectedBusinessDetailAddress = null;
    _selectedBusinessPhone = null;
    _selectedLatitude = null;
    _selectedLongitude = null;
    notifyListeners();
  }
}

class PageRoutes with ChangeNotifier {
  String _pageController = '';
  bool _isRetryStoreDetail = false;

  String get pageController => _pageController;
  bool get isRetryStoreDetail => _isRetryStoreDetail;

  void setPageController(String pageController) {
    _pageController = pageController;
    notifyListeners();
  }

  void setclearPageController() {
    _pageController = '';
    notifyListeners();
  }

  // 매장 상세 화면 새로고침
  void setRetryStoreDetail(bool isRetry) {
    _isRetryStoreDetail = isRetry;
    notifyListeners();
  }
}

class MenuPrice with ChangeNotifier {
  int _mainMenuPrice = 0; // 메인 메뉴 가격
  int _optionPrice = 0; // 옵션 가격
  int _menuId = 0; // 메뉴 아이디
  int _quantity = 1; // 메뉴 개수
  final Map<int, List<int>> _selectedOptionIds = {}; // 선택한 옵션 아이디

  int get mainMenuPrice => _mainMenuPrice;
  int get optionPrice => _optionPrice;
  int get menuId => _menuId;
  int get quantity => _quantity;
  Map<int, List<int>> get selectedOptionIds => _selectedOptionIds;

  // 메인 메뉴 가격 계산
  void setFinalPrice(int price) {
    _mainMenuPrice = price;
    notifyListeners();
  }

  // 사이드 메뉴 가격 계산
  void setOptionPrice(int price) {
    _optionPrice = price;
    notifyListeners();
  }

  // 메뉴 아이디 설정
  void setMenuId(int id) {
    _menuId = id;
    notifyListeners();
  }

  // 옵션 아이디 추가
  void addOptionId(int groupIndex, int optionId) {
    // 그룹 인덱스가 없으면 추가
    if (!_selectedOptionIds.containsKey(groupIndex)) {
      _selectedOptionIds[groupIndex] = [];
    }
    // 옵션 아이디가 없으면 추가
    if (!_selectedOptionIds[groupIndex]!.contains(optionId)) {
      _selectedOptionIds[groupIndex]!.add(optionId);
      notifyListeners();
    }
  }

  // 메뉴 개수 추가
  void addQuantity(int quantity) {
    _quantity = quantity;
    notifyListeners();
  }

  // 옵션 아이디 삭제
  void removeOptionId(int groupIndex, int optionId) {
    if (_selectedOptionIds.containsKey(groupIndex)) {
      _selectedOptionIds[groupIndex]!.remove(optionId);
      if (_selectedOptionIds[groupIndex]!.isEmpty) {
        _selectedOptionIds.remove(groupIndex);
      }
      notifyListeners();
    }
  }

  // 옵션 아이디 설정
  void setOptionId(int groupIndex, int optionId) {
    _selectedOptionIds[groupIndex] = [optionId];
    notifyListeners();
  }

  // 모든 데이터 초기화
  Future<void> clearAll() async {
    _mainMenuPrice = 0;
    _optionPrice = 0;
    _menuId = 0;
    _quantity = 1;
    _selectedOptionIds.clear();
    notifyListeners();
  }
}

//매장 상세페이지 새로고침 상태관리
class ResetStorePage with ChangeNotifier {
  final Map<int, bool> _isFavorite = {}; // 좋아요 목록
  final Map<int, bool> _isCouponse = {}; // 쿠폰 목록
  final Map<int, bool> _isMyPage = {}; // 쿠폰 목록

  Map<int, bool> get isFavorite => _isFavorite;
  Map<int, bool> get isCouponse => _isCouponse;
  Map<int, bool> get isMyPage => _isMyPage;

  // 매장별 좋아요 상태 토글 함수
  void toggleFavorite(int storeId, bool favorite) {
    _isFavorite[storeId] = favorite;
    notifyListeners();
  }

  // 매장별 쿠폰 상태 토글 함수
  void toggleCouponse(int storeId, bool couponse) {
    _isCouponse[storeId] = couponse;
    notifyListeners();
  }

  // 마이페이지 좋아요 상태 토글 함수
  void toggleFavoriteMypage(int storeId, bool favorite) {
    _isMyPage[storeId] = favorite;
    notifyListeners();
  }

  // 매장별 좋아요 새로고침 여부 확인
  bool shouldRefreshFavorite(int storeId) {
    return _isFavorite[storeId] ?? false;
  }

  // 매장별 쿠폰 새로고침 여부 확인
  bool shouldRefreshCouponse(int storeId) {
    return _isCouponse[storeId] ?? false;
  }

  // 마이페이지매장별 좋아요 새로고침 여부 확인
  bool shouldRefreshFavoriteMypage(int storeId) {
    return _isMyPage[storeId] ?? false;
  }

  // 마켓 아이디와 상관없이 모든 favorite 상태를 true로 변경하는 함수
  void toggleAllFavoritesToTrue() {
    _isMyPage.updateAll((key, value) => false);
    notifyListeners();
  }
}

class ResetMyPage with ChangeNotifier {
  int _isFavoriteCount = 0; // 좋아요 카운트

  int get isFavoriteCount => _isFavoriteCount;

  void setFavoriteCount(int isFavoriteCount) {
    _isFavoriteCount = isFavoriteCount;
    notifyListeners();
  }
}

// 하단 네비게이션 모델
class BottomNavigationModel with ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void setSelectedTab(int tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}

// 네이버 맵 프로바이더
class NaverMapProvider with ChangeNotifier {
  bool _isNaverMapOpacity = false; // 네이버맵 투명도
  bool _isNaverMapReady = false; // 네이버맵 준비 여부 (한번 실행되면 무조건 true 유지)

  bool get isNaverMapOpacity => _isNaverMapOpacity;
  bool get isNaverMapReady => _isNaverMapReady;

  void setIsNaverMapOpacity(bool isNaverMapOpacity) {
    _isNaverMapOpacity = isNaverMapOpacity;
    notifyListeners();
  }

  void setIsNaverMapReady(bool isNaverMapReady) {
    _isNaverMapReady = isNaverMapReady;
    notifyListeners();
  }
}
