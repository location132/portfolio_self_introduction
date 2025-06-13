import 'package:flutter/material.dart';

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isLast;

  const FaqItem({
    Key? key,
    required this.question,
    required this.answer,
    required this.isLast,
  }) : super(key: key);

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 질문 영역
        InkWell(
          onTap: _toggle,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              children: [
                // 질문 텍스트
                Expanded(
                  child: Text(
                    widget.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // 펼치기/접기 아이콘
                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value * 3.14159, // 180도 회전
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 24,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        // 답변 영역 (아코디언)
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: Text(
              widget.answer,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16,
                fontWeight: FontWeight.w300,
                height: 1.6,
              ),
            ),
          ),
          crossFadeState:
              _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),

        // 구분선 (마지막 항목이 아닌 경우에만 표시)
        if (!widget.isLast)
          Container(
            height: 1,
            color: Colors.grey[800],
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
      ],
    );
  }
}
