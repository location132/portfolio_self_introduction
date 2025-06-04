import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class DesktopChapterCard extends StatefulWidget {
  final int cardIndex;

  const DesktopChapterCard({super.key, required this.cardIndex});

  @override
  State<DesktopChapterCard> createState() => _DesktopChapterCardState();
}

class _DesktopChapterCardState extends State<DesktopChapterCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    switch (widget.cardIndex) {
      case 0:
        return _buildFirstCard();
      case 1:
        return _buildSecondCard();
      case 2:
        return _buildThirdCard();
      case 3:
        return _buildFourthCard();
      default:
        return Container();
    }
  }

  Widget _buildFirstCard() {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/Images/Magic Studio Magic Expand L&P - MOBILE.png',
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ProfilePage1Constants.chapter1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                ProfilePage1Constants.chapter1Title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                ProfilePage1Constants.chapter1Mobile,
                style: TextStyle(
                  color: Color.fromARGB(255, 222, 222, 222),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecondCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Images/phone_screen.webp',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ProfilePage1Constants.chapter2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        ProfilePage1Constants.chapter2Title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        ProfilePage1Constants.chapter2Mobile,
                        style: TextStyle(
                          color: Color.fromARGB(255, 222, 222, 222),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThirdCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isHovered ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'assets/Images/Generated Image May 09, 2025 - 1_25PM.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'assets/Images/my_self.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ProfilePage1Constants.chapter3,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        ProfilePage1Constants.chapter3Title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        ProfilePage1Constants.chapter3Mobile,
                        style: TextStyle(
                          color: Color.fromARGB(255, 222, 222, 222),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFourthCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isHovered ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'assets/Images/intro_Image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: AnimatedOpacity(
              opacity: isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'assets/Images/intro_Image2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ClipRRect(
              child: Container(
                width: double.infinity,
                color: Colors.black.withValues(alpha: 0.3),
                padding: const EdgeInsets.all(24),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spotlight',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '세심한 작업을 좋아합니다.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      ' 개발을 하며 코드 한줄의 소중함을 알게 되었습니다.\n저와 잘 어울리는 개발 스타일을 소개합니다.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 222, 222, 222),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
