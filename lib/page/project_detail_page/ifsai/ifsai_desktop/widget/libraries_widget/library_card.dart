import 'package:flutter/material.dart';

class LibraryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLibraryDetailVisible;

  const LibraryCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isLibraryDetailVisible,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double cardWidth =
        screenWidth > 1024 ? 320 : (screenWidth > 600 ? 280 : 250);
    double cardHeight =
        !isLibraryDetailVisible
            ? (screenWidth > 1024 ? 500 : (screenWidth > 600 ? 450 : 400))
            : (screenWidth > 1024 ? 450 : (screenWidth > 600 ? 400 : 350));
    double imageHeight =
        !isLibraryDetailVisible
            ? (screenWidth > 1024 ? 400 : (screenWidth > 600 ? 350 : 300))
            : (screenWidth > 1024 ? 350 : (screenWidth > 600 ? 300 : 250));

    double titleFontSize =
        screenWidth > 1024 ? 18 : (screenWidth > 600 ? 16 : 14);
    double descriptionFontSize =
        screenWidth > 1024 ? 14 : (screenWidth > 600 ? 12 : 11);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      constraints: BoxConstraints(maxWidth: cardWidth, minWidth: 250),
      height: cardHeight,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withValues(alpha: 0.05),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.1),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          Positioned(
            bottom:
                !isLibraryDetailVisible ? (screenWidth > 600 ? 100 : 80) : 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenWidth > 600 ? 300 : 250,
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
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(screenWidth > 600 ? 16 : 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth > 600 ? 12 : 8),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
