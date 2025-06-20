import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/4_main_page/4.10.1_main_quest_guest.dart';
import 'package:my_dream/Page/4_main_page/4.10_main_quest.dart';
import 'package:my_dream/Page/4_main_page/4.11_join_us.dart';
import 'package:my_dream/Page/4_main_page/4.2_main_adBanner.dart';
import 'package:my_dream/Page/4_main_page/4.3_main_category.dart';
import 'package:my_dream/Page/4_main_page/4.4_main_top12.dart';
import 'package:my_dream/Page/4_main_page/4.5_main_new_store.dart';
import 'package:my_dream/Page/4_main_page/4.6_main_best_review.dart';
import 'package:my_dream/Page/4_main_page/4.7_main_hot_promotion.dart';
import 'package:my_dream/Page/4_main_page/4.9_main_tourist_attractions.dart';
import 'package:my_dream/coreService/provider.dart';

class MainPage extends StatefulWidget {
  final Function(bool) onLoadingComplete;
  const MainPage({super.key, required this.onLoadingComplete});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _finishCount = 0;

  void _incrementFinishCount() {
    setState(() {
      _finishCount++;
      if (context.read<LoginModel>().loginStatus == true) {
        if (_finishCount == 5) {
          widget.onLoadingComplete(true);
        }
      } else {
        if (_finishCount == 4) {
          widget.onLoadingComplete(true);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      const MainAddBannerScreen(bannerHeight: 140),
                      SizedBox(height: screenHeight * 0.0235),
                      const MainCategory(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.0352),
        JoinUs(),
        SizedBox(height: screenHeight * 0.02),
        MainNewStore(
          onLoadingComplete: _incrementFinishCount,
        ),
        const SizedBox(height: 25),
        MainTop12(
          onLoadingComplete: _incrementFinishCount,
        ),
        Column(
          children: [
            SizedBox(height: screenHeight * 0.0352),
            const MainHotPromotion(),
          ],
        ),
        const SizedBox(height: 40),
        MainBestReview(
          onLoadingComplete: _incrementFinishCount,
        ),
        Column(
          children: [
            SizedBox(height: screenHeight * 0.0352),
            MainTouristAttractions(
              onLoadingComplete: _incrementFinishCount,
            ),
            const SizedBox(height: 40),
            // 로그인여부로 퀘스트 페이지 호출
            context.read<LoginModel>().loginStatus == true
                ? MainQuest(
                    onLoadingComplete: _incrementFinishCount,
                  )
                : const QuestForGuest(),
          ],
        ),
        const SizedBox(
          height: 170,
        ),
      ],
    );
  }
}
