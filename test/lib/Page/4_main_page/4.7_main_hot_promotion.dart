import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/4_main_page/components/main_Add_banner.dart';
import 'package:my_dream/Page/4_main_page/components/main_title_overview.dart';

class MainHotPromotion extends StatefulWidget {
  const MainHotPromotion({super.key});

  @override
  State<MainHotPromotion> createState() => _MainHotPromotionState();
}

class _MainHotPromotionState extends State<MainHotPromotion> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const MainTitleOverview(title: 'HOT 프로모션🔥', isShowMore: false),
        const SizedBox(height: 10),
        MainAddBanner(
          height: screenWidth * 0.356,
          content: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
                '${dotenv.env['API_URL']}/images/promotion.png',
                fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
