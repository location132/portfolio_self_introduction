import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'gsshop_desktop/gsshop_detail_view.dart';
import 'gsshop_mobile/gsshop_mobile_detail_view.dart';

class GsShopPage extends StatelessWidget {
  const GsShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const GsShopMobileDetailView(),
      desktop: (BuildContext context) => const GsShopDetailView(),
    );
  }
}
