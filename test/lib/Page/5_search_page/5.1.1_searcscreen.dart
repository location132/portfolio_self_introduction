import 'package:flutter/material.dart';
import 'package:my_dream/Page/5_search_page/5.2_search_logic.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class MainSearcscreen extends StatefulWidget {
  final VoidCallback onClose;

  const MainSearcscreen({super.key, required this.onClose});

  @override
  State<MainSearcscreen> createState() => _MainSearcscreenState();
}

class _MainSearcscreenState extends State<MainSearcscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 0, end: 0.825)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      Future.microtask(() {
        final searchModel = Provider.of<SearchBarModel>(context, listen: false);
        if (status == AnimationStatus.dismissed ||
            status == AnimationStatus.completed) {
          searchModel.setresultSearchAni(true);
          if (status == AnimationStatus.dismissed) {
            widget.onClose();
          }
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchModel = Provider.of<SearchBarModel>(context, listen: false);
      if (searchModel.isSearchScreen) {
        searchModel.setresultSearchAni(false);
        _controller.forward();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final searchModel = Provider.of<SearchBarModel>(context);

    Future.microtask(() {
      if (_controller.status == AnimationStatus.dismissed &&
          searchModel.isSearchScreen) {
        searchModel.setresultSearchAni(false);
        _controller.forward();
      } else if (_controller.status == AnimationStatus.completed &&
          !searchModel.isSearchScreen) {
        // 검색창 닫기
        searchModel.setresultSearchAni(false);
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (context, child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: screenHeight * _heightAnimation.value,
            child: const SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Material(
                color: Colors.white,
                child: Center(
                  child: SearchLogic(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
