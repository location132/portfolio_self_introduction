//TODO: 해당 부분은 컴포넌트화 해서 다른 곳에서 사용할 수 있기 때문에 파일 이름 변경 예정

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class MyStory extends StatelessWidget {
  const MyStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 70, left: 90, right: 40),
      child: Text(
        MyStoryTextConstants.myStory,
        maxLines: 10,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black45,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
