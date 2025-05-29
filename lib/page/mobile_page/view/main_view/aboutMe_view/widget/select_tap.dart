import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class SelectTap extends StatelessWidget {
  const SelectTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            const TabBar(
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
              ],
            ),
            SizedBox(
              height: 400.h,
              child: const TabBarView(
                children: [
                  SelectTapItem(
                    myStackTitle: SelectTapTextConstants.myStackTitle1,
                    myStack: SelectTapTextConstants.myStack1,
                    title: SelectTapTextConstants.selectTapTitle1,
                    description: SelectTapTextConstants.selectTapDescription1,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage1,
                  ),
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle2,
                    description: SelectTapTextConstants.selectTapDescription2,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage2,
                    myStackTitle: SelectTapTextConstants.myStackTitle2,
                    myStack: SelectTapTextConstants.myStack2,
                  ),
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle3,
                    description: SelectTapTextConstants.selectTapDescription3,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage3,
                    myStackTitle: SelectTapTextConstants.myStackTitle3,
                    myStack: SelectTapTextConstants.myStack3,
                  ),
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle4,
                    description: SelectTapTextConstants.selectTapDescription4,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage4,
                    myStackTitle: SelectTapTextConstants.myStackTitle4,
                    myStack: SelectTapTextConstants.myStack4,
                  ),
                  SelectTapItem(
                    title: SelectTapTextConstants.selectTapTitle5,
                    description: SelectTapTextConstants.selectTapDescription5,
                    finalMessage: SelectTapTextConstants.selectTapFinalMessage5,
                    myStackTitle: SelectTapTextConstants.myStackTitle5,
                    myStack: SelectTapTextConstants.myStack5,
                  ),
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
  final String? myStackTitle;
  final String? myStack;
  final String title;
  final String description;
  final String finalMessage;

  const SelectTapItem({
    super.key,
    this.myStackTitle,
    this.myStack,
    required this.title,
    required this.description,
    required this.finalMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        MyStack(myStackTitle: myStackTitle, myStack: myStack),
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
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: description,
                  style: TextStyle(
                    fontSize: 13.0.sp,
                    color: const Color.fromARGB(255, 166, 166, 166),
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: finalMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyStack extends StatelessWidget {
  final String? myStackTitle;
  final String? myStack;
  const MyStack({super.key, this.myStackTitle, this.myStack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
              myStackTitle ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              myStack ?? '',
              style: TextStyle(
                fontSize: 12.0.sp,
                color: const Color.fromARGB(255, 166, 166, 166),
                height:
                    myStackTitle == SelectTapTextConstants.myStackTitle3
                        ? 1.5.sp
                        : 2.2.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
