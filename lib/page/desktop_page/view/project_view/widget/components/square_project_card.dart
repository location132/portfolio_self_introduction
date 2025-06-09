import 'package:flutter/material.dart';

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

  String _getImagePath() {
    final title = widget.project['title'] ?? '';

    if (title == '선배 개발자 따라잡기 With GS_SHOP') {
      return 'assets/Images/project_img/gsshop_logo.jpeg';
    } else if (title == '선배 개발자 따라잡기 With IDUS') {
      return 'assets/Images/project_img/idus_logo.png';
    }
    return 'assets/Images/project_img/gsshop_logo.jpeg';
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        _getImagePath(),
        fit: BoxFit.cover,
        alignment: Alignment.center,
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
                          Row(
                            children: [
                              if (widget.showBadge)
                                Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        204,
                                        250,
                                        248,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    widget.badgeText,
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: Color.fromARGB(255, 204, 250, 248),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  widget.project['title']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.project['description']!,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withValues(alpha: 0.9),
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                            child: Text(
                              widget.project['tech']!,
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.white.withValues(alpha: 0.9),
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
    );
  }
}
