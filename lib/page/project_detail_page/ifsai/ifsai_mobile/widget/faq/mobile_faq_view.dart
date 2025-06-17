import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'mobile_faq_title.dart';
import 'mobile_faq_item.dart';

class MobileFaqView extends StatefulWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const MobileFaqView({super.key, required this.state, required this.cubit});

  @override
  State<MobileFaqView> createState() => _MobileFaqViewState();
}

class _MobileFaqViewState extends State<MobileFaqView>
    with TickerProviderStateMixin {
  bool _isFaqVisible = false;

  late AnimationController _titleAnimationController;
  late AnimationController _itemsAnimationController;
  late Animation<double> _titleAnimation;
  late Animation<double> _itemsAnimation;

  @override
  void initState() {
    super.initState();

    _titleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _itemsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _titleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _titleAnimationController, curve: Curves.easeOut),
    );

    _itemsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _itemsAnimationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    _itemsAnimationController.dispose();
    super.dispose();
  }

  void _onFaqVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 && !_isFaqVisible) {
      setState(() {
        _isFaqVisible = true;
      });
      widget.cubit.onFaqVisibilityChanged(1);
      widget.cubit.setFaqPlayerVisible(true);
      _titleAnimationController.forward();

      _titleAnimationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _itemsAnimationController.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return VisibilityDetector(
          key: const Key('mobile-faq-section'),
          onVisibilityChanged: _onFaqVisibilityChanged,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                // FAQ 타이틀
                AnimatedBuilder(
                  animation: _titleAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 50 * (1 - _titleAnimation.value)),
                      child: Opacity(
                        opacity: _titleAnimation.value,
                        child: MobileFaqTitle(
                          currentTitleIndex: state.currentFaqTitleIndex,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 40.h),

                // FAQ 아이템
                AnimatedBuilder(
                  animation: _itemsAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 30 * (1 - _itemsAnimation.value)),
                      child: Opacity(
                        opacity: _itemsAnimation.value,
                        child: Column(
                          children:
                              TitleTextConstants.faqData.asMap().entries.map((
                                entry,
                              ) {
                                int index = entry.key;
                                Map<String, String> faq = entry.value;
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: MobileFaqItem(
                                    question: faq['question']!,
                                    answer: faq['answer']!,
                                    isLastItem:
                                        index ==
                                        TitleTextConstants.faqData.length - 1,
                                    animationDelay: Duration(
                                      milliseconds: index * 100,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
