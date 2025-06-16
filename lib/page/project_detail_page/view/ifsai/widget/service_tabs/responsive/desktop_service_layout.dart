import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import '../service_data.dart';
import '../animation/service_tabs_animation_controller.dart';

class DesktopServiceLayout {
  static Widget build(
    bool isServiceTabVisible,
    List<ServiceData> services,
    TabController tabController,
    ServiceTabsAnimationController animationController,
    Widget Function(ServiceData) buildServiceCard,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '누구나 구현하는 UI\n나의 강점은 Service파일로부터',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/Images/ifsai_img/web_project_4.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 100),
              SizedBox(
                width: 400,
                child: WidgetAnimation(
                  isStart: isServiceTabVisible,
                  beginDy: 0.1,
                  duration: 1000,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 140),
                      Text(
                        'Cubit을 도와주는 최고의 기술.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 74),
                      Text(
                        'UI와 계산을 도와주는 함수, 앱을 서포트하는 서비스의 조합.\n'
                        '싱글톤 패턴을 기반으로 구성되어 있어 어느 위치에서든\n'
                        '필요한 기능에 접근할 수 있습니다.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 140),
                      Text(
                        '- 함수를 구현하는 Cubit과 Service파일은 독립적인 관계입니다.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          _buildTabBar(services, tabController),
          const SizedBox(height: 40),
          SizedBox(
            width: 800,
            height: 300,
            child: TabBarView(
              controller: tabController,
              children: services.map(buildServiceCard).toList(),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTabBar(
    List<ServiceData> services,
    TabController tabController,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: SizedBox(
        width: double.infinity,
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withValues(alpha: 0.6),
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          tabs: services.map((service) => Tab(text: service.title)).toList(),
        ),
      ),
    );
  }
}
