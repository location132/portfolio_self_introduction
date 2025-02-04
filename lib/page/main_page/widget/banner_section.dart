import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/%08core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/paintings/custom_arrow.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '기업과 같이 성장하는 개발자',
          style: TextStyle(
            fontSize: 24.sw,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.4,
          ),
        ),
        SizedBox(height: 12.sh),
        // Text(
        //   '제 개인적인 성장은 곧 기업의 성장과 직결된다는 점을 명심하고 있습니다.\n'
        //   '기업의 목표와 비전에 부합하는 방향으로 제 역량을 발전시키고, 새로운 도전 과제를 해결해 나감으로써 기업과 함께 성장해 나가겠습니다.\n\n'
        //   '기업과 함께하는 모든 순간 저는 제가 가진 창의성과 문제 해결 능력을 최대한 발휘하며, 기업의 발전에 실질적인 이득을 제공하고, 더 나아가\n'
        //   '회사가 새로운 시장으로 개척하고, 지속 가능한 성장을 이루는 데 있어 저의 성장 뿐 아니라 회사의 성장과 성공을 위해 일하는 이상적인 면모를 현실로 가져오는\n'
        //   '개발자가 되도록 계획하고 있습니다.',
        //   style: TextStyle(
        //     fontSize: 16.sw,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.grey[800],
        //     height: 1.6,
        //     letterSpacing: 0.5,
        //   ),
        // ),
        SizedBox(height: 20.sh),
        Stack(
          children: [CustomLine()],
        ),
      ],
    );
  }
}
