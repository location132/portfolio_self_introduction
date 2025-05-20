import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final int stateScrollCount;
  final int scrollCount;
  final String imagePath;
  const BackgroundImage(
      {super.key,
      required this.stateScrollCount,
      required this.scrollCount,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              AnimatedPositioned.fromRect(
                rect: stateScrollCount == scrollCount
                    ? Rect.fromLTWH(
                        -50,
                        -50,
                        MediaQuery.of(context).size.width * 1,
                        MediaQuery.of(context).size.height * 1,
                      )
                    : Rect.fromLTWH(
                        MediaQuery.of(context).size.width * 0.3,
                        MediaQuery.of(context).size.height * 0.3,
                        100,
                        100,
                      ),
                duration: const Duration(milliseconds: 1400),
                curve: Curves.easeOutQuad,
                child: AnimatedOpacity(
                  opacity: stateScrollCount == scrollCount ||
                          stateScrollCount == scrollCount + 1
                      ? 0.2
                      : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}
