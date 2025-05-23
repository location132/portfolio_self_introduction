import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

class TextAnimation extends StatefulWidget {
  final DesktopState state;
  final void Function(TickerProvider vsync)? initializeAnimations;

  const TextAnimation({
    super.key,
    required this.state,
    this.initializeAnimations,
  });

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.initializeAnimations?.call(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textWidgets = [];
    List<Widget> currentLineWidgets = [];
    if (widget.state.startAnimation == null) {
      return const SizedBox();
    } else {
      for (int i = 0; i < widget.state.startAnimation!.words.length; i++) {
        if (widget.state.startAnimation!.words[i] == '\n') {
          if (currentLineWidgets.isNotEmpty) {
            textWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.from(currentLineWidgets),
            ));
            currentLineWidgets.clear();
          }
          textWidgets.add(const SizedBox(height: 20));
        } else {
          currentLineWidgets.add(
            FadeTransition(
              opacity: widget.state.startAnimation!.animations[i],
              child: Text(
                widget.state.startAnimation!.words[i],
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                ),
              ),
            ),
          );
        }
      }
    }

    if (currentLineWidgets.isNotEmpty) {
      textWidgets.add(Wrap(
        alignment: WrapAlignment.center,
        spacing: 2,
        runSpacing: 4,
        children: List.from(currentLineWidgets),
      ));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.sw),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: textWidgets,
        ),
      ),
    );
  }
}
