import 'package:flutter/material.dart';

class ProjectDetailTitleNoAnimation extends StatefulWidget {
  const ProjectDetailTitleNoAnimation({super.key});

  @override
  State<ProjectDetailTitleNoAnimation> createState() =>
      _ProjectDetailTitleNoAnimationState();
}

class _ProjectDetailTitleNoAnimationState
    extends State<ProjectDetailTitleNoAnimation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '잎사이',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black.withValues(alpha: 0.8),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset(
                      'assets/Images/ifSai.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 7,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(
                            255,
                            72,
                            159,
                            25,
                          ).withValues(alpha: 0.8),
                          const Color.fromARGB(
                            255,
                            129,
                            249,
                            118,
                          ).withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Text(
                '지루하지않게 저에 관해서 궁금한 것만 보여드리겠습니다.\n 1200 이상 디바이스에서는 많은 인터렉션이 있습니다!',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
