import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class ImageTitleWithProfile extends StatefulWidget {
  final int stateScrollCount;
  final int scrollCount;
  final String imagePath;
  final String imageTitle;
  final String title;
  final String description;
  const ImageTitleWithProfile(
      {super.key,
      required this.stateScrollCount,
      required this.scrollCount,
      required this.imagePath,
      required this.imageTitle,
      required this.title,
      required this.description});

  @override
  State<ImageTitleWithProfile> createState() => _ImageTitleWithProfileState();
}

class _ImageTitleWithProfileState extends State<ImageTitleWithProfile>
    with SingleTickerProviderStateMixin {
  late AnimationController _textAnimationController;

  late Animation<Offset> _slideTextAnimation;
  late Animation<double> _fadeTextAnimation;

  bool _isImageOpacirt = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 720),
    );

    _slideTextAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeOut,
    ));

    _fadeTextAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ImageTitleWithProfile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stateScrollCount == widget.scrollCount) {
      if (!_isAnimating) {
        _onImageOpacityChanged();
      }
    } else if (_isAnimating) {
      _isReverse();
    }
  }

  void _onImageOpacityChanged() async {
    setState(() {
      _isImageOpacirt = true;
    });

    await Future.delayed(const Duration(milliseconds: 300));
    await _textAnimationController.forward();
    setState(() {
      _isAnimating = true;
    });
  }

  void _isReverse() async {
    await _textAnimationController.reverse();
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: VisibleorOpacityCondition.isImageTitleOpacity(
            widget.stateScrollCount, widget.scrollCount),
        duration: const Duration(milliseconds: 720),
        child: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: 620.sw,
                    constraints: BoxConstraints(
                      maxWidth: 720.sh,
                    ),
                    child: AnimatedOpacity(
                      opacity: _isImageOpacirt ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Text(
                              widget.imageTitle,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 60.sh),
                  FadeTransition(
                    opacity: _fadeTextAnimation,
                    child: SlideTransition(
                      position: _slideTextAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.85),
                                height: 1.5,
                              ),
                              children:
                                  _buildHighlightedText(widget.description),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildHighlightedText(String text) {
    final List<TextSpan> spans = [];
    final RegExp highlightRegex = RegExp(r'"([^"]+)"');

    int currentPosition = 0;

    for (final Match match in highlightRegex.allMatches(text)) {
      if (match.start > currentPosition) {
        spans.add(TextSpan(
          text: text.substring(currentPosition, match.start),
        ));
      }

      spans.add(TextSpan(
        text: match.group(0),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ));

      currentPosition = match.end;
    }

    if (currentPosition < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentPosition),
      ));
    }

    return spans;
  }
}
