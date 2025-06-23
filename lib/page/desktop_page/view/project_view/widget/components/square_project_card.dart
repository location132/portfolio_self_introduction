import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SquareProjectCard extends StatefulWidget {
  final Map<String, String> project;
  final bool isVisible;
  final int index;
  final IconData icon;
  final bool showBadge;
  final String badgeText;

  const SquareProjectCard({
    super.key,
    required this.project,
    required this.isVisible,
    required this.index,
    required this.icon,
    this.showBadge = false,
    this.badgeText = '',
  });

  @override
  State<SquareProjectCard> createState() => _SquareProjectCardState();
}

class _SquareProjectCardState extends State<SquareProjectCard> {
  void _onHover(bool isHovered) {
    setState(() {});
  }

  void _onProjectTap(BuildContext context) {
    final title = widget.project['title'] ?? '';

    if (title == '선배 개발자 따라잡기 With GS_SHOP') {
      context.go('/project/gsshop');
    } else {
      context.go('/schedule');
    }
  }

  String _getImagePath() {
    final String title = widget.project['title'] ?? '';
    if (title == '선배 개발자 따라잡기 With GS_SHOP') {
      return 'assets/Images/project_img/gsshop_logo.jpeg';
    }
    return 'assets/Images/project_img/rive_flutter.png';
  }

  String _getUploadDate() {
    final title = widget.project['title'] ?? '';

    if (title == 'About Me - With myDream' ||
        title == 'MySkill - in Web' ||
        title == 'Detail Me') {
      return '11월 10일 업로드 예정';
    } else if (title == 'NaverMap') {
      return '7월 16일 업로드 예정';
    } else if (title == '클랭(KLANG)') {
      return '8월 20일 업로드 예정';
    } else if (title == '구름 x 카카오 x 인프런') {
      return '9월 14일 업로드 예정';
    }
    return '업로드 되었습니다!';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 200 + (widget.index * 50)),
      child: SizedBox(
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Text(
                _getUploadDate(),
                style: TextStyle(
                  fontSize: 10,
                  color:
                      _getUploadDate() == '업로드 되었습니다!'
                          ? Color.fromARGB(255, 100, 200, 255)
                          : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (_) => _onHover(true),
                onExit: (_) => _onHover(false),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _onProjectTap(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 300,
                    height: 300,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                _getImagePath(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 120,
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
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        widget.icon,
                                        size: 16,
                                        color: Colors.white.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          widget.project['title']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.project['tech']!,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white.withValues(
                                        alpha: 0.7,
                                      ),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
