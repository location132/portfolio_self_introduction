import 'package:flutter/material.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class StudentsSuccessScreen extends StatefulWidget {
  const StudentsSuccessScreen({super.key});

  @override
  State<StudentsSuccessScreen> createState() => _StudentsSuccessScreenState();
}

class _StudentsSuccessScreenState extends State<StudentsSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    final joinStatus = Provider.of<JoinModel>(context, listen: false);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.076, right: screenWidth * 0.076),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenWidth * 0.509,
                  decoration: const BoxDecoration(
                      color: Color(0xffd9d9d9), shape: BoxShape.circle),
                  child: const Center(
                    child: Text(
                      '우리 팀 디자이너\n장하빈 사진',
                      style: TextStyle(
                        color: Color(0xff111111),
                        fontSize: 22,
                        fontFamily: 'Pretendard',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  '축하합니다!\n학생 인증을 완료하였습니다!',
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 22,
                    fontFamily: 'Pretendard',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.231),
                const Text(
                  '이제 잎사이에서 다양한 혜택을 누려보세요!',
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontFamily: 'Pretendard',
                  ),
                ),
                const SizedBox(height: 6),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (pageRoutesStatus.pageController.isEmpty ||
                        pageRoutesStatus.pageController == '') {
                      Navigator.pushReplacementNamed(
                        context,
                        '/MainScreen',
                      );
                    } else {
                      if (pageRoutesStatus.pageController == '/StoreDetail') {
                        pageRoutesStatus.setRetryStoreDetail(true);
                        Navigator.popUntil(
                            context, ModalRoute.withName('/StoreDetail'));
                      } else {
                        Navigator.pushReplacementNamed(
                            context, pageRoutesStatus.pageController);
                        joinStatus.setIsFirstClickSNSLogin(false);
                      }
                    }
                    pageRoutesStatus.setclearPageController();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff6fbf8a),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        '잎사이 시작하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.077),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
