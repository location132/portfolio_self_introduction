import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class SelectTap extends StatelessWidget {
  const SelectTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: '코딩'),
                Tab(text: '상태관리'),
                Tab(text: '생명주기'),
                Tab(text: '애니메이션'),
                Tab(text: '협업툴'),
                Tab(text: '사진편집'),
              ],
            ),
            SizedBox(
              height: 350,
              child: TabBarView(
                children: [
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle1,
                    description: SelectTapTextConstants.selectTapDescription1,
                  ),
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle2,
                    description: SelectTapTextConstants.selectTapDescription2,
                  ),
                  Center(child: Text('생명주기')),
                  Center(child: Text('애니메이션')),
                  Center(child: Text('협업툴')),
                  Center(child: Text('사진편집')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTapItem extends StatelessWidget {
  final String title;
  final String description;
  const SelectTapItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0.responsiveFont(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: TextStyle(
                    fontSize: 12.0.responsiveFont(context),
                    color: const Color.fromARGB(255, 166, 166, 166),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
