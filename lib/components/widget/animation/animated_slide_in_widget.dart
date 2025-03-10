/*
해당 class의 용도
  - 사용자의 스크롤을 감지해서 자식 위젯이 왼쪽에서 오른쪽으로 이동한다
  - 오른쪽으로 이동할때 자연스러운 효과를 위해 opacity 애니메이션을 추가한다

  - 재 사용을 위해 자식 위젯을 받으며, 자식 위젯의 위치를 조정하는 것이 목적이다.
  - state를 받게되면 재사용이 불가하니 true로 변환하여 받는다.
 */

import 'package:flutter/material.dart';

class AnimatedSlideInWidget extends StatelessWidget {
  final bool isVisible;
  final Widget child;
  const AnimatedSlideInWidget(
      {super.key, required this.isVisible, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 620),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 560),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(isVisible ? 0 : -75, 0, 0),
        child: child,
      ),
    );
  }
}
