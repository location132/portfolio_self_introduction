import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatefulWidget {
  final Map<String, String> project;
  final bool isVisible;
  final int index;
  final IconData icon;
  final bool showBadge;
  final String badgeText;

  const ProjectCard({
    super.key,
    required this.project,
    required this.isVisible,
    required this.index,
    required this.icon,
    this.showBadge = false,
    this.badgeText = '',
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  int _gifInstanceKey = 0;
  bool _isCalled = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;

      if (isHovered && widget.project['title'] == 'NaverMap') {
        _gifInstanceKey++;
      }
    });
  }

  String _getBadgeText() {
    final title = widget.project['title'] ?? '';
    switch (title) {
      case '잎사이':
        return '자세히 보실 수 있습니다';
      case 'NaverMap':
        return '7월 16일 업로드 예정';
      case '클랭(KLANG)':
        return '8월 20일 업로드 예정';
      case '구름 x 카카오 x 인프런':
        return '9월 14일 업로드 예정';
      case '모바일 웹 프로젝트':
        return '10월 20일 업로드 예정';
      case '악보 넘기기':
        return '곧 시작합니다!';
      case 'CCTV View':
        return '곧 시작합니다!';
      case '맞춤 건강 알림':
        return '곧 시작합니다!';
      default:
        return '업로드 예정';
    }
  }

  Color _getBadgeColor() {
    final title = widget.project['title'] ?? '';
    if (title == '잎사이') {
      return const Color.fromARGB(255, 100, 200, 255);
    }
    return Colors.grey;
  }

  void _onProjectTap(BuildContext context) async {
    if (_isCalled) {
      return;
    }
    setState(() {
      _isCalled = true;
    });

    final title = widget.project['title'] ?? '';

    String route;
    if (title == '잎사이') {
      route = '/project/ifsai';
    } else if (title == '악보 넘기기' ||
        title == 'CCTV View' ||
        title == '맞춤 건강 알림') {
      return;
    } else {
      route = '/schedule';
    }

    context.push(route);
    setState(() {
      _isCalled = false;
    });
  }

  String _getImagePath(bool isHovered) {
    final title = widget.project['title'] ?? '';

    if (title == '잎사이') {
      return isHovered
          ? 'assets/Images/project_img/ifsai_2.png'
          : 'assets/Images/project_img/ifsai_1.png';
    } else if (title == '클랭(KLANG)') {
      return isHovered
          ? 'assets/Images/project_img/Klang_2.png'
          : 'assets/Images/project_img/Klang_1.png';
    } else if (title == 'NaverMap') {
      return isHovered
          ? 'assets/Images/project_img/naver_map_2.gif'
          : 'assets/Images/project_img/naver_map_1.png';
    } else if (title == '모바일 웹 프로젝트') {
      return isHovered
          ? 'assets/Images/project_img/web_project_mobile_1.png'
          : 'assets/Images/project_img/web_project_mobile_2.png';
    } else if (title == 'About Me - With myDream') {
      return isHovered
          ? 'assets/Images/project_img/rive_pro2_2.png'
          : 'assets/Images/project_img/rive_pro2_1.png';
    } else if (title == 'MySkill - in Web') {
      return isHovered
          ? 'assets/Images/project_img/rive_pro1_2.png'
          : 'assets/Images/project_img/rive_pro1_1.png';
    } else if (title == 'Detail Me') {
      return isHovered
          ? 'assets/Images/project_img/rive_pro3_2.png'
          : 'assets/Images/project_img/rive_pro3_1.png';
    } else if (title == '악보 넘기기' ||
        title == 'CCTV View' ||
        title == '맞춤 건강 알림') {
      return '';
    } else {
      return isHovered
          ? 'assets/Images/project_img/groom_2.png'
          : 'assets/Images/project_img/groom_1.png';
    }
  }

  Widget _buildImage() {
    final title = widget.project['title'] ?? '';

    if (title == '악보 넘기기' || title == 'CCTV View' || title == '맞춤 건강 알림') {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.grey.withValues(alpha: 0.1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 80,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
                const SizedBox(height: 16),
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            opacity: _isHovered ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                _getImagePath(false),
                key: ValueKey('${title}_default'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _isHovered ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                _getImagePath(true),
                key: ValueKey('${title}_hover_$_gifInstanceKey'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 200 + (widget.index * 50)),
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getBadgeColor().withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _getBadgeColor(), width: 1),
              ),
              child: Text(
                _getBadgeText(),
                style: TextStyle(
                  fontSize: 10,
                  color: _getBadgeColor(),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Flexible(
              // 프로젝트 카드를 Flexible로 감싸기
              child: MouseRegion(
                onEnter: (_) => _onHover(true),
                onExit: (_) => _onHover(false),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    _onProjectTap(context);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 330,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:
                            _isHovered
                                ? Colors.white.withValues(alpha: 0.3)
                                : Colors.white.withValues(alpha: 0.1),
                        width: _isHovered ? 2 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 330 / 580,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned.fill(child: _buildImage()),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: AnimatedOpacity(
                                opacity: _isHovered ? 0.0 : 1.0,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.8),
                                        Colors.black.withValues(alpha: 0.95),
                                      ],
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        widget.project['title']!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        widget.project['description']!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white.withValues(
                                            alpha: 0.9,
                                          ),
                                          height: 1.4,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: Colors.white.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                        child: Text(
                                          widget.project['tech']!,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white.withValues(
                                              alpha: 0.9,
                                            ),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
