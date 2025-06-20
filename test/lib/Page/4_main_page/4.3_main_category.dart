import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/components/main_container.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryButton(
          screenWidth: screenWidth,
          imagePath: 'assets/images/category_image_bugger.png',
          label: '식사',
          labelPadding: 10,
          page: 'DetailCategoryEating',
        ),
        CategoryButton(
          screenWidth: screenWidth,
          imagePath: 'assets/images/category_image_culture.png',
          label: '문화',
          labelPadding: 7,
          page: 'DetailCategoryAttraction',
        ),
        CategoryButton(
          screenWidth: screenWidth,
          imagePath: 'assets/images/category_image_coalition.png',
          label: '제휴',
          labelPadding: 10,
          page: 'AffiliatedStorePage',
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final double screenWidth;
  final String imagePath;
  final String label;
  final String page;
  final double labelPadding;

  const CategoryButton({
    required this.screenWidth,
    required this.imagePath,
    required this.label,
    required this.page,
    required this.labelPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      height: screenWidth * 0.272,
      width: screenWidth * 0.272,
      content: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/$page');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          minimumSize: Size(screenWidth * 0.272, screenWidth * 0.272),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(imagePath),
            ),
            SizedBox(height: labelPadding),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xff111111),
                fontFamily: 'PretendardSemiBold',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
