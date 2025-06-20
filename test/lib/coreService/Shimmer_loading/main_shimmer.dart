import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmer extends StatelessWidget {
  const MainShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final secondScreenWidth = screenWidth * 0.351;
    final secondScreenHeight = screenHeight * 0.202;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.295 + 29),
                SizedBox(
                  height: 25,
                  child: Image.asset(
                    'assets/images/ifSaiLogo.png',
                    width: 70,
                    cacheWidth:
                        (70 * MediaQuery.of(context).devicePixelRatio).round(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.024),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    width: screenWidth * 0.823,
                    child: TextFormField(
                      enabled: false,
                      cursorHeight: 20,
                      textAlignVertical: const TextAlignVertical(y: 0.3),
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        filled: true,
                        fillColor: const Color(0xfff5f5f5),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 17),
                          child: Transform.translate(
                            offset: const Offset(10, 0),
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Color(0xff6fbf8a),
                            ),
                          ),
                        ),
                        hintText: '검색어를 입력해주세요.',
                        hintStyle: const TextStyle(
                            color: Color(0xffc1c1c1), fontFamily: 'Pretendard'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.notifications_none,
                  color: Color(0xff6fbf8a),
                  size: 32,
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xff6fbf8a),
                  size: 32,
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.023),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: SizedBox(
              height: screenWidth * 0.357,
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: const Color(0xffc1c1c1),
                highlightColor: const Color(0xfff5f5f5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.023),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Shimmer.fromColors(
                      baseColor: const Color(0xffe0e0e0),
                      highlightColor: const Color(0xfff5f5f5),
                      child: Container(
                        height: screenWidth * 0.272,
                        width: screenWidth * 0.272,
                        decoration: const ShapeDecoration(
                          color: Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //--------------------------------
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Shimmer.fromColors(
                      baseColor: const Color(0xffe0e0e0),
                      highlightColor: const Color(0xfff5f5f5),
                      child: Container(
                        height: screenWidth * 0.272,
                        width: screenWidth * 0.272,
                        decoration: const ShapeDecoration(
                          color: Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //--------------------------------
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Shimmer.fromColors(
                      baseColor: const Color(0xffe0e0e0),
                      highlightColor: const Color(0xfff5f5f5),
                      child: Container(
                        height: screenWidth * 0.272,
                        width: screenWidth * 0.272,
                        decoration: const ShapeDecoration(
                          color: Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.03, right: screenWidth * 0.041),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xffe0e0e0),
                    highlightColor: const Color(0xfff5f5f5),
                    child: Container(
                      color: const Color(0xffdbdbdb),
                      height: 24,
                      width: 90,
                    ),
                  ),
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: const Color(0xffe0e0e0),
                  highlightColor: const Color(0xfff5f5f5),
                  child: Container(
                    height: screenHeight * 0.019,
                    width: screenWidth * 0.148,
                    color: const Color(0xffdbdbdb),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.011),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.041),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  ContainerShimmer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    secondScreenHeight: secondScreenHeight,
                    secondScreenWidth: secondScreenWidth,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  ContainerShimmer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    secondScreenHeight: secondScreenHeight,
                    secondScreenWidth: secondScreenWidth,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  ContainerShimmer(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    secondScreenHeight: secondScreenHeight,
                    secondScreenWidth: secondScreenWidth,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.038),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.055, right: screenWidth * 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Container(
                    color: const Color(0xffdbdbdb),
                    height: 24,
                    width: 92,
                  ),
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: const Color(0xffe0e0e0),
                  highlightColor: const Color(0xfff5f5f5),
                  child: Container(
                    height: screenHeight * 0.019,
                    width: screenWidth * 0.148,
                    color: const Color(0xffdbdbdb),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.012),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.055, right: screenWidth * 0.05),
            child: Container(
              height: screenHeight * 0.116,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.08),
                  Shimmer.fromColors(
                    baseColor: const Color(0xffe0e0e0),
                    highlightColor: const Color(0xfff5f5f5),
                    child: Container(
                      height: screenHeight * 0.024,
                      width: 9,
                      decoration: const BoxDecoration(
                        color: Color(0xffdbdbdb),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.06),
                  Shimmer.fromColors(
                    baseColor: const Color(0xffc1c1c1),
                    highlightColor: const Color(0xfff5f5f5),
                    child: Container(
                      height: screenHeight * 0.080,
                      width: screenHeight * 0.080,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffdbdbdb),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.06),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.018,
                      ),
                      Shimmer.fromColors(
                        baseColor: const Color(0xffe0e0e0),
                        highlightColor: const Color(0xfff5f5f5),
                        child: Container(
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.021,
                          decoration: const BoxDecoration(
                            color: Color(0xffdbdbdb),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.007),
                      Shimmer.fromColors(
                        baseColor: const Color(0xffe0e0e0),
                        highlightColor: const Color(0xfff5f5f5),
                        child: Container(
                          width: screenWidth * 0.19,
                          height: screenHeight * 0.021,
                          decoration: const BoxDecoration(
                            color: Color(0xffdbdbdb),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.007),
                      Shimmer.fromColors(
                        baseColor: const Color(0xffe0e0e0),
                        highlightColor: const Color(0xfff5f5f5),
                        child: Container(
                          width: 99,
                          height: screenHeight * 0.021,
                          decoration: const BoxDecoration(
                            color: Color(0xffdbdbdb),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerShimmer extends StatelessWidget {
  const ContainerShimmer({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.secondScreenHeight,
    required this.secondScreenWidth,
  });

  final double screenHeight;
  final double screenWidth;
  final double secondScreenHeight;
  final double secondScreenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.202,
      width: screenWidth * 0.351,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: const Color(0xffc1c1c1),
              highlightColor: const Color(0xfff5f5f5),
              child: Container(
                height: secondScreenHeight * 0.581,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffc1c1c1),
                ),
              ),
            ),
            SizedBox(height: secondScreenHeight * 0.058),
            Padding(
              padding: EdgeInsets.only(
                  left: secondScreenWidth * 0.072,
                  right: secondScreenWidth * 0.072),
              child: Column(
                children: [
                  Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: const Color(0xffe0e0e0),
                        highlightColor: const Color(0xfff5f5f5),
                        child: Container(
                          height: secondScreenHeight * 0.087,
                          width: secondScreenWidth * 0.507,
                          decoration: const BoxDecoration(
                            color: Color(0xffdbdbdb),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Shimmer.fromColors(
                        baseColor: const Color(0xffe0e0e0),
                        highlightColor: const Color(0xfff5f5f5),
                        child: Container(
                          height: secondScreenHeight * 0.058,
                          width: secondScreenWidth * 0.297,
                          decoration: const BoxDecoration(
                            color: Color(0xffdbdbdb),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: secondScreenHeight * 0.049),
                  const Divider(
                    height: 1,
                    color: Color(0xfff5f5f5),
                  ),
                  SizedBox(height: secondScreenHeight * 0.026),
                  Shimmer.fromColors(
                    baseColor: const Color(0xffe0e0e0),
                    highlightColor: const Color(0xfff5f5f5),
                    child: Container(
                      height: secondScreenHeight * 0.058,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffdbdbdb),
                      ),
                    ),
                  ),
                  SizedBox(height: secondScreenHeight * 0.029),
                  Shimmer.fromColors(
                    baseColor: const Color(0xffe0e0e0),
                    highlightColor: const Color(0xfff5f5f5),
                    child: Container(
                      height: secondScreenHeight * 0.058,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffdbdbdb),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
