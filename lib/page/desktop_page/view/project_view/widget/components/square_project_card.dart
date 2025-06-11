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
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  void _onProjectTap(BuildContext context) {
    final title = widget.project['title'] ?? '';

    String route;
    switch (title) {
      case '선배 개발자 따라잡기 With GS_SHOP':
        route = '/project/gsshop';
        break;
      case '선배 개발자 따라잡기 With IDUS':
        route = '/project/idus';
        break;
      case 'About Me - With myDream':
        route = '/project/about-me';
        break;
      case 'MySkill - in Web':
        route = '/project/myskill';
        break;
      case 'Detail Me':
        route = '/project/detail-me';
        break;
      default:
        route = '/projects';
    }

    context.push(route);
  }

  String _getImagePath() {
    final title = widget.project['title'] ?? '';

    if (title == '선배 개발자 따라잡기 With GS_SHOP') {
      return 'assets/Images/project_img/gsshop_logo.jpeg';
    } else if (title == '선배 개발자 따라잡기 With IDUS') {
      return 'assets/Images/project_img/idus_logo.png';
    }
    return 'assets/Images/project_img/rive_flutter.png';
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding:
              _getImagePath() == 'assets/Images/project_img/rive_flutter.png'
                  ? const EdgeInsets.symmetric(vertical: 20)
                  : const EdgeInsets.all(0),
          child: Image.asset(
            _getImagePath(),
            fit: BoxFit.contain,
            alignment:
                _getImagePath() == 'assets/Images/project_img/rive_flutter.png'
                    ? Alignment.topCenter
                    : Alignment.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 200 + (widget.index * 50)),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _onProjectTap(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: _isHovered ? 310 : 300,
            height: _isHovered ? 310 : 300,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color:
                    _isHovered
                        ? Colors.white.withValues(alpha: 0.3)
                        : Colors.white.withValues(alpha: 0.1),
                width: _isHovered ? 2 : 1,
              ),
              boxShadow:
                  _isHovered
                      ? [
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.1),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ]
                      : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
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
                          children: [
                            if (widget.showBadge && widget.badgeText.isNotEmpty)
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  widget.badgeText,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            Row(
                              children: [
                                Icon(
                                  widget.icon,
                                  size: 16,
                                  color: Colors.white.withValues(alpha: 0.8),
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
                                color: Colors.white.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
    );
  }
}
