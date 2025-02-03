import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/%08core_service/util/device_Info_size.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isScreenLoad = false;

  @override
  void initState() {
    super.initState();
    _isScreenLoad = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        //TODO: 개발 후, ! 제거
        opacity: _isScreenLoad ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            SizedBox(height: 10.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 11.sw),
                Image.asset(
                  'assets/Images/flutter_bird.png',
                  scale: 25,
                ),
                _buildNavItem("자기소개서"),
                _buildNavItem("프로젝트"),
                _buildNavItem("기술 블로그"),
                _buildNavItem("패키지"),
                _buildNavItem("커리어 & 성장"),
                _buildNavItem("나만의 개발 팁"),
                _buildNavItem("교육 및 강의"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.sw),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            debugPrint("$title 클릭됨");
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
