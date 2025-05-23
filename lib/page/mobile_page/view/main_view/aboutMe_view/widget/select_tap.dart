import 'package:flutter/material.dart';

class SelectTap extends StatelessWidget {
  const SelectTap({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                Center(child: Text('코딩')),
                Center(child: Text('사진 편집')),
                Center(child: Text('STEM')),
                Center(child: Text('비즈니스')),
                Center(child: Text('그래픽 디자인')),
                Center(child: Text('3D')),
              ],
            ),
          ),
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '코딩'),
              Tab(text: '사진 편집'),
              Tab(text: 'STEM'),
              Tab(text: '비즈니스'),
              Tab(text: '그래픽 디자인'),
              Tab(text: '3D'),
            ],
            indicatorColor: Colors.white, // 선택 탭 하단선
          ),
        ],
      ),
    );
  }
}
