import 'package:flutter/material.dart';

class LibraryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isSelected;
  final bool isExpanded;

  const LibraryCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isSelected,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 500,
      child: Stack(
        children: [
          // 메인 컨테이너 (이미지 영역)
          Container(
            width: 320,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.05),
              border: Border.all(
                color:
                    isSelected
                        ? Colors.white.withOpacity(0.3)
                        : Colors.white.withOpacity(0.1),
                width: isSelected ? 2 : 1,
              ),
              boxShadow:
                  isSelected
                      ? [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ]
                      : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          // 하단 그라데이션 페이드 효과
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // 텍스트 영역
          if (!isExpanded)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
