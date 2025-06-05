import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class SelectTapDesktop extends StatelessWidget {
  const SelectTapDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: '코딩'),
                Tab(text: '상태관리'),
                Tab(text: '생명주기'),
                Tab(text: '애니메이션'),
                Tab(text: '협업툴'),
              ],
            ),
            SizedBox(
              height: 400.h,
              child: TabBarView(
                children: [
                  SelectTapTabItem(
                    key: const ValueKey('coding'),
                    category: 'coding',
                    isAnimationStart: true,
                  ),
                  SelectTapTabItem(
                    key: const ValueKey('state_management'),
                    category: 'state_management',
                    isAnimationStart: true,
                  ),
                  SelectTapTabItem(
                    key: const ValueKey('lifecycle'),
                    category: 'lifecycle',
                    isAnimationStart: true,
                  ),
                  SelectTapTabItem(
                    key: const ValueKey('animation'),
                    category: 'animation',
                    isAnimationStart: true,
                  ),
                  SelectTapTabItem(
                    key: const ValueKey('collaboration'),
                    category: 'collaboration',
                    isAnimationStart: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTapTabItem extends StatelessWidget {
  final String category;
  final bool isAnimationStart;

  const SelectTapTabItem({
    super.key,
    required this.category,
    required this.isAnimationStart,
  });

  SelectTapItemData _getDataForCategory() {
    switch (category) {
      case 'coding':
        return SelectTapItemData(
          myStackTitle: SelectTapTextConstants.myStackTitle1,
          myStack: SelectTapTextConstants.myStack1,
          title: SelectTapTextConstants.selectTapTitle1,
          description: SelectTapTextConstants.selectTapDescription1,
          finalMessage: SelectTapTextConstants.selectTapFinalMessage1,
        );
      case 'state_management':
        return SelectTapItemData(
          myStackTitle: SelectTapTextConstants.myStackTitle2,
          myStack: SelectTapTextConstants.myStack2,
          title: SelectTapTextConstants.selectTapTitle2,
          description: SelectTapTextConstants.selectTapDescription2,
          finalMessage: SelectTapTextConstants.selectTapFinalMessage2,
        );
      case 'lifecycle':
        return SelectTapItemData(
          myStackTitle: SelectTapTextConstants.myStackTitle3,
          myStack: SelectTapTextConstants.myStack3,
          title: SelectTapTextConstants.selectTapTitle3,
          description: SelectTapTextConstants.selectTapDescription3,
          finalMessage: SelectTapTextConstants.selectTapFinalMessage3,
        );
      case 'animation':
        return SelectTapItemData(
          myStackTitle: SelectTapTextConstants.myStackTitle4,
          myStack: SelectTapTextConstants.myStack4,
          title: SelectTapTextConstants.selectTapTitle4,
          description: SelectTapTextConstants.selectTapDescription4,
          finalMessage: SelectTapTextConstants.selectTapFinalMessage4,
        );
      case 'collaboration':
        return SelectTapItemData(
          myStackTitle: SelectTapTextConstants.myStackTitle5,
          myStack: SelectTapTextConstants.myStack5,
          title: SelectTapTextConstants.selectTapTitle5,
          description: SelectTapTextConstants.selectTapDescription5,
          finalMessage: SelectTapTextConstants.selectTapFinalMessage5,
        );
      default:
        return SelectTapItemData(title: '', description: '', finalMessage: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SelectTapOverview(
        key: ValueKey('select_tap_overview_$category'),
        data: _getDataForCategory(),
        isAnimationStart: isAnimationStart,
      ),
    );
  }
}

class SelectTapItemData {
  final String? myStackTitle;
  final String? myStack;
  final String title;
  final String description;
  final String finalMessage;

  SelectTapItemData({
    this.myStackTitle,
    this.myStack,
    required this.title,
    required this.description,
    required this.finalMessage,
  });
}

class SelectTapOverview extends StatefulWidget {
  final SelectTapItemData data;
  final bool isAnimationStart;
  const SelectTapOverview({
    super.key,
    required this.data,
    required this.isAnimationStart,
  });

  @override
  State<SelectTapOverview> createState() => _SelectTapOverviewState();
}

class _SelectTapOverviewState extends State<SelectTapOverview>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isAnimationStart) {
        _startSequentialAnimation();
      }
    });
  }

  void _initializeAnimations() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _controllers.clear();
    _slideAnimations.clear();
    _opacityAnimations.clear();
    for (int i = 0; i < 2; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
      _controllers.add(controller);

      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      );
      _slideAnimations.add(slideAnimation);

      final opacityAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
      _opacityAnimations.add(opacityAnimation);
    }
  }

  @override
  void didUpdateWidget(SelectTapOverview oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isAnimationStart != widget.isAnimationStart) {
      if (widget.isAnimationStart) {
        _startSequentialAnimation();
      } else {
        _resetAnimations();
      }
    }
  }

  void _startSequentialAnimation() async {
    for (var controller in _controllers) {
      controller.reset();
    }

    await Future.delayed(const Duration(milliseconds: 100));

    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _controllers[i].forward();
        }
      });
    }
  }

  void _resetAnimations() {
    for (var controller in _controllers) {
      controller.reset();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        SlideTransition(
          position: _slideAnimations[0],
          child: FadeTransition(
            opacity: _opacityAnimations[0],
            child: MyStack(
              myStackTitle: widget.data.myStackTitle,
              myStack: widget.data.myStack,
            ),
          ),
        ),

        const SizedBox(height: 40),

        SlideTransition(
          position: _slideAnimations[1],
          child: FadeTransition(
            opacity: _opacityAnimations[1],
            child: Center(
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.data.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: widget.data.description,
                      style: TextStyle(
                        fontSize: 13.0.sp,
                        color: const Color.fromARGB(255, 166, 166, 166),
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: widget.data.finalMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyStack extends StatelessWidget {
  final String? myStackTitle;
  final String? myStack;
  const MyStack({super.key, this.myStackTitle, this.myStack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              myStackTitle ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              myStack ?? '',
              style: TextStyle(
                fontSize: 12.0.sp,
                color: const Color.fromARGB(255, 166, 166, 166),
                height:
                    myStackTitle == SelectTapTextConstants.myStackTitle3
                        ? 1.5.sp
                        : 2.2.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
