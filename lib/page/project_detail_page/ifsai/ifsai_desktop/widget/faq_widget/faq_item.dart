import 'package:flutter/material.dart';

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isLast;
  final double screenWidth;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
    required this.isLast,
    required this.screenWidth,
  });

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
    // 화면 크기에 따른 폰트 크기와 패딩 조절
    double questionFontSize =
        widget.screenWidth > 1024 ? 18 : (widget.screenWidth > 600 ? 16 : 14);
    double answerFontSize =
        widget.screenWidth > 1024 ? 16 : (widget.screenWidth > 600 ? 14 : 12);
    double horizontalPadding = widget.screenWidth > 600 ? 20 : 16;
    double verticalPadding = widget.screenWidth > 600 ? 24 : 18;

    return Column(
      children: [
        // 질문 영역
        InkWell(
          onTap: _toggle,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 118, 239, 241),
                      fontSize: questionFontSize,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ),

                SizedBox(width: widget.screenWidth > 600 ? 16 : 12),

                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value * 3.14159,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: widget.screenWidth > 600 ? 24 : 20,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        // 답변 영역 (아코디언)
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child:
              _isExpanded
                  ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      0,
                      horizontalPadding,
                      verticalPadding,
                    ),
                    child: Text(
                      widget.answer,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: answerFontSize,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
        ),

        // 구분선 (마지막 항목이 아닌 경우에만 표시)
        if (!widget.isLast)
          Container(
            height: 1,
            color: Colors.grey[800],
            margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
          ),
      ],
    );
  }
}
