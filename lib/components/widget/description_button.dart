import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/air_bubble.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class DescriptionButton extends StatefulWidget {
  final Function() onTap;
  final MainPageState state;
  const DescriptionButton(
      {super.key, required this.onTap, required this.state});

  @override
  State<DescriptionButton> createState() => _DescriptionButtonState();
}

class _DescriptionButtonState extends State<DescriptionButton> {
  bool isVisible = true;

  @override
  void didUpdateWidget(covariant DescriptionButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state.descriptionModel.bannerDescriptionState !=
        oldWidget.state.descriptionModel.bannerDescriptionState) {
      final isInactive = widget.state.descriptionModel.bannerDescriptionState ==
          BannerDescriptionState.inactive;
      _test(isInactive);
    }
  }

  void _test(bool test) async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isVisible = test;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: isVisible
              ? Visibility(
                  visible: isVisible,
                  child: GestureDetector(
                      onTap: widget.onTap,
                      child: const SizedBox(
                        height: 150,
                        width: 150,
                        child: AirBubble(),
                      )),
                )
              : const SizedBox(height: 150),
        ),
      ],
    );
  }
}
