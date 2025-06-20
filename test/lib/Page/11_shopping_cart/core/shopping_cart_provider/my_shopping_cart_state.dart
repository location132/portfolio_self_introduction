import 'package:flutter/material.dart';
import 'package:my_dream/model/cart.dart';

class CartProvider extends ChangeNotifier {
  // 선택된 아이템을 저장하는 Map - basketId를 키로 사용
  Map<int, List<bool>> selectedItems = {};

  // 모든 항목이 선택되었는지 여부를 저장
  bool _isAllSelected = false;

  // 전체 항목의 수
  int _totalItemCount = 0;

  // 선택된 항목의 총 금액
  int _totalSelectedAmount = 0;

  // 장바구니 데이터를 저장
  List<CartModel> _cartData = [];

  // 모든 항목이 선택되었는지 여부를 반환
  bool get isAllSelected => _isAllSelected;

  // 장바구니에 있는 전체 항목의 수를 반환
  int get totalItemCount => _totalItemCount;

  // 선택된 항목의 수를 반환
  int get selectedItemCount => selectedItems.values
      .expand((storeItems) => storeItems)
      .where((item) => item)
      .length;

  // 선택된 항목들의 총 금액을 반환
  int get totalSelectedAmount => _totalSelectedAmount;

  // 1개 이상 선택된 항목이 있는지 여부를 반환
  bool get hasSelectedItems => selectedItems.values
      .expand((storeItems) => storeItems)
      .any((item) => item);

  // 장바구니 데이터를 설정하고, 초기화
  void setCartData(List<CartModel> cartData) {
    _cartData = cartData;
    selectedItems.clear();
    _totalItemCount = 0;
    _totalSelectedAmount = 0;

    if (cartData.isNotEmpty) {
      CartModel store = cartData[0];
      int basketId = store.basketId ?? 0;
      selectedItems[basketId] = List.generate(store.menu.length, (_) => false);
      _totalItemCount += store.menu.length;
    }

    _isAllSelected = false;
    notifyListeners();
  }

  void toggleAllItemsInStore(int basketId) {
    // storeId -> basketId로 변경
    bool allSelected = selectedItems[basketId]?.every((item) => item) ?? false;
    selectedItems[basketId] = List.generate(
        selectedItems[basketId]?.length ?? 0, (_) => !allSelected);

    _updateTotalSelectedAmount();
    _updateAllSelectedStatus();
    notifyListeners();
  }

  // 총 선택 금액을 업데이트하는 메서드
  void _updateTotalSelectedAmount() {
    _totalSelectedAmount = 0;
    if (_cartData.isNotEmpty) {
      CartModel store = _cartData[0];
      int basketId = store.basketId ?? 0;
      final menuList = store.menu;

      for (var i = 0; i < menuList.length; i++) {
        if (selectedItems[basketId]?[i] ?? false) {
          _totalSelectedAmount += menuList[i].totalPrice;
        }
      }
    }
  }

  // 특정 항목의 선택 상태를 토글
  void toggleItemSelection(int basketId, int menuIndex) {
    if (_cartData.isNotEmpty &&
        _cartData[0].basketId == basketId &&
        selectedItems.containsKey(basketId) &&
        menuIndex < (selectedItems[basketId]?.length ?? 0)) {
      selectedItems[basketId]![menuIndex] =
          !selectedItems[basketId]![menuIndex];

      _updateTotalSelectedAmount();
      _updateAllSelectedStatus();
      notifyListeners();
    }
  }

  // 특정 항목이 선택되었는지 확인
  bool isItemSelected(int basketId, int menuIndex) {
    return selectedItems.containsKey(basketId) &&
        menuIndex < selectedItems[basketId]!.length &&
        selectedItems[basketId]![menuIndex];
  }

  // 모든 항목이 선택되었는지 여부를 업데이트
  void _updateAllSelectedStatus() {
    _isAllSelected = selectedItems.values
        .every((storeItems) => storeItems.every((item) => item));
  }

  // 선택된 basketId 목록을 반환하는 메서드
  List<int> getSelectedBasketIds() {
    List<int> selectedIds = [];
    for (var entry in selectedItems.entries) {
      if (entry.value.any((selected) => selected)) {
        selectedIds.add(entry.key);
      }
    }
    return selectedIds;
  }

  // 모든 항목의 선택 상태를 토글
  void toggleAllSelection() {
    _isAllSelected = !_isAllSelected;

    for (var store in _cartData) {
      int basketId = store.basketId ?? 0;
      final menuList = store.menu;
      selectedItems[basketId] =
          List.generate(menuList.length, (_) => _isAllSelected);
    }

    _updateTotalSelectedAmount();
    notifyListeners();
  }

  // 선택된 basketMenuId들을 반환하는 getter 추가
  List<int> get selectedBasketIds {
    List<int> ids = [];
    for (var store in _cartData) {
      int basketId = store.basketId ?? 0;
      var menuList = store.menu;
      for (int i = 0; i < menuList.length; i++) {
        if (selectedItems[basketId]?[i] == true) {
          ids.add(menuList[i].basketMenuId);
        }
      }
    }
    return ids;
  }
}

class MyCartLengthProvider extends ChangeNotifier {
  int _myCartLength = 0;

  int get myCartLength => _myCartLength;

  void setMyCartLength(int length) {
    _myCartLength = length;
    notifyListeners();
  }
}
