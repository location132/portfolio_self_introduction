/*
 스크롤 컨트롤러 무한 스크롤
*/

import 'package:flutter/material.dart';

mixin ScrollControllerMixin<T extends StatefulWidget> on State<T> {
  late ScrollController scrollController;
  bool isLoading = false;
  DateTime? lastLoadTime;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final now = DateTime.now();

    if (lastLoadTime == null ||
        now.difference(lastLoadTime!) > const Duration(seconds: 1)) {
      if (!isLoading &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200) {
        isLoading = true;
        onLoadMore();
        lastLoadTime = now;

        Future.delayed(const Duration(milliseconds: 100), () {
          isLoading = false;
        });
      }
    }
  }

  void onLoadMore();
}
