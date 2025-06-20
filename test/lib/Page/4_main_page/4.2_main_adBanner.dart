import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_dream/Page/4_main_page/components/main_Add_banner.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

class MainAddBannerScreen extends StatelessWidget {
  final double bannerHeight;
  const MainAddBannerScreen({super.key, required this.bannerHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAddBanner(
          height: bannerHeight.sh,
          width: double.infinity,
          content: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network('${dotenv.env['API_URL']}/images/banner.png',
                fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}
