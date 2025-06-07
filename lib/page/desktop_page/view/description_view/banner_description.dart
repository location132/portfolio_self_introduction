import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/widgets/banner_menu.dart';

class SectionDescription extends StatefulWidget {
  final DesktopState state;

  final Function(bool) isActive;

  const SectionDescription({
    super.key,
    required this.state,
    required this.isActive,
  });

  @override
  State<SectionDescription> createState() => _SectionDescriptionState();
}

class _SectionDescriptionState extends State<SectionDescription>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  bool _isSelected = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
  }

  @override
  void didUpdateWidget(covariant SectionDescription oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (Conditions.isBannerDescriptionActive(widget.state)) {
      _controller.forward();
      setState(() {
        _isSelected = true;
      });
    } else {
      _controller.reverse();
      setState(() {
        _isSelected = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: _isSelected ? 928 : 0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 168, 216, 243),
              Color.fromARGB(255, 127, 234, 161),
            ],
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(13),
            bottomRight: Radius.circular(13),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child:
            _isSelected
                ? Center(
                  child: MenuLayout(
                    isActive: widget.isActive,
                    state: widget.state,
                  ),
                )
                : const SizedBox.shrink(),
      ),
    );
  }
}
