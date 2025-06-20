import 'package:flutter/material.dart';
import 'package:my_dream/coreService/Sharedpreferences.dart';

class SearchLogicCategory extends StatefulWidget {
  const SearchLogicCategory({super.key});

  @override
  State<SearchLogicCategory> createState() => _SearchLogicCategoryState();
}

class _SearchLogicCategoryState extends State<SearchLogicCategory> {
  PreferencesSearchHistory preferencesSearchHistory =
      PreferencesSearchHistory();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    'assets/images/category_image_bugger.png',
                    scale: 2.9,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '식음료',
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
        //--------------------------------
        const SizedBox(width: 20),
        Column(
          children: [
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/category_image_culture.png',
                    scale: 2.9,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '문화',
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
        //--------------------------------
        const SizedBox(width: 20),
        Column(
          children: [
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/category_image_coalition.png',
                    scale: 2.9,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '제휴',
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
