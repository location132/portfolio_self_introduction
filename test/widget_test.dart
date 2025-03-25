import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class SkillView extends StatelessWidget {
  const SkillView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            SkillTextConstants.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            SkillTextConstants.subTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('assets/images/ipad_F_F.png'),
        ],
      ),
    );
  }
}
