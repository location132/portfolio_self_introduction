import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

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
                    myStackTitle1: SelectTapTextConstants.myStackTitle1,
                    myStack1: SelectTapTextConstants.myStack1,
                    title: SelectTapTextConstants.selectTapTitle1,
                    description: SelectTapTextConstants.selectTapDescription1,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage,
                  ),
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle2,
                    description: SelectTapTextConstants.selectTapDescription2,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage,
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
  final String? myStackTitle1;
  final String? myStack1;
  final String title;
  final String description;
  final String finalMessage;

  const SelectTapItem({
    super.key,
    this.myStackTitle1,
    this.myStack1,
    required this.title,
    required this.description,
    required this.finalMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Center(
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    color: const Color.fromARGB(255, 166, 166, 166),
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: finalMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        MyStack(myStackTitle1: myStackTitle1, myStack1: myStack1),
        const SizedBox(height: 20),
      ],
    );
  }
}

class MyStack extends StatelessWidget {
  final String? myStackTitle1;
  final String? myStack1;
  const MyStack({super.key, this.myStackTitle1, this.myStack1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            myStackTitle1 ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            myStack1 ?? '',
            style: TextStyle(
              fontSize: 12.0.sp,
              color: const Color.fromARGB(255, 166, 166, 166),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
