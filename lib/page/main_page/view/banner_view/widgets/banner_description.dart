import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/banner_view/widgets/circle_menu.dart';

class BannerDescription extends StatefulWidget {
  final MainPageState state;
  final Function(bool) isActive;

  const BannerDescription({
    super.key,
    required this.state,
    required this.isActive,
  });

  @override
  State<BannerDescription> createState() => _BannerDescriptionState();
}

class _BannerDescriptionState extends State<BannerDescription>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;

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
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void didUpdateWidget(covariant BannerDescription oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.descriptionModel.bannerDescriptionState ==
        BannerDescriptionState.active) {
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

  void _onClose() {
    _controller.reverse();
    setState(() {
      _isSelected = false;
    });
    widget.isActive(false);
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
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: _isSelected ? MediaQuery.of(context).size.height - 400 : 0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 168, 216, 243),
                Color.fromARGB(255, 127, 234, 161)
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
          child: _isSelected
              ? Stack(
                  children: [
                    Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: _onClose,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withAlpha(70),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const Center(child: CircleMenu())
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
