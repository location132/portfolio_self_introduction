import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/mobile_detail.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/one_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/detailMe_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/app_page.dart';

class DetailmePage extends StatelessWidget {
  final DetailMeModel state;
  const DetailmePage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      constraints: const BoxConstraints(maxHeight: 1000),
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: AnimatedOpacity(
              opacity: !state.isDetailMeRiveStart ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: OneLineTitle(
                isTitelTextAniStart: state.isDetailMe,
                isReverse: !state.isDetailMe,
                title: '더 자세히 살펴보기.',
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          MobileDetailRive(isStartAni: state.isDetailMeRiveStart),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppPage(
              isAppPageStart: state.isAppPageStart,
              isAppPageTextStart: state.isAppPageTextStart,
            ),
          ),
        ],
      ),
    );
  }
}
