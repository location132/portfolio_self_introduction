import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/project_detail_page/animation/ifsai_title_animation.dart';

class ProjectDetailTitle extends StatefulWidget {
  final IfsaiModel model;
  final Function(bool) onScrollChange;

  const ProjectDetailTitle({
    super.key,
    required this.model,
    required this.onScrollChange,
  });

  @override
  State<ProjectDetailTitle> createState() => _ProjectDetailTitleState();
}

class _ProjectDetailTitleState extends State<ProjectDetailTitle>
    with TickerProviderStateMixin {
  late IfsaiDetailAnimation _animation;
  bool _isSubTitleStart = false;
  bool _isDescriptionStart = false;

  @override
  void initState() {
    super.initState();
    _animation = IfsaiDetailAnimation();
    _animation.initialize(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onScrollChange(false);
      _animation.startAnimation();
      smallTitleAnimation();
    });
  }

  void smallTitleAnimation() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      setState(() {
        _isSubTitleStart = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        _isDescriptionStart = true;
        widget.onScrollChange(true);
      });
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 83,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetAnimation(
                    isStart: _isSubTitleStart,
                    child: Text(
                      widget.model.projectName,
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withValues(alpha: 0.8),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      AnimatedBuilder(
                        animation: _animation.controller,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _animation.projectNameEnOpacity,
                            child: FadeTransition(
                              opacity: _animation.textToLogoFade,
                              child: Text(
                                widget.model.projectNameEn,
                                style: const TextStyle(
                                  fontSize: 120,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  height: 1.1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _animation.controller,
                        builder: (context, child) {
                          return ScaleTransition(
                            scale: _animation.logoScale,
                            child: FadeTransition(
                              opacity: _animation.logoOpacity,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Image.asset(
                                  'assets/Images/ifSai.png',
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AnimatedBuilder(
                    animation: _animation.controller,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _animation.dividerOpacity,
                        child: Container(
                          height: 7,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(
                                  255,
                                  72,
                                  159,
                                  25,
                                ).withValues(alpha: 0.8),
                                const Color.fromARGB(
                                  255,
                                  129,
                                  249,
                                  118,
                                ).withValues(alpha: 0.1),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: WidgetAnimation(
                isStart: _isDescriptionStart,
                child: Text(
                  '지루하지않게 저에 관해서 궁금한 것만 보여드리겠습니다.',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
