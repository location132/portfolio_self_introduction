import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/components/rive/banner_rive.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/project_detail_page/rive_aboutMe/about_me_rive_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/rive_aboutMe/about_me_rive_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class AboutMeRivePage extends StatelessWidget {
  const AboutMeRivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<RiveAboutMeCubit>(),
      child: RiveAboutMeDetailView(),
    );
  }
}

class RiveAboutMeDetailView extends StatelessWidget {
  const RiveAboutMeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );
    return BlocBuilder<RiveAboutMeCubit, RiveAboutMeState>(
      builder: (context, state) {
        return Container(
          color: Colors.black,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: TopNavBar(
                        deviceType: deviceType,
                        isMenuClicked: state.isMenuClicked,
                        onPressed:
                            deviceType == 'mobile'
                                ? () {
                                  context.read<RiveAboutMeCubit>().toggleMenu();
                                }
                                : null,
                        onHomePressed: () {
                          context.go('/');
                        },
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 140),

                          // 제목 섹션
                          Text(
                            'Rive Banner 애니메이션 제작기',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 60),

                          Text(
                            'Flutter와 Rive를 활용한 인터랙티브 배너 애니메이션 개발 과정과 구현 방법을 공유합니다.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 100),

                          // 프로젝트 개요 섹션
                          _buildSection(
                            '프로젝트 개요',
                            '이 프로젝트는 사용자가 웹사이트에 진입할 때 자동으로 실행되는 배너 애니메이션을 만들기 위해 시작되었습니다.\n\n'
                                'Rive의 State Machine과 Trigger를 활용하여 Flutter에서 제어 가능한 애니메이션을 구현했습니다.\n\n'
                                '목표: 사용자 경험을 향상시키는 부드럽고 인터랙티브한 배너 애니메이션',
                          ),

                          const SizedBox(height: 140),
                          Divider(color: Colors.grey[700], thickness: 1),
                          const SizedBox(height: 100),

                          // Rive 애니메이션 데모
                          _buildSection(
                            'Banner Rive 애니메이션 데모',
                            '아래는 실제 구현된 배너 애니메이션입니다. 페이지 로드 시 자동으로 실행됩니다.',
                          ),

                          const SizedBox(height: 40),

                          // 실제 Rive 애니메이션
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BannerRive(isStartAni: true),
                            ),
                          ),

                          const SizedBox(height: 240),

                          // State Machine 구조 설명
                          _buildSection(
                            'State Machine 구조',
                            'Rive에서 State Machine "State Machine 1"을 생성하여 애니메이션 플로우를 제어합니다.',
                          ),

                          const SizedBox(height: 40),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCodeBlock(
                                  'State Machine 설정',
                                  '''State Machine Name: "State Machine 1"
Artboard: "Artboard"
File: rive_banner.riv''',
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // 트리거 시스템 설명
                          _buildSection(
                            '트리거 시스템 설계',
                            'Flutter에서 애니메이션을 제어하기 위해 Trigger를 활용했습니다.',
                          ),

                          const SizedBox(height: 40),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTriggerItem(
                                  'Trigger 1',
                                  '배너 애니메이션 시작',
                                  '페이지 로드 시 자동으로 발동되어 배너 애니메이션을 시작합니다.',
                                  'SMITrigger',
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // Flutter 구현 코드
                          _buildSection(
                            'Flutter 구현 코드',
                            'Rive 애니메이션을 Flutter에서 제어하는 핵심 코드입니다.',
                          ),

                          const SizedBox(height: 40),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCodeBlock(
                                  'StateMachineController 초기화',
                                  '''void _onRiveInit(Artboard artboard) {
  _controller = StateMachineController.fromArtboard(
    artboard,
    'State Machine 1',
  );

  if (_controller != null) {
    artboard.addController(_controller!);
    _startAniTrigger = _controller!.findSMI<SMITrigger>('Trigger 1');
  }
}''',
                                ),

                                const SizedBox(height: 30),

                                _buildCodeBlock(
                                  '트리거 실행 로직',
                                  '''void _startAni() async {
  if (_hasStarted) return;
  if (_startAniTrigger == null) {
    await Future.delayed(const Duration(seconds: 1));
    return _startAni();
  }

  _startAniTrigger?.fire();
  _hasStarted = true;
}''',
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // 레이어 구성 설명
                          _buildSection(
                            'Rive 레이어 구성',
                            'Rive 에디터에서 애니메이션을 위한 레이어들을 어떻게 구성했는지 실제 스크린샷과 함께 살펴보겠습니다.',
                          ),

                          const SizedBox(height: 40),

                          // 레이어 구성 이미지
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/Images/rive_banner/rive_banner_layer.png',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '📝 레이어별 구성 요소',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildLayerItem(
                                  'Background Layer',
                                  '배경 그라데이션과 기본 컨테이너 요소',
                                  Colors.purple[300]!,
                                ),
                                const SizedBox(height: 15),
                                _buildLayerItem(
                                  'Text Elements',
                                  '메인 타이틀과 서브타이틀 텍스트 그룹',
                                  Colors.blue[300]!,
                                ),
                                const SizedBox(height: 15),
                                _buildLayerItem(
                                  'Icon Groups',
                                  '기술 스택 아이콘들과 장식 요소들',
                                  Colors.green[300]!,
                                ),
                                const SizedBox(height: 15),
                                _buildLayerItem(
                                  'Animation Controllers',
                                  'State Machine과 Trigger 제어 시스템',
                                  Colors.orange[300]!,
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  '위 스크린샷에서 보시는 것처럼 각 레이어는 독립적으로 구성되어 있으며, 개별적으로 애니메이션을 적용할 수 있습니다.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // 타임라인 설계
                          _buildSection(
                            '애니메이션 타임라인 설계',
                            'Rive에서 타임라인을 어떻게 구성했는지 실제 에디터 스크린샷과 함께 단계별로 설명합니다.',
                          ),

                          const SizedBox(height: 40),

                          // 타임라인 이미지
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/Images/rive_banner/rive_banner_timeline.png',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '🎬 타임라인 구성 세부사항',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                _buildTimelineItem(
                                  '0-0.8초',
                                  '초기 상태 (Idle)',
                                  '모든 요소들이 준비 상태에서 대기\n- 배경: 투명도 0%\n- 텍스트: 화면 아래쪽에 위치\n- 아이콘: 스케일 0으로 숨김',
                                ),
                                const SizedBox(height: 20),
                                _buildTimelineItem(
                                  '0.8-2.5초',
                                  '진입 애니메이션 (Entrance)',
                                  '배너 요소들이 순차적으로 등장\n- 배경: 페이드인 효과 (0% → 100%)\n- 메인 타이틀: 아래에서 위로 슬라이드\n- 서브타이틀: 0.3초 지연 후 페이드인',
                                ),
                                const SizedBox(height: 20),
                                _buildTimelineItem(
                                  '2.5-4.0초',
                                  '아이콘 애니메이션 (Icons)',
                                  '기술 스택 아이콘들의 등장\n- 아이콘들: 순차적 스케일 애니메이션\n- 각 아이콘 0.2초씩 지연\n- 바운스 이펙트로 생동감 추가',
                                ),
                                const SizedBox(height: 20),
                                _buildTimelineItem(
                                  '4.0-5.0초',
                                  '안정화 (Stabilize)',
                                  '모든 요소가 최종 위치 도달\n- 미세한 호버 애니메이션 시작\n- 타이틀 텍스트에 부드러운 글로우 효과\n- 전체적인 배치 완성',
                                ),
                                const SizedBox(height: 20),
                                _buildTimelineItem(
                                  '5.0초+',
                                  '대기 상태 (Loop)',
                                  '사용자 인터랙션 대기\n- 주기적인 펄스 애니메이션\n- 아이콘들의 subtle 움직임\n- 호버 상태 준비 완료',
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // 기술적 구현 세부사항
                          _buildSection(
                            '기술적 구현 세부사항',
                            '이 프로젝트에서 사용된 주요 기술과 구현 방법들입니다.',
                          ),

                          const SizedBox(height: 40),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTechDetailItem(
                                  'State Management',
                                  'StatefulWidget을 사용하여 애니메이션 상태 관리',
                                  [
                                    '_controller',
                                    '_startAniTrigger',
                                    '_hasStarted',
                                  ],
                                ),
                                const SizedBox(height: 25),
                                _buildTechDetailItem(
                                  'Memory Management',
                                  'dispose()에서 controller 해제로 메모리 누수 방지',
                                  ['_controller?.dispose()', 'super.dispose()'],
                                ),
                                const SizedBox(height: 25),
                                _buildTechDetailItem(
                                  'Error Handling',
                                  'null check와 재시도 로직으로 안정성 확보',
                                  [
                                    'Future.delayed',
                                    'recursive call',
                                    'null safety',
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // 배운 점과 개선 사항
                          _buildSection(
                            '배운 점과 개선 사항',
                            '프로젝트를 통해 얻은 경험과 향후 개선할 수 있는 부분들입니다.',
                          ),

                          const SizedBox(height: 40),

                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[700]!),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLearningItem('✅ 성과', [
                                  'Rive State Machine과 Flutter의 완벽한 연동',
                                  'SMITrigger를 활용한 정확한 애니메이션 제어',
                                  '메모리 효율적인 애니메이션 구현',
                                  '사용자 경험을 고려한 타이밍 설계',
                                ]),

                                const SizedBox(height: 30),

                                _buildLearningItem('🔧 개선 사항', [
                                  '다양한 디바이스 크기에 대한 반응형 애니메이션',
                                  '사용자 설정에 따른 애니메이션 비활성화 옵션',
                                  '더 복잡한 인터랙션을 위한 추가 트리거 구현',
                                  'Loading 상태에 대한 더 나은 UX 처리',
                                ]),
                              ],
                            ),
                          ),

                          const SizedBox(height: 240),

                          // 다음 프로젝트 예고
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue[900]!,
                                  Colors.purple[900]!,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '다음 프로젝트',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '다음에는 더 복잡한 인터랙션을 가진 Rive 애니메이션을 다뤄보겠습니다.\n'
                                  '• mySkill.riv - 기술 스택 인터랙티브 애니메이션\n'
                                  '• mobile_detail.riv - 모바일 전용 상세 애니메이션\n\n'
                                  '각각의 제작 과정과 구현 방법을 상세히 공유할 예정입니다.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.9),
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          content,
          style: TextStyle(fontSize: 17, color: Colors.grey[300], height: 1.7),
        ),
      ],
    );
  }

  Widget _buildCodeBlock(String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue[300],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[800]!),
          ),
          child: Text(
            code,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              color: Colors.green[300],
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTriggerItem(
    String triggerName,
    String purpose,
    String description,
    String type,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[800]!.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  triggerName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                type,
                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            purpose,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[300],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String frame, String phase, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          child: Text(
            frame,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.yellow[400],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phase,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[300],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechDetailItem(
    String title,
    String description,
    List<String> features,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(fontSize: 15, color: Colors.grey[300], height: 1.5),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              features
                  .map(
                    (feature) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        feature,
                        style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildLearningItem(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        ...items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[300],
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildLayerItem(String layerName, String description, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                layerName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[300],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
