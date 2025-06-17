import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/faq_widget/faq_view.dart';

class FaqManager {
  static Widget build(BuildContext context, IfsaiState state) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: screenWidth > 1200 ? 1200 : screenWidth * 0.95,
      ),
      child: const FaqView(),
    );
  }
}
