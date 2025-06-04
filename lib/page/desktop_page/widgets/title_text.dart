import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/text/styled_text.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class TitleText extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final double? titleFontSize;
  final String? description;
  final Color? color;
  final Color? titleColor;
  final Color? subTitleColor;
  final bool isVisible; // 애니메이션 트리거

  const TitleText({
    super.key,
    this.title,
    this.subTitle,
    this.titleFontSize,
    this.description,
    this.color,
    this.titleColor,
    this.subTitleColor,
    this.isVisible = true,
  });

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _subTitleController;
  late AnimationController _descriptionController;

  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _titleOpacityAnimation;

  late Animation<Offset> _subTitleSlideAnimation;
  late Animation<double> _subTitleOpacityAnimation;

  late Animation<Offset> _descriptionSlideAnimation;
  late Animation<double> _descriptionOpacityAnimation;

  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();

    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );

    _subTitleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );

    _descriptionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );

    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeInOut),
    );

    _titleOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeInOut),
    );

    // 서브타이틀 애니메이션
    _subTitleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _subTitleController, curve: Curves.easeInOut),
    );

    _subTitleOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _subTitleController, curve: Curves.easeInOut),
    );

    // 설명 애니메이션
    _descriptionSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _descriptionController, curve: Curves.easeInOut),
    );

    _descriptionOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _descriptionController, curve: Curves.easeInOut),
    );

    if (widget.isVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_hasAnimated) {
          _startAnimations();
        }
      });
    }
  }

  @override
  void didUpdateWidget(TitleText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !oldWidget.isVisible && !_hasAnimated) {
      _startAnimations();
    } else if (!widget.isVisible && oldWidget.isVisible) {
      _reverseAnimations();
      _hasAnimated = false;
    }
  }

  void _startAnimations() {
    if (_hasAnimated) return;

    _hasAnimated = true;
    _titleController.forward();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _subTitleController.forward();
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _descriptionController.forward();
    });
  }

  void _reverseAnimations() {
    _descriptionController.reverse();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _subTitleController.reverse();
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _titleController.reverse();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 132.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.title != null && widget.title!.isNotEmpty)
                SlideTransition(
                  position: _titleSlideAnimation,
                  child: FadeTransition(
                    opacity: _titleOpacityAnimation,
                    child: StyledText.heading(
                      text: widget.title!,
                      fontSize: widget.titleFontSize ?? 38,
                      color: widget.titleColor ?? widget.color,
                    ),
                  ),
                ),

              if (widget.subTitle != null && widget.subTitle!.isNotEmpty)
                SlideTransition(
                  position: _subTitleSlideAnimation,
                  child: FadeTransition(
                    opacity: _subTitleOpacityAnimation,
                    child: StyledText.subHeading(
                      text: widget.subTitle!,
                      color: widget.subTitleColor,
                    ),
                  ),
                ),
            ],
          ),

          if (widget.description != null && widget.description!.isNotEmpty)
            SlideTransition(
              position: _descriptionSlideAnimation,
              child: FadeTransition(
                opacity: _descriptionOpacityAnimation,
                child: StyledText.subHeading(
                  text: widget.description!,
                  color: widget.subTitleColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
